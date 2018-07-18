package com.kh.moigo.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	
	@RequestMapping("/common/serviceInfo.ft")
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
	}
	
	
}
