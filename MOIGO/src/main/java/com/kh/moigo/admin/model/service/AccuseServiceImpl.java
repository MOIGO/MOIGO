package com.kh.moigo.admin.model.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.moigo.admin.model.dao.AccuseDao;
import com.kh.moigo.admin.model.vo.GroupDetail;
import com.kh.moigo.admin.model.vo.MemberDetail;
import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.member.model.vo.Member;


@Service
public class AccuseServiceImpl implements AccuseService {
	
	@Autowired
	AccuseDao ad;

	@Override
	public List<Map<String, Object>> selectAccuseList() {
		System.out.println("신고 서비스");
		return ad.selectAccuseList();
	}

	@Override
	public int selectAccuseListCnt() {
		System.out.println("신고카운트 서비스");
		return ad.selectAccuseListCnt();
	}

	@Override
	public List<Map<String, Object>> selectAccuseListPaging(PageInfo pi) {
		System.out.println("신고 서비스");
		return ad.selectAccuseListPaging(pi);
	}

	@Override
	public Member selectMember(String id) {
		// TODO Auto-generated method stub
		return ad.selectMember(id);
	}

	@Override
	public List<Map<String, Object>> selectAccuse(String id) {
		// TODO Auto-generated method stub
		return ad.selectAccuse(id);
	}

	@Override
	public List<Map<String, Object>> selectmemberList() {
		// TODO Auto-generated method stub
		return ad.selectmemberList();
	}

	@Override
	public List<Map<String, Object>> memPerGroup(String id) {
		// TODO Auto-generated method stub
		return ad.memPerGroup(id);
	}

	@Override
	public MemberDetail memDetail(String id) {
		// TODO Auto-generated method stub
		return ad.memDetail(id);
	}

	@Override
	public GroupDetail grpDetail(String id) {
		// TODO Auto-generated method stub
		return ad.grpDetail(id);
	}

	@Override
	public List<Map<String, Object>> selectgroupList() {
		// TODO Auto-generated method stub
		return ad.selectgroupList();
	}

	@Override
	public List<Map<String, Object>> grpPerMem(String id) {
		// TODO Auto-generated method stub
		return ad.grpPerMem(id);
	}

	@Override
	public List<Map<String, Object>> atop5memberList() {
		// TODO Auto-generated method stub
		return ad.atop5memberList();
	}

	@Override
	public List<Map<String, Object>> atop5groupList() {
		// TODO Auto-generated method stub
		return ad.atop5groupList();
	}

	@Override
	public List<Map<String, Object>> selectAccuse2(String id) {
		// TODO Auto-generated method stub
		return ad.selectAccuse2(id);
	}

	@Override
	public ArrayList countGender() {
		// TODO Auto-generated method stub
		return ad.countGender();
	}

	@Override
	public List<Map<String, Object>> countAddress() {
		// TODO Auto-generated method stub
		return ad.countAddress();
	}

	@Override
	public List<Map<String, Object>> countMinterest() {
		// TODO Auto-generated method stub
		return ad.countMinterest();
	}

	@Override
	public List<Map<String, Object>> gGradeCount() {
		// TODO Auto-generated method stub
		return ad.gGradeCount();
	}

	@Override
	public List<Map<String, Object>> countGinterest() {
		// TODO Auto-generated method stub
		return ad.countGinterest();
	}






//	@Override
//	public List<Map<String, Object>> selectAccusePaging(PageInfo pi) {
//		// TODO Auto-generated method stub
//		return ad.selectAccusePaging(pi);
//	}
//
//	@Override
//	public int selectAccuseListCnt(String id) {
//		System.out.println("신고카운트 서비스");
//		return ad.selectAccuseListCnt(id);
//	}


}
