package com.kh.moigo.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.moigo.common.model.service.MainService;
import com.kh.moigo.common.model.vo.JoinGroups;
import com.kh.moigo.common.model.vo.QNABoard;
import com.kh.moigo.member.model.vo.Member;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;

	@RequestMapping("/common/footpage.ft")
	public String footpage(@RequestParam String selected, Model model){
		model.addAttribute("selected",selected);
		return "common/footerpage";
	}
	
	@RequestMapping("/common/qna.ft")
	@ResponseBody
	public Map<String,Object> qnaBoard(@RequestParam String selected){
		
		
		String qna = "자주묻는 질문";
		String used = "이용 관련";
		String tel = "신고 관련";
		
		List<QNABoard> list = new ArrayList<QNABoard>();
		
		if(selected.equals("qna")) {
			list = mainService.qnaList(qna);
		}else if(selected.equals("used")) {
			list = mainService.qnaList(used);
		}else if(selected.equals("tel")) {
			list = mainService.qnaList(tel);
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("list", list);
		
		return map;
	}
	
	@RequestMapping("/common/joingroups.mi")
	public String joingroups(HttpSession session, Model model) {
		Member member=(Member) session.getAttribute("m");
		
		String mno = member.getMemberNo();
		
		List<JoinGroups> list = mainService.joingroups(mno);
		model.addAttribute("joingroup", list);
		
		return "main";
	}
	
	
	
}
