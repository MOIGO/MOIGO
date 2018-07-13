package com.kh.moigo.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.moigo.groups.model.vo.Groups;
import com.kh.moigo.search.model.service.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	SearchService searchService;

	@RequestMapping("search/searchList.do")
	public String keywordList(@RequestParam String keyword, Model model) {
		
		if(keyword == null) keyword = "";
		
		int listCount = searchService.listCount(keyword);
		List<Groups> list = searchService.selectList(keyword);
		
		model.addAttribute("listCount", listCount).addAttribute("keyword", keyword).addAttribute("list", list);
		return "search/searchList";
	}
	
	@ResponseBody
	@RequestMapping("search/selectList.do")
	public Map<String, String> selectList(Model model, @RequestParam String keyword, @RequestParam String place, @RequestParam String bigCategory, @RequestParam String smallCategory, @RequestParam String sort) {
		if(keyword == null) keyword = "";
		if(place == null) place = "";
		
		Map<String, String> map = new HashMap<>();
		
		map.put("keyword", keyword);
		map.put("place", place);
		map.put("bigCategory", bigCategory);
		map.put("smallCategory", smallCategory);
		map.put("sort", sort);
		
		int listCount = searchService.detailListCount(map);
		List<Groups> list = searchService.detailSelectList(map);
		
		model.addAttribute("listCount", listCount).addAttribute("keyword", keyword).addAttribute("place", place).addAttribute("list", list);
		
		Map<String, String> map2 = new HashMap<>();
		
		/*map2.put("list", list);*/
		
		return map;
	}
}
