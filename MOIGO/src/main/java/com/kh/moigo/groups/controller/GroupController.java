package com.kh.moigo.groups.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.moigo.groups.model.service.GroupsService;
import com.kh.moigo.groups.model.vo.GroupMember;

@Controller
public class GroupController {
	
	@Autowired
	private GroupsService groupService;

	@RequestMapping("/groups/groupsTest.do")
	public String groupTest(){
		
		return "groups/groupMain";
	}
	
	@RequestMapping("/groups/createGroup.do")
	public String groupCreate(){
		
		return "groups/createGroup";
	}
	
	// ------------------------------------------------------------------ 혜진
	
	@RequestMapping("/groups/groupMember.gp")
	public String goGroupMember(@RequestParam String groupNo, Model model){
		
		//	들어갈 때 그룹에 해당하는 멤버 리스트를 가지고 들어가야 함
		List<Map<String, String>> groupMemberList = groupService.selectGroupMemberList(groupNo);
		
		model.addAttribute("groupMemberList", groupMemberList);
		
		return "groups/groupMember";
	}
	
	@RequestMapping("/groups/searchGroupMember.gp")
	public String searchGroupMember(@RequestParam String groupNo, @RequestParam String searchName, Model model){
		
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("groupNo", groupNo);
		searchMap.put("searchName", searchName);
		
		List<Map<String, String>> searchGroupMemberList = groupService.searchGroupMemberList(searchMap);
		
		model.addAttribute("searchGroupMemberList", searchGroupMemberList);
		
		return "groups/groupMember";
	}
	
	@RequestMapping(value="/groups/updateGroupMember.gp", method=RequestMethod.POST)
	public String updateGroupMember(GroupMember groupMember, @RequestParam MultipartFile uploadProfile, @RequestParam String resizeProfile, 
									HttpServletRequest request, Model model){
		
		String profileThumb = "";
		String profileImg = "";
		
		try{		
			// 1. dataUrl 방식으로 받아온 resizeProfile이 NULL이 아니라면 파일로 저장하기
			if(!resizeProfile.isEmpty()){
				BufferedImage resizeImage = null;
				
				// image/png;base64 부분을 버리기 위해서 split으로 나눔
				String[] base64Arr = resizeProfile.split(",");
				// base64 형식의 데이터를 byte로 복호화
				byte[] imageByte =  Base64.decodeBase64(base64Arr[1]);
				
				ByteArrayInputStream bais = new ByteArrayInputStream(imageByte);
				// ByteArrayInputStream으로 복호화한 byte 파일을 imageIO로 읽어옴
				resizeImage = ImageIO.read(bais);
				bais.close();
				
				// 프로필 이미지를 저장할 경로
				String saveDir = request.getSession().getServletContext().getRealPath("/resources/images/profiles/" + groupMember.getGroupNo());
				
				// 경로도 하나의 파일이기 때문에 경로를 생성해 줌
				File dir = new File(saveDir);
				
				if(!dir.exists())
					dir.mkdirs();
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
				
				profileThumb = "thumb_" + groupMember.getMemberNo() + "_" + sdf.format(new Date(System.currentTimeMillis())) + ".png";
				
				File thumbFile = new File(saveDir + "/" + profileThumb);
				
				ImageIO.write(resizeImage, "png", thumbFile);	
				
				// 2. upload한 file을 rename, 경로 저장하기
				String fileName = uploadProfile.getOriginalFilename();
				String ext = fileName.substring(fileName.lastIndexOf(".")+1);
				
				profileImg = "img_" + groupMember.getMemberNo() + "_" + sdf.format(new Date(System.currentTimeMillis())) + "." + ext;
				
				uploadProfile.transferTo(new File(saveDir +"/"+ profileImg));
				
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		// 3. groupMember에 담아서 update하기
		groupMember.setProfileImg(profileImg);
		groupMember.setProfileThumb(profileThumb);
		
		int result;
		result = groupService.updateGroupMember(groupMember);
		
		// 만약 upload한 이미지가 기존 이미지랑 다르다면 삭제? -> 이름 포맷에 날짜 넣기
		
		return "redirect:/groups/groupMember.gp?groupNo="+ groupMember.getGroupNo();
	}
	
	
	@RequestMapping(value="/groups/groupSchedule.gp", method=RequestMethod.POST)
	public String groupSchedule(){
		
		return "groups/groupSchedule";
	}
	
	@RequestMapping("/groups/groupSetting.gp")
	public String groupSetting(){
		
		return "groups/groupSetting";
	}

}
