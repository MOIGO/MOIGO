package com.kh.moigo.admin.controller;


import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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

import com.kh.moigo.admin.model.service.AccuseService;
import com.kh.moigo.admin.model.vo.GroupDetail;
import com.kh.moigo.admin.model.vo.MemberDetail;
import com.kh.moigo.admin.model.vo.PageInfo;



@Controller
public class AdminController {
	
	@Autowired
	AccuseService as;

	@Autowired
	private JavaMailSender mailSender;
	
	
	//신고
	@ResponseBody
	@RequestMapping(value = "reporting.ad", method = RequestMethod.POST)
	public String reporting(@RequestParam String data,@RequestParam String data2) {
		String report = data+" | "+ data2;
		System.out.println("report"+report);
		return report;
	
	}
	// 제제 이유 이메일 전송
	@ResponseBody
	@RequestMapping(value = "sendMessage.ad", method = RequestMethod.POST)
	public Map<String, Object>  mailSending(HttpServletRequest request , @RequestParam String userEmail, @RequestParam String contents) {

		System.out.println("메일 컨트롤러 입장");

		String setfrom = "moigogo1234@gmail.com";         
		String tomail  = userEmail;     // 받는 사람 이메일
		String title   = "모이고입니다. 권한 제한에 대해 알려드립니다." ;     // 제목
		String content= contents;



		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper 
			= new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail);     // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content,true);  // 메일 내용

