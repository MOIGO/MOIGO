package com.kh.moigo.groups.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.groups.model.service.GroupsService;
import com.kh.moigo.groups.model.vo.GroupMember;
import com.kh.moigo.groups.model.vo.Groups;
import com.kh.moigo.groups.model.vo.Post;
import com.kh.moigo.groups.model.vo.PostReply;
import com.kh.moigo.groups.model.vo.PostWithMem;
import com.kh.moigo.groups.model.vo.Schedule;
import com.kh.moigo.member.model.vo.Member;

import oracle.sql.TIMESTAMP;

@Controller
public class GroupController {
	
	@Autowired
	private GroupsService groupService;

	@RequestMapping("/groups/groupMain.gp")
	public String groupMain(@RequestParam(value="groupNo", defaultValue="G007")String groupNo ,HttpServletRequest request,Model model){
		
		//세션에서 멤버 가져옴
		Member m = (Member)(request.getSession().getAttribute("m"));
		
		//멤버 널 아니면
		if(m!=null){
			//그룹에 있는지 확인하고
			GroupMember gm = groupService.selectOneMember(new GroupMember(m.getMemberNo(),groupNo));
			
			//그룹에 있으면
			if(gm!=null)
				model.addAttribute("memberGrade",gm.getMemberGradeCode()); //권한 컬럼을 뷰에 리턴
			else
				model.addAttribute("memberGrade",-1); //없으면(가입 안되있으면) -1 리턴
		}else
			model.addAttribute("memberGrade",-1);//멤버가 아니어도 -1 리턴
		
		model.addAttribute("groupNo",groupNo); //그룹 번호도 뷰로 보냄
		
		return "groups/groupMain";
	}

	
	//그룹 만드는 페이지 넘어가기
	@RequestMapping("/groups/createGroup.gp")
	public String createGroup(){
		
		return "groups/createGroup";
	}
	
	//그룹 만들고 커버파일 있으면 저장하기
	@RequestMapping(value="/groups/createGroupEnd.gp", method=RequestMethod.POST)
	public String createGroupEnd(Groups group,@RequestParam String memberNo, 
												@RequestParam MultipartFile groupImageFile,
												@RequestParam String groupDefaultImg,
												HttpServletRequest request)
	{
		String groupPicture = "";
		
		
		int result =  groupService.createGroup(group);
		
		
		
		if(groupImageFile!=null&&groupImageFile.getOriginalFilename().length()>0){
			try{		
				System.out.println("이미지 파일이 있는 경우"+groupImageFile.getOriginalFilename()+groupImageFile.getOriginalFilename().length() );
				// 프로필 이미지를 저장할 경로
				String saveDir = request.getSession().getServletContext().getRealPath("/resources/images/groupCovers/" + group.getGroupNo());
				
				// 경로도 하나의 파일이기 때문에 경로를 생성해 줌
				File dir = new File(saveDir);
				
				if(!dir.exists())
					dir.mkdirs();
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
				
				groupPicture = "cover_" + group.getGroupNo() + "_" + sdf.format(new Date(System.currentTimeMillis()));
				
				
				// 2. upload한 file을 rename, 경로 저장하기
				String fileName = groupImageFile.getOriginalFilename();
				String ext = fileName.substring(fileName.lastIndexOf(".")+1);
				groupPicture = groupPicture + "." + ext;
				
				groupImageFile.transferTo(new File(saveDir +"/"+ groupPicture));
					
				
			}
			catch(Exception e){
				e.printStackTrace();
			}
			
			
			group.setGroupPicture(groupPicture);
			
			
			
			result = groupService.updateGroupImg(group);
		}else{
			System.out.println("이미지 파일이 없는 경우");
			group.setGroupPicture(groupDefaultImg);
			groupService.updateGroupImg(group);
		}
		
		groupService.insertGroupMember(new GroupMember(memberNo,group.getGroupNo(),3));
		
		return "redirect:/groups/groupMain.gp?groupNo="+ group.getGroupNo();

	}
	
