package com.kh.moigo.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moigo.member.model.dao.MemberDao;
import com.kh.moigo.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Override
	public Member selectOne(String memberNo) {
		
		return memberDao.selectOne(memberNo);
	}

}
