package com.kh.moigo.groups.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupController {

	@RequestMapping("/groups/groupsTest.do")
	public String groupTest(){
		
		return "groups/groupMain";
	}
	
	@RequestMapping("/groups/createGroup.do")
	public String groupCreate(){
		
		return "groups/createGroup";
	}
	
	@RequestMapping("/groups/groupMember.do")
	public String groupMember(){
		
		return "groups/groupMember";
	}
	
	@RequestMapping("/groups/groupSchedule.do")
	public String groupSchedule(){
		
		return "groups/groupSchedule";
	}
	

}
