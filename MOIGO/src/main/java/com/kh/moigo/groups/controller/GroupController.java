package com.kh.moigo.groups.controller;

import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public String uploadGroupMember(GroupMember groupMember, @RequestParam MultipartFile uploadProfile, @RequestParam String resizeProfile, Model model) {
		
		// 1. dataUrl 방식으로 받아온 resizeProfile을 파일로 저장하기
		BufferedImage image = null;
		
		String[] base64Arr = resizeProfile.split(",");
		byte[] imageByte =  Base64.decodeBase64(base64Arr[1]);
		
		// 2. upload한 file을 rename, 경로 저장하기
		// 3. groupMember에 담아서 update하기
		
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
