package com.kh.moigo.member.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.moigo.member.model.service.MemberService;
import com.kh.moigo.member.model.vo.Member;

@Controller
@SessionAttributes(value={"m"})
public class MemberController {

	@Autowired
	MemberService memberService;

	@ResponseBody
	@RequestMapping("/member/checkIdDup.do")
	public Map<String, Object> checkIdDuplicate(@RequestParam String memberEmail){
		

		Map<String, Object> map = new HashMap<>();
		
		boolean isUsable =memberService.checkIdDuplicate(memberEmail)==0? true: false;
		
		map.put("isUsable", isUsable);
		

		return map;
	}
	
	
	

//	로그인
	@ResponseBody
	@RequestMapping(value = "/member/memberLogin.do", method = RequestMethod.POST)
	public Map<String, Object> memberLogin(@RequestParam String memberEmail, @RequestParam String memberPwd,
			Model model) {

		Map<String, Object> map = new HashMap<>();

		Member m = memberService.selectOneMember(memberEmail);

		String msg = "";
		int result;

		if (m == null) {
			msg = "존재하지않은 회원";
			result = -1;
		} else {
			if (memberPwd.equals(m.getMemberPwd())) {
				result = 0;
				msg = "로그인 성공";
				model.addAttribute("m", m);
			} else {
				msg = "비밀번호가 틀렸습니다";
				result = 1;
			}
		}

		map.put("msg", msg);
		map.put("result", result);

		return map;
	}
	
	
	@RequestMapping(value ="/member/signUpEnd.do", method = RequestMethod.POST)
	public String signUpEnd(Member member){

		if(member.getMemberAddress().equals("null null")) member.setMemberAddress(null);

		System.out.println(member);
		int result = memberService.insertMember(member);
		
		String msg = "";
		if(result>0) msg="회원가입성공!";
		else msg="회원가입실패!";

		System.out.println(msg);
		
		return "redirect:/";
	}
	
	
//	로그아웃
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus status){
		
		System.out.println("로그아웃");
		// 현재 세션 상태가 끝났음을 확인
		if(!status.isComplete()){
			status.setComplete();
		}
		
		return "redirect:/";
		
	}
	
	
	@RequestMapping("/mypage/profile.do")
	public String profile(HttpSession session,Model model){
		Member member=(Member) session.getAttribute("m");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String[] strBirth = sdf.format(member.getMemberBirth()).split("-");
		
		String userYear= strBirth[0];
		String userMonth= strBirth[1];
		String userDay= strBirth[2];

		model.addAttribute("userYear",userYear).addAttribute("userMonth",userMonth).addAttribute("userDay",userDay);
		
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
