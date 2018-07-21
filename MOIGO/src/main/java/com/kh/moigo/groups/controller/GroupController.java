package com.kh.moigo.groups.controller;


import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.groups.model.service.GroupsService;
import com.kh.moigo.groups.model.vo.PostWithMem;
import com.kh.moigo.groups.model.vo.GroupMember;


@Controller
public class GroupController {
	
	@Autowired
	private GroupsService groupService;

	@RequestMapping("/groups/groupsTest.do")
	public String groupTest(){
		
		return "groups/groupMain";
	}
	
	
	//그룹 메인 들어갈때 글 가져오기
	@RequestMapping("/groups/getPostList.gp")
	@ResponseBody
	public Map<String,Object> getPostList(@RequestParam String groupNo, @RequestParam int currPage,Model model){
		
		PageInfo p = new PageInfo(currPage, groupService.selectPostCnt(groupNo),5);
		
		ArrayList<PostWithMem> list = groupService.selectPostList(groupNo, p);
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("posts", list);
		map.put("pageInfo", p);
		
		return map;
	}
	
	@RequestMapping("/groups/setGroupMain.gp")
	public String setGroupMain(@RequestParam String groupNo,Model model){
	
		return "groups/groupMain";
	}
	
	
	//글 쓰기
	@RequestMapping("/groups/addPost.gp")
	@ResponseBody
	public Map <String,Object> addPost(	@RequestParam String groupNo,
							@RequestParam String memberNo,
							@RequestParam String content,
							@RequestParam String isNotice,
							Model model)
	{
		//Post p = new Post(groupNo,memberNo,content,isNotice);
		
		Map <String,Object> map = new HashMap<String, Object>();
		//map.put("result", groupService.addPost(p));
		
		return map;
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
