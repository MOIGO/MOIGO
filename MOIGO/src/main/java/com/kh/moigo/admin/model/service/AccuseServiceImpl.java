package com.kh.moigo.admin.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moigo.admin.model.dao.AccuseDao;
import com.kh.moigo.admin.model.vo.Accuse;
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

}
