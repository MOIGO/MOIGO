package com.kh.moigo.member.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import com.kh.moigo.member.model.vo.MypageGroup;

@Controller
@SessionAttributes(value={"m"})
public class MemberController {

	@Autowired
	MemberService memberService;
	

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;	
	
	
	// 암호화 o
	// 비밀번호 확인
	@ResponseBody
	@RequestMapping("/member/checkPwd.do")
	public Map<String, Object> checkPwd(HttpSession session, @RequestParam String memberPwd){
		Member member=(Member) session.getAttribute("m");
		boolean result ;

		if(bcryptPasswordEncoder.matches(memberPwd, member.getMemberPwd())){
//		if(member.getMemberPwd().equals(memberPwd)){
			result=true;
		}else{
			result=false;
		}
		Map<String, Object> map = new HashMap<>();
		
		map.put("result", result);
		
		return map;
	}
	
	// 암호화 o
	// 비밀번호 변경
	@ResponseBody
	@RequestMapping("/member/changePwd.do")
	public Map<String, Object> updateMemberPwd(HttpSession session,@RequestParam String memberPwd){
		
		Member member=(Member) session.getAttribute("m");
		String memberEmail=member.getMemberEmail();
		
		
		String rawPassword =memberPwd;
		String encodedPassword=bcryptPasswordEncoder.encode(memberPwd);
		
		Map<String, Object> map = new HashMap<>();
		
		boolean result =memberService.updateMemberPwd(memberEmail,encodedPassword)==0? false: true;
		
		
		map.put("result", result);
		

		return map;
	}
	
	

	// 암호화 x
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
			
//				if(bcryptPasswordEncoder.matches(memberPwd, m.getMemberPwd())){
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
	
	
	// 암호화 o
	// 회원가입
	@RequestMapping(value ="/member/signUpEnd.do", method = RequestMethod.POST)
	public String signUpEnd(Member member,
							@RequestParam (value = "interest", required = false,	defaultValue = "") List<String> interestList){


		String rawPassword = member.getMemberPwd();
		System.out.println("password 암호화 전 : "+rawPassword);
		member.setMemberPwd(bcryptPasswordEncoder.encode(rawPassword));
		System.out.println("password 암호화 후 : "+member.getMemberPwd());
		
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
	
	
	

	// 그룹리스트 뽑아보내 ㅎ
	@RequestMapping("/mypage/Group.do")
	public String groupList(HttpSession session, @RequestParam String gType, Model model) {

		Member member = (Member) session.getAttribute("m");

		List<MypageGroup> list = memberService.selectGroupList(member.getMemberNo(), gType);

		String loc = "";
		if (gType.equals("open"))
			loc = "mypage/openGroup";
		else if (gType.equals("join"))
			loc = "mypage/joinGroup";
		else if (gType.equals("wait"))
			loc = "mypage/waitGroup";

		System.out.println("gg 입장 : " + gType);

		model.addAttribute("list", list);

		return loc;
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

	
	// 회원가입 페이지 이동
	@RequestMapping("/member/signUp.do")
	public String signUp(){
		return "member/signUp";
	}
	
	
	
	
	
	//////////////////////////////////////
	
	
	// 페이스북 페이지이동
		@ResponseBody
		@RequestMapping("/member/fbLogin.do")
		public Map<String, Object> faceLogin(Model model,
								@RequestParam String email,
								@RequestParam String name,
								@RequestParam String birthday,
								@RequestParam String gender){
			
			System.out.println("email : " + email);
			System.out.println("name : " + name);
			System.out.println("birthday : " + birthday);
			System.out.println("gender : " + gender);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			String[] strBirth = birthday.split("/");
			
			String userYear= strBirth[2];
			String userMonth= strBirth[0];
			String userDay= strBirth[1];
			
			String mBirth = userYear  +"-"+ userMonth +"-"+ userDay;
			java.sql.Date memberBirth = java.sql.Date.valueOf(mBirth);
			
			
			String msg;
			int result;
			
			Member me = memberService.selectOneMemberF(email);
			
			if (me == null) {
				
				Member mee = new Member();
				mee.setMemberEmail(email);
				mee.setMemberBirth(memberBirth);
				mee.setMemberName(name);
				mee.setMemberPwd("페이스북 로그인");
				mee.setMemberGender(gender.equals("male")?"M":"F");
				
				result=-1;
				msg = "페이스북 회원 추가";
				int res =memberService.insertFbMember(mee);
				Member m = memberService.selectOneMember(mee.getMemberEmail());
				model.addAttribute("m", m);
			} else {
				if(me.getDelflag().equals("Y")){
					msg="이용할 수 없는 페이스북 아이디";
					result=1;
				}else{
					result = 0;
					msg = "페이스북 로그인";
					Member m = memberService.selectOneMember(me.getMemberEmail());
					model.addAttribute("m", m);
				}
			}

			Map<String, Object> map = new HashMap<>();
			map.put("msg", msg);
			map.put("result", result);
			return map;
			
		}
}
