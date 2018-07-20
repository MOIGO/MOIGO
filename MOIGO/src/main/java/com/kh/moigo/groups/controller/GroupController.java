package com.kh.moigo.groups.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.groups.model.service.GroupsService;
import com.kh.moigo.groups.model.vo.Post;

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
		
		ArrayList<Post> list = groupService.selectPostList(groupNo, p);
		
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
	
	@RequestMapping(value="/groups/groupMember.gp", method=RequestMethod.POST)
	public String goGroupMember(@RequestParam String groupNo, Model model){
		
		//	들어갈 때 그룹에 해당하는 멤버 리스트를 가지고 들어가야 함
		List<Map<String, String>> groupMemberList = groupService.selectGroupMemberList(groupNo);
		
		model.addAttribute("groupMemberList", groupMemberList);
		
		return "groups/groupMember";
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