	//그룹 글 검색한 글 리스트 가져오기
	@RequestMapping("/groups/getKeywordPostList.gp")
	@ResponseBody
	public Map<String,Object> getKeywordPostList(@RequestParam String groupNo, 
												@RequestParam int currPage,
												@RequestParam String keyword, Model model){
		
		PageInfo p = new PageInfo(currPage, groupService.selectKeywordPostCnt(groupNo,keyword),7);
		
		/*ArrayList<PostWithMem> list = groupService.selectPostList(groupNo, p);*/
		ArrayList<PostWithMem> list = groupService.selectKeywordPost(groupNo, keyword ,p);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("posts", list);
		map.put("pageInfo", p);
		
		
		return map;
	}
	
	//그룹 메인에 글 가져오기
	@RequestMapping("/groups/getPostList.gp")
	@ResponseBody
	public Map<String,Object> getPostList(@RequestParam String groupNo, @RequestParam int currPage,Model model){
		
		PageInfo p = new PageInfo(currPage, groupService.selectPostCnt(groupNo),7);
		
		ArrayList<PostWithMem> list = groupService.selectPostList(groupNo, p);
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("posts", list);
		map.put("pageInfo", p);
		
		
		return map;
	}
	
	//그룹 가입하기
	@RequestMapping("/groups/joinGroup.gp")
	public String joinGroup(@RequestParam String groupNo ,HttpServletRequest request,Model model){
	
		
		Member m = (Member)request.getSession().getAttribute("m");
		if(m!=null){
		
			if((groupService.selectOneGroup(groupNo)).getAllowSignup().equals("Y")){
				
				groupService.insertGroupMember(new GroupMember(m.getMemberNo(),groupNo,0));
			}else{
				groupService.insertGroupMember(new GroupMember(m.getMemberNo(),groupNo,1));
			}
		}
		model.addAttribute("groupNo",groupNo);
		model.addAttribute("msg","가입에 성공하셨습니다.");
		return "groups/joinEnded";
				
	}
	
	//LeftAside 데이터 세팅하기
	@RequestMapping("/groups/selectOneGroup.gp")
	@ResponseBody
	public Map<String,Object> selectOneGroup(@RequestParam String groupNo){
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("group", groupService.selectOneGroup(groupNo));
		map.put("grpMemNum", groupService.selectGrpMemNum(groupNo));
		map.put("grpLeader", groupService.selectGroupLeader(groupNo));
		
		return map;
	}

	
	//글 쓰기
	@RequestMapping("/groups/insertPost.gp")
	@ResponseBody
	public Map <String,Object> insertPost(Post post)
	{
		Map <String,Object> map = new HashMap<String, Object>();
		map.put("result", groupService.insertPost(post));
		
		return map;
	}
	
	//글 삭제
	@RequestMapping("/groups/deletePost.gp")
	@ResponseBody
	public Map <String,Object> deletePost(@RequestParam String postNo)
	{
		Map <String,Object> map = new HashMap<String, Object>();
		
		map.put("result", groupService.deletePost(postNo));
		
		return map;
	}	  
	
	//글 수정
	@RequestMapping("/groups/updatePost.gp")
	@ResponseBody
	public Map <String,Object>updatePost(Post post)
	{
		Map <String,Object> map = new HashMap<String, Object>();
		
		map.put("result", groupService.updatePost(post));
		
		return map;
	}	
	
	//댓글 쓰기
	@RequestMapping("/groups/insertReply.gp")
	@ResponseBody
	public Map <String,Object> insertReply(PostReply postReply)
	{
		
		Map <String,Object> map = new HashMap<String, Object>();
		map.put("result", groupService.insertReply(postReply));
		
		return map;
	}
		
	//댓글 삭제
	@RequestMapping("/groups/deleteReply.gp")
	@ResponseBody
	public Map <String,Object> deleteReply(String replyNo)
	{
		Map <String,Object> map = new HashMap<String, Object>();
		map.put("result", groupService.deleteReply(replyNo));
		
		return map;
	}
	
	//댓글 수정
	@RequestMapping("/groups/updateReply.gp")
	@ResponseBody
	public Map <String,Object> updateReply(PostReply postReply)
	{
		Map <String,Object> map = new HashMap<String, Object>();
		map.put("result", groupService.updateReply(postReply));
		
		return map;
	}
	
