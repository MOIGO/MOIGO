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
	
	// 암호화?
	// 비밀번호 확인
	@ResponseBody
	@RequestMapping("/member/checkPwd.do")
	public Map<String, Object> checkPwd(HttpSession session, @RequestParam String memberPwd){
		Member member=(Member) session.getAttribute("m");
		boolean result ;
		/*if(bcryptPasswordEncoder.matches(password, m.getPassword())){*/
		if(member.getMemberPwd().equals(memberPwd)){
			result=true;
		}else{
			result=false;
		}
		Map<String, Object> map = new HashMap<>();
		
		map.put("result", result);
		
		return map;
	}
	
	// 암호화?
	// 비밀번호 변경
	@ResponseBody
	@RequestMapping("/member/changePwd.do")
	public Map<String, Object> updateMemberPwd(HttpSession session,@RequestParam String memberPwd){
		
		Member member=(Member) session.getAttribute("m");
		String memberEmail=member.getMemberEmail();
		

		Map<String, Object> map = new HashMap<>();
		
		boolean result =memberService.updateMemberPwd(memberEmail,memberPwd)==0? false: true;
		
		
		map.put("result", result);
		

		return map;
	}
	
	

	// 암호화?
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
			msg = "존재하지 않은 회원입니다.";
			result = -1;
		} else {
			if (memberPwd.equals(m.getMemberPwd())) {
				result = 0;
				msg = "로그인 성공";
				model.addAttribute("m", m);
			} else {
				msg = "회원정보가 일치하지 않습니다.";
				result = 1;
			}
		}

		map.put("msg", msg);
		map.put("result", result);

		return map;
	}
	
	
	// 암호화?
	// 회원가입
	@RequestMapping(value ="/member/signUpEnd.do", method = RequestMethod.POST)
	public String signUpEnd(Member member,
							@RequestParam (value = "interest", required = false,	defaultValue = "") List<String> interestList){

		/*if(member.getMemberAddress().equals("null null")) member.setMemberAddress(null);*/
		
		System.out.println(interestList);
		System.out.println(member);
		System.out.println(interestList.size());
		
		int result = memberService.insertMember(member, interestList);
		
		String msg = "";
		if(result>0) msg="회원가입성공!";
		else msg="회원가입실패!";

		System.out.println(msg);

		return "redirect:/";
	}
	
	
	
	//	아이디 중복확인
	@ResponseBody
	@RequestMapping("/member/checkIdDup.do")
	public Map<String, Object> checkIdDuplicate(@RequestParam String memberEmail){
		
		Map<String, Object> map = new HashMap<>();
		
		boolean isUsable = memberService.checkIdDuplicate(memberEmail)==0? true: false;
		
		map.put("isUsable", isUsable);
		
		return map;
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
	
	
	// 프로필 페이지이동
	@RequestMapping("/mypage/profile.do")
	public String profile(HttpSession session,Model model){
		Member member=(Member) session.getAttribute("m");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String[] strBirth = sdf.format(member.getMemberBirth()).split("-");
		
		String userYear= strBirth[0];
		String userMonth= strBirth[1];
		String userDay= strBirth[2];
		
		List<String> interestList = memberService.selectInterestList(member.getMemberNo());
		
		System.out.println(interestList);

		model.addAttribute("userYear",userYear)
			.addAttribute("userMonth",userMonth)
			.addAttribute("userDay",userDay)
			.addAttribute("interestList",interestList);
		
		return "mypage/profile";
	}
	
	//멤버 업뎃
	@RequestMapping("/member/memberUpdate.do")
	public String memberUpdate(HttpSession session, Member mm,
			@RequestParam(value = "interest", required = false, defaultValue = "") List<String> interestList) {

		Member member = (Member) session.getAttribute("m");

		member.setMemberAddress(mm.getMemberAddress());
		member.setMemberBirth(mm.getMemberBirth());
		member.setMemberName(mm.getMemberName());

		int result = memberService.updateMember(member, interestList);

		if (result > 0)
			System.out.println("회원정보 수정 성공");
		else
			System.out.println("회원정보 수정 실패");

		return "redirect:/mypage/profile.do";
	}

	// 회원탈퇴
	@RequestMapping("/mypage/withdrawalEnd.do")
	public String withdrawalEnd(HttpSession session, @RequestParam String contentW ){

		Member member = (Member) session.getAttribute("m");
		String memberNo =member.getMemberNo();
		
		int result = memberService.deleteMember(memberNo,contentW);
		
		String msg = "";
		if(result>0) msg="회원탈퇴 성공!";
		else msg="회원탈퇴실패!";

		System.out.println(msg);
		
		return "redirect:/member/memberLogout.do";
	}
	
	
	
	
	
	
	
	
	// 회원탈퇴 페이지 이동
	@RequestMapping("/mypage/withdrawal.do")
	public String withdrawal(){
		return "mypage/withdrawal";
	}
	
	// 비밀번호 변경 페이지 이동
	@RequestMapping("/mypage/changePwd.do")
	public String changePwd(){
		return "mypage/changePwd";
	}

	// 주최그룹페이지 이동
	@RequestMapping("/mypage/openGroup.do")
	public String openGroup(){
		return "mypage/openGroup";
	}
	
	// 참여그룹페이지 이동
	@RequestMapping("/mypage/joinGroup.do")
	public String joinGroup(){
		return "mypage/joinGroup";
	}
	
	//  가입대기그룹  페이지이동
	@RequestMapping("/mypage/waitGroup.do")
	public String waitGroup(){
		return "mypage/waitGroup";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping("/member/signUp.do")
	public String signUp(){
		return "member/signUp";
	}
}
