package com.kh.moigo.admin.model.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.moigo.admin.model.vo.Accuse;
import com.kh.moigo.admin.model.vo.GroupDetail;
import com.kh.moigo.admin.model.vo.MemberDetail;
import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.member.model.vo.Member;

public interface AccuseDao {

	List<Map<String, Object>> selectAccuseList();
	int selectAccuseListCnt(PageInfo pi);
	List<Map<String, Object>> selectAccuseListPaging(PageInfo pi);
	Member selectMember(String id);
	List<Map<String, Object>> selectmemberList();
	MemberDetail memDetail(String id);
	List<Map<String, Object>> memPerGroup(String id);
	GroupDetail grpDetail(String id);
	List<Map<String, Object>> selectgroupList();
	List<Map<String, Object>> grpPerMem(String id);
	List<Map<String, Object>> atop5memberList();
	List<Map<String, Object>> atop5groupList();
	
	List<Map<String, Object>> selectAccuse(String id);
	//List<Map<String, Object>> selectAccusePaging(PageInfo pi);
	//int selectAccuseListCnt(String id);
	List<Map<String, Object>> selectAccuse2(String id);
	
	
	ArrayList countGender();
	List<Map<String, Object>> countAddress();
	List<Map<String, Object>> countMinterest();
	List<Map<String, Object>> gGradeCount();
	List<Map<String, Object>> countGinterest();
	List<Map<String, Object>> countState();
	
	//--
	List<Map<String, Object>> weeklyMemEnroll();
	List<Map<String, Object>> weeklyGrpMake();
	List<Map<String, Object>> memberDashCount();
	List<Map<String, Object>> groupDashCount();
	List<Map<String, Object>> MemEnrollperMonth();
	List<Map<String, Object>> GrpEnrollperMonth();
	
	//--
	int memDelete(String id);
	int grpDelete(String id);
	List<Map<String, Object>> selectTargetListPaging(PageInfo pi);
	
	//--
	int insertAccuse(Accuse accuse);

}
