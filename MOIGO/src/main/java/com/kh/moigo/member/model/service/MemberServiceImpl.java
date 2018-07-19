package com.kh.moigo.member.model.service;

import java.util.HashMap;

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
	public int checkIdDuplicate(String memberEmail) {
		return memberDao.checkIdDuplicate(memberEmail);
	}

	@Override
	public int updateMemberPwd(String memberEmail, String memberPwd) {
		
		HashMap<String, String> hmap = new HashMap<>();
		
		hmap.put("memberEmail",memberEmail);
		hmap.put("memberPwd",memberPwd);
		
		return memberDao.updateMemberPwd(hmap);
	}

	@Override
	public int deleteMember(String memberNo, String contentW) {
		HashMap<String, String> hmap = new HashMap<>();
		
		hmap.put("memberNo",memberNo);
		hmap.put("contentW",contentW);
		
		int result = memberDao.deleteMember(memberNo);
		if(result>0){
			result = memberDao.insertDropout(hmap);
		}
		return result;
		
		
	}




}