			mailSender.send(message);
		} catch(Exception e){
			System.out.println(e);
		}

		Map<String, Object> map = new HashMap<>();

		map.put("msg", "메일 전송 완료");


		return map;
	}
	
	
	
	@RequestMapping("adminHome.ad") //dash board로 가는 것
	public String adminHome(Locale locale,Model model){
		
		List<Map<String,Object>> weeklyGrpMake = as.weeklyGrpMake(); 
		List<Map<String,Object>> weeklyMemEnroll = as.weeklyMemEnroll();
		List<Map<String,Object>> MemEnrollperMonth = as.MemEnrollperMonth();
		List<Map<String,Object>> GrpEnrollperMonth = as.GrpEnrollperMonth();	// 꺽은선 그래프 4개
		
		List<Map<String,Object>> memberDashCount = as.memberDashCount();
		List<Map<String,Object>> groupDashCount = as.groupDashCount();  // 회원수 그룹수 통계
		
		model.addAttribute("memberDashCount",memberDashCount);
		model.addAttribute("groupDashCount",groupDashCount);
		model.addAttribute("MemEnrollperMonth",MemEnrollperMonth);
		model.addAttribute("GrpEnrollperMonth",GrpEnrollperMonth);
		model.addAttribute("weeklyMemEnroll",weeklyMemEnroll);
		model.addAttribute("weeklyGrpMake",weeklyGrpMake);
		
		model.addAttribute("pageName","DashBoard");
		return "admin/dashBoard";
	
	}
	@RequestMapping("adminMember.ad")
	public String adminMember(Model model){		
		List<Map<String,Object>> memberListnotPaging = as.selectmemberList();
		System.out.println(memberListnotPaging);
		
		model.addAttribute("memberList",memberListnotPaging); //페이징 x 멤버 목록 불러오기
		model.addAttribute("pageName","Member");
		
		return "admin/memberManaging";
	
	}
	
	
	
	@RequestMapping("adminGroup.ad")
	public String adminGroup(Model model){
		List<Map<String,Object>> groupListnotPaging = as.selectgroupList();
		System.out.println(groupListnotPaging);
		
		model.addAttribute("groupList",groupListnotPaging); //페이징 x 그룹 목록 불러오기
		model.addAttribute("pageName","Group");
		return "admin/groupManaging";
	
	}
	
	
	
	@RequestMapping("adminAnalytics.ad")
	public String adminAnalytics(Model model){
		
		//member
		ArrayList genderCount = as.countGender(); //변경하기
		List<Map<String,Object>> addressCount = as.countAddress();
		List<Map<String,Object>> minterestCount = as.countMinterest();

		//group
		List<Map<String,Object>> gGradeCount = as.gGradeCount();
		List<Map<String,Object>> ginterestCount = as.countGinterest();
		List<Map<String,Object>> groupStateCount = as.countState();
		
		
		System.out.println("genderCount"+genderCount);
		model.addAttribute("addressCount",addressCount);
		model.addAttribute("genderCount",genderCount);
		model.addAttribute("minterestCount",minterestCount);
		model.addAttribute("groupStateCount",groupStateCount);	
		model.addAttribute("gGradeCount",gGradeCount);
		model.addAttribute("ginterestCount",ginterestCount);
		model.addAttribute("pageName","Analytics");
		return "admin/analystics";
	
	}
	
	
	@RequestMapping("adminReport.ad")
	public String adminReport(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			@RequestParam(value="reportSearchingKeyword", defaultValue="",required=false) String keyword,
			@RequestParam(value="searchOption", defaultValue="", required=false) String option,
			@RequestParam(value="reportSearchingConstraint",defaultValue="", required=false) String con,
			Model model) throws Exception{
		System.out.println("currentPage: "+currentPage+" //keyword: "+keyword +"option: "+option+" con: "+con);
		// -- 페이지 처리 코드 부분 -- //	
		
		PageInfo pi =new PageInfo();
		boolean check;
		if(con=="" || con==null){
			pi.setChk(false);
			check = false;
		}
		pi.setChk(true); check=true;
		
		if(option.contains("target")) {
			pi.setOpt("target"); option="target";
		}
		if(option.contains("reporter")) {pi.setOpt("reporter"); option="reporter";}
		if(option.contains("content")) {pi.setOpt("content"); option="content";}

		pi.setSearchingKey(keyword);
		System.out.println("option 알기" +option);
		//currentPage; // 현재 페이지
		int startPage; // 한번에 표시될 게시글들의 시작 페이지
		int endPage;  // 한번에 표시될 게시글들의 마지막 페이지
		int maxPage;   // 전체 페이지의 마지막 페이지 
		
		int limit=10;       // 한 페이지당 게시글 수
		
		// 게시판은 1 페이지부터 시작한다.
	
		// 전체 게시글의 수
		int listCount = as.selectAccuseListCnt(pi);
		
		System.out.println("총 게시글 수 : "+listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		System.out.println("maxPage"+maxPage);
		System.out.println("maxPage"+limit);
		startPage
		 = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;

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
		pi= new PageInfo(startPage,endPage,maxPage, limit, currentPage, listCount, startRow,endRow, keyword, option,check);
		

		System.out.println("List구하기 전"+pi);

		
		//--1. 그냥 들어왔을 때  not searching
		List<Map<String,Object>> accuseList = as.selectTargetListPaging(pi);
		//
		/*if(con == null){
			System.out.println("null입니다.");
			if(option == "" || option == null ){
				
			}else{
				if(option =="reporter") ;
				if(option.contains("target")) { System.out.println("target 들어왔다.");
					accuseList= as.selectTargetListPaging(pi);
				}
				if(option == "content") ;
			}
			
		}else{
			System.out.println("null이 아닙니다.");
			if(option =="reporter") ;
			if(option =="target") ;
			if(option== "content") ;
			
		}*/
		
		//report top 5 구하기
		List<Map<String,Object>> mtop5 = as.atop5memberList();
		List<Map<String,Object>> gtop5 = as.atop5groupList();

		System.out.println("top5"+mtop5);
		System.out.println("top5"+gtop5);

		System.out.println(pi);
		System.out.println(accuseList);
		model.addAttribute("pi",pi);
		model.addAttribute("accuseList",accuseList).addAttribute("listCount",listCount);
		model.addAttribute("mtop5",mtop5);
		model.addAttribute("gtop5",gtop5);

		model.addAttribute("pageName","Report");
		return "admin/reportManaging";
	
	}
	
	
	
	/**
	모달 창을 누른 뒤에 멤버 정보와 상세 신고목록 확인 가능  ajax로 페이징하기 어려워서 포기
	 */
//	@RequestMapping(value="mrDetail.ad", method=RequestMethod.GET)
//	public @ResponseBody Object mrDetail(@RequestParam String id, @RequestParam(defaultValue="1") int currentPage) throws Exception{
//		List<Object> mrdList= new ArrayList<Object>();
//		// -- 페이지 처리 코드 부분 -- //
//		int startPage; // 한번에 표시될 게시글들의 시작 페이지
//		int endPage;  // 한번에 표시될 게시글들의 마지막 페이지
//		int maxPage;   // 전체 페이지의 마지막 페이지 
//		int limit=5;       // 한 페이지당 게시글 수
//		int listCount = as.selectAccuseListCnt(id);			
//		System.out.println("총 게시글 수 : "+listCount);							
//		maxPage = (int)((double)listCount / limit + 0.9);
//		System.out.println("maxPage"+maxPage);
//		System.out.println("maxPage"+limit);
//		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
//		endPage= startPage + limit - 1;			
//		if( maxPage < endPage){
//			endPage = maxPage;
//		}				
//		System.out.println("limit갑이 왜 변했지?"+limit);
//		int startRow = ((currentPage-1)*limit)+1;
//		int endRow = startRow+(limit-1);
//
//		System.out.println(startRow);
//		System.out.println(endRow);			
//		// 페이지 관련 변수 전달용 VO 생성
//		PageInfo pi
//		= new PageInfo(currentPage, listCount, 10, startPage, endPage, maxPage,startRow,endRow,id);
//		System.out.println("List구하기 전"+pi);
//
//		MemberDetail md = as.memDetail(id);
//		mrdList.add(md);
//		
//		//List<Map<String, Object>> a = as.selectAccuse(id);
//		List<Map<String, Object>> a = as.selectAccusePaging(pi);
//		
//		mrdList.add(a);
//		mrdList.add(pi);
//
//		System.out.println("list:"+mrdList);
//
//		return mrdList;
//	
//	}
	
	@RequestMapping(value="mrDetail.ad", method=RequestMethod.GET)
	public @ResponseBody Object mrDetail(@RequestParam String id) throws Exception{
		List<Object> mrdList= new ArrayList<Object>();
		MemberDetail md = as.memDetail(id);
		mrdList.add(md);		
		List<Map<String, Object>> a = as.selectAccuse(id);		
		mrdList.add(a);
		//System.out.println("list:"+mrdList);
		return mrdList;
	
	}
	
	
	@RequestMapping(value="gpDetail.ad", method=RequestMethod.GET)
	public @ResponseBody Object gpDetail(@RequestParam String grpId) throws Exception{
		String id = grpId;
		List<Object> gpdList= new ArrayList<Object>();
		GroupDetail gd = as.grpDetail(id);
		gpdList.add(gd);		
		List<Map<String, Object>> a = as.selectAccuse2(id);		
		gpdList.add(a);
		//System.out.println("list:"+gpdList);
		return gpdList;
	
	}
	
	/*@RequestMapping(value="sendMessage.ad", method=RequestMethod.GET)
	public String adminSendMessage(@RequestParam("email") String recipientName,@RequestParam("messageText") String messageText, HttpServletResponse res) throws Exception{
		
		System.out.println("아이디 넣기"+recipientName);
		System.out.println(messageText);
		//res.setContentType("application/json; charset=UTF-8");	
		
		return "admin/reportManaging";
		
	}*/ //이걸 ajax로 넘기는 게 차라리 덜 시간이 덜릴 수도 페이지 로딩을 한다면  @RequestMapping("adminReport.ad")이 함수랑 동일한 값을 보내야함
	
	
	@RequestMapping(value="modals.ad", method=RequestMethod.GET)
	public String adminSendMessage(Model model) throws Exception{
		
		
		
		return "admin/modals";
		
	}
	/**
	 * 회원 상세 정보 확인 및 가입 그룹 확인
	 */
	@ResponseBody
	@RequestMapping(value="memDetail.ad", method=RequestMethod.GET)
	public Object memDetail(@RequestParam String id) throws Exception{
		List<Object> memList= new ArrayList<Object>();
		//System.out.println("아이디 넣기"+id);		
		MemberDetail m = as.memDetail(id);
		memList.add(m);
		
		List<Map<String, Object>> a = as.memPerGroup(id);		
		memList.add(a);
	
		
		//System.out.println("list:"+memList);

		return memList;	
	}
	
	
	
	/**
	 * Group Detail info
	 * 
	 * */
	@ResponseBody
	@RequestMapping(value="grpDetail.ad", method=RequestMethod.GET)
	public Object grpDetail(@RequestParam String id) throws Exception{
		List<Object> grpList= new ArrayList<Object>();
		//System.out.println("아이디 넣기"+id);		
		GroupDetail g = as.grpDetail(id);
		grpList.add(g);
		
		List<Map<String, Object>> a = as.grpPerMem(id);		
		grpList.add(a);
		//System.out.println("groups:"+grpList);

		return grpList;	
	}
	
	@ResponseBody
	@RequestMapping(value="memDelete.ad", method=RequestMethod.GET)
	public Object memDelete(@RequestParam String id) throws Exception{
		List<Object> List= new ArrayList<Object>();
		int result = as.memDelete(id);
		//System.out.println("여기로 들어오나요?"+result);
		List.add(id);
		return List;	
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="grpDelete.ad", method=RequestMethod.GET)
	public Object grpDelete(@RequestParam String id) throws Exception{
		List<Object> List= new ArrayList<Object>();
		int result = as.grpDelete(id);
		//System.out.println("여기로 들어오나요?"+result);
		List.add(id);
		return List;	
	}
}
