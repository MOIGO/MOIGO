package com.kh.moigo.admin.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.moigo.HomeController;
import com.kh.moigo.admin.model.service.AccuseService;
import com.kh.moigo.admin.model.vo.Accuse;
import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.member.model.vo.Member;



@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	AccuseService as;
	
	
	
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
	public String adminReport(@ModelAttribute("accuse") Accuse accuse,
			@RequestParam(defaultValue="1") int currentPage,Model model) throws Exception{
		
		// -- 페이지 처리 코드 부분 -- //
		
		int startPage; // 한번에 표시될 게시글들의 시작 페이지
		int endPage;  // 한번에 표시될 게시글들의 마지막 페이지
		int maxPage;   // 전체 페이지의 마지막 페이지 
		//currentPage; // 현재 페이지
		int limit=10;       // 한 페이지당 게시글 수
		
		// 게시판은 1 페이지부터 시작한다.
	
		// 전체 게시글의 수
		int listCount = as.selectAccuseListCnt();
		
		System.out.println("총 게시글 수 : "+listCount);
		
		// 총 게시글 수에 대한 페이지 계산
		// Ex) 목록의 수가 123 개라면 
		//    페이지 수는 13페이지가 된다.
		// 짜투리 게시글도 하나의 페이지로 취급해야 한다.
		// 10 / 1 --> 0.9 를 더하여 하나의 페이지로 만든다.
		
		maxPage = (int)((double)listCount / limit + 0.9);
		System.out.println("maxPage"+maxPage);
		System.out.println("maxPage"+limit);
		// 현재 화면에 표시할 페이지 개수
		// 첫 페이지의 번호
		// Ex) 한 화면에 10개의 페이지를 표시하는 경우
		// 1, 11, 21 . . . 
		startPage
		 = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		
		// 한 화면에 표시할 마지막 페이지 번호
		endPage
		 = startPage + limit - 1;
		
		if( maxPage < endPage){
			endPage = maxPage;
		}
		
		System.out.println("limit갑이 왜 변했지?"+limit);
		int startRow = ((currentPage-1)*limit)+1;
		int endRow = startRow+(limit-1);
		
		System.out.println(startRow);
		System.out.println(endRow);
		
		// 페이지 관련 변수 전달용 VO 생성
		PageInfo pi
		 = new PageInfo(currentPage, listCount, 10, startPage, endPage, maxPage,startRow,endRow);
		System.out.println("List구하기 전"+pi);
		// -- 페이지 처리 코드 부분 -- //
		
		// 페이지 처리를 안할 경우
		//List<Map<String,Object>> accuseListnotPaging = as.selectAccuseList();
		
		// 페이지 처리를 수행할 경우			
		List<Map<String,Object>> accuseList = as.selectAccuseListPaging(pi);
		
		
		

		System.out.println(pi);
		System.out.println(accuseList);
		model.addAttribute("pi",pi);
		model.addAttribute("accuseList",accuseList);
		
		model.addAttribute("pageName","Report");
		return "admin/reportManaging";
	
	}
	
	
	
	/**
	모달 창을 누른 뒤에 멤버 정보와 상세 신고목록 확인 가능
	
	 
	 */
	@RequestMapping(value="mrDetail.ad", method=RequestMethod.GET)
	public @ResponseBody List<Object> mrDetail(@RequestParam String id, HttpServletResponse res) throws Exception{
		List<Object> mrdList= new ArrayList<Object>();
		//System.out.println("아이디 넣기"+id);
		
		//System.out.println(m);
		//res.setContentType("application/json; charset=UTF-8");	
		
		Member m = as.selectMember(id);
		mrdList.add(m);
		
		List<Map<String, Object>> a = as.selectAccuse(id);
		
		
		mrdList.add(a);
		System.out.println("list:"+mrdList);

		return mrdList;
	
	}
	
	
	@RequestMapping(value="sendMessage.ad", method=RequestMethod.GET)
	public String adminSendMessage(@RequestParam("email") String recipientName,@RequestParam("messageText") String messageText, HttpServletResponse res) throws Exception{
		
		System.out.println("아이디 넣기"+recipientName);
		System.out.println(messageText);
		//res.setContentType("application/json; charset=UTF-8");	
		
		return "admin/reportManaging";
		
	}
	
	
	
}
