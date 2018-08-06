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
import com.kh.moigo.admin.model.vo.Accuse;
import com.kh.moigo.admin.model.vo.GroupDetail;
import com.kh.moigo.admin.model.vo.MemberDetail;
import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.member.model.vo.Member;



@Controller
public class AdminController {
	
	@Autowired
	AccuseService as;

	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("adminBackHome.ad") //dash board로 가는 것
	public String adminBackHome(Model model,HttpServletRequest request){
		Member m = (Member)(request.getSession().getAttribute("m"));
		if(m == null ||  m.getMemberNo().charAt(0)!='A'){
			return "common/error";
			
		}
		model.addAttribute("pageName","DashBoard");
		return "home";
	
	}
	
	//신고 포스트->개인
	@ResponseBody
	@RequestMapping(value = "reporting.ad", method = RequestMethod.POST)
	public String reporting(Accuse accuse,@RequestParam String data,@RequestParam String data2,@RequestParam String data3) {
		String report =data;
		accuse.setContent(data);
		accuse.setTargetMember(data2);
		accuse.setReporter(data3);
		
		int result = as.insertAccuse(accuse);
		System.out.println(result);		
		return report;
	
	}

	//신고 그룹
	@ResponseBody
	@RequestMapping(value = "reporting2.ad", method = RequestMethod.POST)
	public String reporting2(Accuse accuse,@RequestParam String data,@RequestParam String data2,@RequestParam String data3) {
		String report =data;
		accuse.setContent(data);
		accuse.setTargetGroup(data2);
		accuse.setReporter(data3);
		int result = as.insertAccuse(accuse);
		System.out.println(result);		
		return report;
		
	}
	

	//제제 이유 이메일 전송
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
	public String adminHome(Locale locale,Model model,HttpServletRequest request){
		Member m = (Member)(request.getSession().getAttribute("m"));
		if(m == null ||  m.getMemberNo().charAt(0)!='A'){
			return "common/error";
			
		}
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
	public String adminMember(Model model,HttpServletRequest request){		
		Member m = (Member)(request.getSession().getAttribute("m"));
		if(m.getMemberNo().charAt(0)!='A'){
			return "common/error";
		}
		List<Map<String,Object>> memberListnotPaging = as.selectmemberList();
		System.out.println(memberListnotPaging);		
		model.addAttribute("memberList",memberListnotPaging); //페이징 x 멤버 목록 불러오기
		model.addAttribute("pageName","Member");		
		return "admin/memberManaging";
	
	}
	
	
	
	@RequestMapping("adminGroup.ad")
	public String adminGroup(Model model,HttpServletRequest request){
		Member m = (Member)(request.getSession().getAttribute("m"));
		if(m == null ||  m.getMemberNo().charAt(0)!='A'){
			return "common/error";
			
		}
		
		List<Map<String,Object>> groupListnotPaging = as.selectgroupList();
		System.out.println(groupListnotPaging);		
		model.addAttribute("groupList",groupListnotPaging); //페이징 x 그룹 목록 불러오기
		model.addAttribute("pageName","Group");
		return "admin/groupManaging";
	
	}
	
	
	
	@RequestMapping("adminAnalytics.ad")
	public String adminAnalytics(Model model,HttpServletRequest request){
		Member m = (Member)(request.getSession().getAttribute("m"));
		if(m == null ||  m.getMemberNo().charAt(0)!='A'){
			return "common/error";
			
		}
		//member
		ArrayList genderCount = as.countGender(); //변경하기
		List<Map<String,Object>> addressCount = as.countAddress();
		List<Map<String,Object>> minterestCount = as.countMinterest();

		//group
		List<Map<String,Object>> gGradeCount = as.gGradeCount();
		List<Map<String,Object>> ginterestCount = as.countGinterest();
		List<Map<String,Object>> groupStateCount = as.countState();
		
		List<Map<String,Object>> gmReportCount = as.gmReportCount();
		List<Map<String,Object>> moreActiveGroups = as.moreActiveGroups();

		System.out.println("genderCount"+genderCount);
		model.addAttribute("addressCount",addressCount);
		model.addAttribute("genderCount",genderCount);
		model.addAttribute("minterestCount",minterestCount);
		model.addAttribute("groupStateCount",groupStateCount);	
		model.addAttribute("gGradeCount",gGradeCount);
		model.addAttribute("ginterestCount",ginterestCount);
		model.addAttribute("gmReportCount",gmReportCount);
		model.addAttribute("moreActiveGroups",moreActiveGroups);
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
		System.out.println("con"+con);
		PageInfo pi =new PageInfo();
		String check;
		if(!con.contains("true")){
			pi.setChk("false");
			check = "false";
		}else{
			pi.setChk("true"); check="true";
		}
		
		if(option.contains("target")) {
			pi.setOpt("target"); option="target";
		}
		if(option.contains("reporter")) {pi.setOpt("reporter"); option="reporter";}
		if(option.contains("content")) {pi.setOpt("content"); option="content";}

		pi.setSearchingKey(keyword);
		//System.out.println("option 알기" +option);
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
		
		int startRow = ((currentPage-1)*limit)+1;
		int endRow = startRow+(limit-1);
		
		// 페이지 관련 변수 전달용 VO 생성
		pi= new PageInfo(startPage,endPage,maxPage, limit, currentPage, listCount, startRow,endRow, keyword, option,check);
		
		
		
		List<Map<String,Object>> accuseList = as.selectTargetListPaging(pi);

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
