package com.kh.moigo.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.moigo.member.model.service.MemberService;
import com.kh.moigo.member.model.vo.Member;


@Controller
public class MailController {
	 

	@Autowired
	  private JavaMailSender mailSender;
	@Autowired
	MemberService memberService;
	
	
	// 인증번호 이메일 전송
	@ResponseBody
	@RequestMapping(value = "/member/sendEmail.do", method = RequestMethod.POST)
	  public Map<String, Object>  mailSending(HttpServletRequest request , @RequestParam String userEmail) {
	   
		System.out.println("메일 컨트롤러 입장");
		
	    String setfrom = "moigogo1234@gmail.com";         
	    String tomail  = userEmail;     // 받는 사람 이메일
	    String title   = "모이고 인증번호입니다" ;     // 제목
	    		
		int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
	      String joinCode = String.valueOf(ran);
	      System.out.println("인증번호:" + joinCode);
	      
	      String content="인증번호는  <b>[ "+joinCode +" ] </b>입니다";

	      	
	      
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content,true);  // 메일 내용
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    Map<String, Object> map = new HashMap<>();
	    
		map.put("msg", "인증번호 전송");
		map.put("joinCode", joinCode);
	    
	    return map;
	  }
	
	
	// 임시 비밀번호 이메일 전송
	@ResponseBody
	@RequestMapping(value = "/member/findPwdEmail.do", method = RequestMethod.POST)
	public Map<String, Object> mailSendingPwd(HttpServletRequest request, @RequestParam String findEmail,
			@RequestParam String findName) {

		Member member = memberService.selectOneMember(findEmail);
		System.out.println("멤버정보 : " + member);
		String msg;
		int result;

		if (member == null) {
			msg = "존재하지 않는 회원";
			result = -1;
		} else {

			if (member.getMemberName().equals(findName)) {
				result = 0;

				String newPwd = getRamdomPassword(8);
				memberService.updateMemberPwd(findEmail, newPwd);
				msg = "임시 비밀번호 전송, 메일 확인해주세요";

				String setfrom = "moigogo1234@gmail.com";
				String tomail = findEmail; // 받는 사람 이메일
				String title = "모이고 임시 비밀번호 발급안내"; // 제목
				String content = "";

				content = findName+"님의 임시 비밀번호는  <b>[ " + newPwd + " ]</b> 확인 후 변경해주세요.";

				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

					messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
					messageHelper.setTo(tomail); // 받는사람 이메일
					messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
					messageHelper.setText(content,true); // 메일 내용

					mailSender.send(message);
				} catch (Exception e) {
					System.out.println(e);
				}

			} else {
				result = 1;
				msg = "회원정보가 일치하지 않습니다";
			}
		}
		
	    
	    Map<String, Object> map = new HashMap<>();
	    
		map.put("msg", msg);
		map.put("result", result);
	    
	    return map;
	  }
	
	
	
	
	// 임시 비밀번호 생성
	public String getRamdomPassword(int len) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		int idx = 0;
		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < len; i++) {
			if (i % 7 == 0) {
				idx = (int) (10 * Math.random());
				sb.append(charSet[idx]);
			} else {
				idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를
																// Int로 추출
																// (소숫점제거)
				sb.append(charSet[idx]);
			}
		}
		System.out.println("sb : " + sb.toString());

		return sb.toString();
	}
	

}
