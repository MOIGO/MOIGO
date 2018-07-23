package com.kh.moigo.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

	@RequestMapping("/common/footpage.ft")
	public String footpage(@RequestParam String selected, Model model){
		model.addAttribute("selected",selected);
		return "common/footerpage";
	}
	
	/*@RequestMapping("/common/serviceInfo.ft")
	public String serviceInfo(){
		return "common/serviceInfo";
	}
	
	@RequestMapping("/common/personalInfo.ft")
	public String personalInfo(){
		return "common/personalInfo";
	}
	
	@RequestMapping("/common/useGuide.ft")
	public String useGuide(){
		return "common/useGuide";
	}
	
	@RequestMapping("/common/maps.ft")
	public String maps(){
		return "common/maps";
	}*/
	
	@RequestMapping("/common/qna.ft")
	public String qnaBoard(){
		
		
		return "common/footerpage";
	}
	
	
}