	//일정 넣기
	@RequestMapping("/groups/insertSchedule.gp")
	@ResponseBody
	public Map<String,Object> insertSchedule(Schedule schedule ,@RequestParam String startT,@RequestParam String endT){
	
		//시작시간
		Timestamp time = new Timestamp(Long.parseLong(startT));
		schedule.setStartTime(time);
		
		//있으면 끝시간도 세팅
		if(!endT.equals("none")){
			time = new Timestamp(Long.parseLong(endT));
			schedule.setEndTime(time);
		}
		
		//System.out.println(schedule);
		
		int result=  groupService.insertSchedule(schedule);
		
		Map <String,Object> map = new HashMap<String, Object>();
		
		map.put("result", result);
		map.put("schedule", schedule);
		
		return map;
	}
	
	//일정 하나 가져오기
	@RequestMapping("/groups/selectOneSchedule.gp")
	@ResponseBody
	public Map<String,Object> selectOneSchedule(@RequestParam String scheduleNo){
	
		
		Schedule schedule = groupService.selectOneSchedule(scheduleNo);
		
		Map <String,Object> map = new HashMap<String, Object>();

		map.put("schedule", schedule);
		
		return map;
	}
	
	//일정 하나 수정하기
	@RequestMapping("/groups/updateSchedule.gp")
	@ResponseBody
	public Map<String,Object> updateSchedule(Schedule schedule ,@RequestParam String startT,@RequestParam String endT){
		
		//시작시간
		Timestamp time = new Timestamp(Long.parseLong(startT));
		schedule.setStartTime(time);
		
		//있으면 끝시간도 세팅
		if(!endT.equals("none")){
			time = new Timestamp(Long.parseLong(endT));
			schedule.setEndTime(time);
		}	
		
		int result = groupService.updateSchedule(schedule);
		
		Map <String,Object> map = new HashMap<String, Object>();

		map.put("result", result);
		
		if(result>0)
			map.put("schedule", schedule);
		
		return map;
	}
	
	@RequestMapping("/groups/deleteSchedule.gp")
	@ResponseBody
	public Map<String,Object> deleteSchedule(@RequestParam String scheduleNo){
		
		
		int result = groupService.deleteSchedule(scheduleNo);
		
		Map <String,Object> map = new HashMap<String, Object>();

		map.put("result", result);
			
		return map;
	}
	
	
	//
	@RequestMapping("/groups/selectOneGrpMem.gp")
	@ResponseBody
	public Map<String,Object> selectOneGrpMem(@RequestParam String memberNo,@RequestParam String groupNo){
		
		GroupMember gm = groupService.selectOneGrpMemberWithMemNo(new GroupMember(memberNo,groupNo));
		
		Map <String,Object> map = new HashMap<String, Object>();
		
		map.put("groupMember", gm);
			
		return map;
	}
	
	
	
	// ------------------------------------------------------------------ 혜진
	
	// 멤버 
	@RequestMapping("/groups/groupMember.gp")
	public String goGroupMember(@RequestParam String groupNo, Model model){
		
		//	들어갈 때 그룹에 해당하는 멤버 리스트를 가지고 들어가야 함
		List<GroupMember> groupMemberList = groupService.selectGroupMemberList(groupNo);
		
		model.addAttribute("groupMemberList", groupMemberList);
		
		return "groups/groupMember";
	}
	
	@RequestMapping("/groups/searchGroupMember.gp")
	public String searchGroupMember(@RequestParam String groupNo, @RequestParam String searchName, Model model){
		
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("groupNo", groupNo);
		searchMap.put("searchName", searchName);
		
		List<GroupMember> searchGroupMemberList = groupService.searchGroupMemberList(searchMap);
		
		model.addAttribute("searchGroupMemberList", searchGroupMemberList);
		
		return "groups/groupMember";
	}
	
