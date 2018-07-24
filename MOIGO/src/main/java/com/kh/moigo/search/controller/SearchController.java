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
   public String keywordList(Model model,@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, @RequestParam String keyword) {
      if(keyword == null) keyword = "";
      int limit = 12;
      
      int listCount = searchService.listCount(keyword);
      List<Groups> list = searchService.selectList(keyword, cPage, limit);
      
      model.addAttribute("limit", limit).addAttribute("listCount", listCount).addAttribute("keyword", keyword).addAttribute("list", list);
      return "search/searchList";
   }
   @RequestMapping("search/selectList.do")
   public String selectList(Model model, @RequestParam(value="cPage", required=false, defaultValue="1") int cPage, @RequestParam String keyword, @RequestParam String place, @RequestParam String category, @RequestParam String sort) {
      if(keyword == null) keyword = "";
      if(place == null) place = "";
      String limit = "12";
      
      Map<String, String> map = new HashMap<>();
      
      map.put("keyword", keyword);
      map.put("place", place);
      map.put("category", category);
      map.put("sort", sort);
      map.put("limit", limit);
      map.put("cPage", String.valueOf(cPage));
      
      int listCount = searchService.detailListCount(map);
      List<Groups> list = searchService.detailSelectList(map);
      
      model.addAttribute("limit", limit).addAttribute("listCount", listCount).addAttribute("keyword", keyword).addAttribute("place", place).addAttribute("category", category).addAttribute("sort", sort).addAttribute("list", list);
      
      return "search/searchList";
   }

   @ResponseBody
   @RequestMapping("search/getAddress.do")
   public List<Groups> getAddressList(@RequestParam String keyword, @RequestParam String place, @RequestParam String category) {
      if(keyword == null) keyword = "";
      if(place == null) place = "";
      
      Map<String, String> map = new HashMap<>();
      
      map.put("keyword", keyword);
      map.put("place", place);
      map.put("category", category);
      
      List<Groups> list = searchService.getAddressList(map);
      
      return list;
   }
}