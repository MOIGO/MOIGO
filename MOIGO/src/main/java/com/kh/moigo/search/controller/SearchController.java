package com.kh.moigo.search.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.moigo.groups.model.service.GroupsService;
import com.kh.moigo.groups.model.vo.Groups;
import com.kh.moigo.search.model.service.SearchService;

@Controller
public class SearchController {
   
   @Autowired
   SearchService searchService;
   
   @RequestMapping("search/selectList.do")
   public String selectList(Model model, @RequestParam(value="cPage", required=false, defaultValue="1") int cPage, @RequestParam String keyword, @RequestParam String place, @RequestParam(value="regardlessArea", required=false, defaultValue="") String regardlessArea, @RequestParam String category, @RequestParam String sort) {
      if(keyword == null) keyword = "";
      if(place == null) place = "";
      String limit = "12";
      
      Map<String, String> map = new HashMap<>();
      
      map.put("keyword", keyword);
      map.put("place", place);
      map.put("regardlessArea", regardlessArea);
      map.put("category", category);
      map.put("sort", sort);
      map.put("limit", limit);
      map.put("cPage", String.valueOf(cPage));
      
      int listCount = searchService.detailListCount(map);
      List<Groups> list = searchService.detailSelectList(map);
      
      List<Integer> postCntList = new ArrayList<>();
      
      model.addAttribute("limit", limit).addAttribute("listCount", listCount).addAttribute("keyword", keyword).addAttribute("place", place).addAttribute("regardlessArea", regardlessArea).addAttribute("category", category).addAttribute("sort", sort).addAttribute("list", list).addAttribute("postCntList", postCntList);
      
      return "search/searchList";
   }

   @ResponseBody
   @RequestMapping("search/getAddress.do")
   public List<Groups> getAddressList(@RequestParam String keyword, @RequestParam String place, @RequestParam(value="regardlessArea", required=false, defaultValue="") String regardlessArea, @RequestParam String category) {
      if(keyword == null) keyword = "";
      if(place == null) place = "";
      
      Map<String, String> map = new HashMap<>();
      
      map.put("keyword", keyword);
      map.put("place", place);
      map.put("regardlessArea", regardlessArea);
      map.put("category", category);
      
      List<Groups> list = searchService.getAddressList(map);
      
      return list;
   }
}