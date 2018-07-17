package com.kh.moigo.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/common/main.do")
	public String main(){
		return "/main";
	}
	
}
