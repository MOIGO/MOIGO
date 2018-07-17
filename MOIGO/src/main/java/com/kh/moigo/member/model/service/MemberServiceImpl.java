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
	public Member selectOneMember(String memberEmail) {
		return memberDao.selectOneMember(memberEmail);
	}

	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}

	@Override
	public int deleteMember(int memberNo) {
		return memberDao.deleteMember(memberNo);
	}

	@Override
	public int checkIdDuplicate(String memberEmail) {
		return memberDao.checkIdDuplicate(memberEmail);
	}

}