	@RequestMapping(value="/groups/updateGroupMember.gp", method=RequestMethod.POST)
	public String updateGroupMember(GroupMember groupMember, @RequestParam MultipartFile uploadProfile, @RequestParam String resizeProfile, 
									HttpServletRequest request, Model model){
		
		String profileThumb = "";
		String profileImg = "";
		String ext = "";
		
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
				ext = fileName.substring(fileName.lastIndexOf(".")+1);
				
				profileImg = "img_" + groupMember.getMemberNo() + "_" + sdf.format(new Date(System.currentTimeMillis())) + "." + ext;
				
				uploadProfile.transferTo(new File(saveDir +"/"+ profileImg));
				
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		// 3. groupMember에 담아서 update하기
		if(!(groupMember.getProfileThumb() != null && ext.isEmpty())){
			groupMember.setProfileImg(profileImg);
			groupMember.setProfileThumb(profileThumb);
		}
		
		int result;
		result = groupService.updateGroupMember(groupMember);
		
		// 만약 upload한 이미지가 기존 이미지랑 다르다면 삭제? -> 이름 포맷에 날짜 넣기
		
		return "redirect:/groups/groupMember.gp?groupNo="+ groupMember.getGroupNo();
	}
	
	// 일정
	@RequestMapping("/groups/groupSchedule.gp")
	public String goGroupSchedule(){
		
		return "groups/groupSchedule";
	}
	
	// 사진첩
	@RequestMapping("/groups/groupPhotoAlbum.gp")
	public String goGroupPhotoAlbum(){
		
		return "groups/groupPhotoAlbum";
	}
	
	// 모임설정
	@RequestMapping("/groups/groupSetting.gp")
	public String goGroupSetting(@RequestParam String groupNo, Model model){
		
		Groups group = groupService.selectOneGroup(groupNo);
		
		model.addAttribute("group", group);
		
		return "groups/groupSetting";
	}
	
	@RequestMapping("/groups/updateGroupDefault.gp")
	public String updateGroupDefault(@RequestParam String groupNo, Model model){
		
		Groups group = groupService.selectOneGroup(groupNo);
		
		model.addAttribute("group", group);
		
		return "groups/createGroup";
		
	}
	
	@RequestMapping("/groups/updateGroupCondition.gp")
	public String updateGroupCondition(Groups group) {
		
		int result = groupService.updateGroupCondition(group);
		
		return "redirect:/groups/groupSetting.gp?groupNo=" + group.getGroupNo();
	}
	
	@ResponseBody
	@RequestMapping("/groups/goGroupMemberSetting.gp")
	public Map<String, Object> goGroupMemberSetting(@RequestParam String groupNo){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<GroupMember> groupMemberList = groupService.selectGroupMemberList(groupNo);
		
		map.put("groupMember", groupMemberList);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/groups/searchGroupMemberSetting.gp")
	public Map<String, Object> searchGroupMemberSetting(@RequestParam String groupNo, @RequestParam String searchName){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("groupNo", groupNo);
		searchMap.put("searchName", searchName);
		
		List<GroupMember> searchGroupMemberList = groupService.searchGroupMemberList(searchMap);
		
		map.put("groupMember", searchGroupMemberList);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/groups/changeGroupMemberSetting.gp")
	public Map<String, Object> changeGroupMemberSetting(@RequestParam String groupNumber, @RequestParam(value="memberNo[]") List<String> memberNo, @RequestParam String condition){
		
		/* 
			memberGradeManager : 매니저(2)로 update
			memberGradeGeneral : 일반멤버(1)로 update
			leaderDelegation : 리더위임 update 2번 -> 한번은 1로 한번은 3으로
			groupMemberWithdraw : 모임멤버에서 delete
			joinConfirm : 모임 멤버에서 1로 update
			joinCancel : 모임 멤버에서 delete
		*/
		
		Map<String, Object> changeMap = new HashMap<String, Object>();
		changeMap.put("groupNo", groupNumber);
		changeMap.put("memberNo", memberNo);
		changeMap.put("condition", condition);
		
		int result;
		
		if(condition.equals("groupMemberWithdraw") || condition.equals("joinCancel"))
			result = groupService.deleteGroupMember(changeMap);
		else{
			if(condition.equals("leaderDelegation")){				
				changeMap.put("leader", "no");
				result = groupService.updateGroupMemberSetting(changeMap);
				changeMap.put("leader", "yes");
			}
			result = groupService.updateGroupMemberSetting(changeMap);
		}
			
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", result);
		
		return map;
	}
	
	
	@RequestMapping("/groups/deleteGroup.gp")
	public String deleteGroup(@RequestParam String groupNo, Model model){
		
		int result;
		// result = groupService.deleteGroup(groupNo);
		
		model.addAttribute("msg", "Member delete successfully");
		
		return "common/msg";
	}

}