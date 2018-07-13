package com.kh.moigo.admin.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.moigo.HomeController;


@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("adminHome.ad")
	public String adminHome(Locale locale,Model model){
		
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("pageName","DashBoard");
		return "admin/dashBoard";
	
	}

	
	@RequestMapping("adminAnalytics.ad")
	public String adminAnalytics(Model model){
		model.addAttribute("pageName","Analytics");
		return "admin/analystics";
	
	}
	@RequestMapping("adminGroup.ad")
	public String adminGroup(Model model){
		model.addAttribute("pageName","Group");
		return "admin/groupManaging";
	
	}
	@RequestMapping("adminReport.ad")
	public String adminReport(Model model){
		model.addAttribute("pageName","Report");
		return "admin/reportManaging";
	
	}
	@RequestMapping("adminTest.ad")
	public String adminTest(Model model){
		model.addAttribute("pageName","Report");
		return "admin/common/adminSidebar";
	
	}
	
}
