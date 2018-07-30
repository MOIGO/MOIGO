package com.kh.moigo.admin.model.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.moigo.admin.model.vo.GroupDetail;
import com.kh.moigo.admin.model.vo.MemberDetail;
import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.member.model.vo.Member;



public interface AccuseService {

	List<Map<String, Object>> selectAccuseList();
	int selectAccuseListCnt();
	List<Map<String, Object>> selectAccuseListPaging(PageInfo pi);
	Member selectMember(String id);

	List<Map<String, Object>> selectmemberList();
	List<Map<String, Object>> memPerGroup(String id);
	MemberDetail memDetail(String id);
	GroupDetail grpDetail(String id);
	List<Map<String, Object>> selectgroupList();
	List<Map<String, Object>> grpPerMem(String id); //그룹에 가입한 멤버 정보 불러오기
	List<Map<String, Object>> atop5memberList(); //accuse top 5 member
	List<Map<String, Object>> atop5groupList();  //accuse top 5 group
	
	
	List<Map<String, Object>> selectAccuse(String id);
	//List<Map<String, Object>> selectAccusePaging(PageInfo pi);//ajax 페이징 포기해서 나중으로 넘겼음	
	//int selectAccuseListCnt(String id); //그 회원의 신고 갯수 
	List<Map<String, Object>> selectAccuse2(String id);
	
	//이하 analytics 
	ArrayList countGender();
	List<Map<String, Object>> countAddress();
	List<Map<String, Object>> countMinterest();//--member
	List<Map<String, Object>> gGradeCount();
	List<Map<String, Object>> countGinterest();
	List<Map<String, Object>> countState();
	
	//이하 대시보드
	List<Map<String, Object>> weeklyMemEnroll();
	List<Map<String, Object>> weeklyGrpMake();
	List<Map<String, Object>> memberDashCount();
	List<Map<String, Object>> groupDashCount();
	List<Map<String, Object>> MemEnrollperMonth();
	List<Map<String, Object>> GrpEnrollperMonth();
	
	
	//신고 많이 받은 회원 삭제
	int memDelete(String id);
	int grpDelete(String id);
	

	

	
}
