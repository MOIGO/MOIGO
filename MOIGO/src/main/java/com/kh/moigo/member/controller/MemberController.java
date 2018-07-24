package com.kh.moigo.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.moigo.member.model.service.MemberService;
import com.kh.moigo.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping("/member/memberDetail.do")
	public String memberDetail(@RequestParam("memberNo") String memberNo ,Model model){		
		Member m = memberService.selectOne(memberNo);		
		model.addAttribute("m",m);		
		return "home";
	}
	
	
	@RequestMapping(value="/member/memberLogin.do", method=RequestMethod.POST)
	public String memberLogin(@RequestParam String memberEmail, @RequestParam String memberPwd){
		System.out.println(memberEmail+"로그인버튼 ㅋㅋ"+memberPwd);	
		
		return "home";
	}
	
	@RequestMapping("/mypage/profile.do")
	public String profile(){
		return "mypage/profile";
	}
	@RequestMapping("/mypage/changePwd.do")
	public String changePwd(){
		return "mypage/changePwd";
	}
	@RequestMapping("/mypage/withdrawal.do")
	public String withdrawal(){
		return "mypage/withdrawal";
	}
	@RequestMapping("/mypage/openGroup.do")
	public String openGroup(){
		return "mypage/openGroup";
	}
	@RequestMapping("/mypage/joinGroup.do")
	public String joinGroup(){
		return "mypage/joinGroup";
	}
	@RequestMapping("/mypage/waitGroup.do")
	public String waitGroup(){
		return "mypage/waitGroup";
	}
	@RequestMapping("/member/signUp.do")
	public String signUp(){
		return "member/signUp";
	}
}
