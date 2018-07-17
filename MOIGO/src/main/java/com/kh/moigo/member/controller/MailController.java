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


@Controller
public class MailController {
	 

	@Autowired
	  private JavaMailSender mailSender;
	
	
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
	      
	      String content="인증번호는   ["+joinCode +"]입니다";

	      	
	      
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    Map<String, Object> map = new HashMap<>();
	    
		map.put("msg", "인증번호 전송");
		map.put("joinCode", joinCode);
	    
	    return map;
	  }
}
