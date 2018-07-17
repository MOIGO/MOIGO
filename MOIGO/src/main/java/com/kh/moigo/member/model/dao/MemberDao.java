package com.kh.moigo.member.model.dao;

import com.kh.moigo.member.model.vo.Member;

public interface MemberDao {

	
	Member selectOneMember(String memberEmail);
	
	int insertMember(Member member);

	int updateMember(Member member);
	
	int deleteMember(int memberNo);
	
	int checkIdDuplicate(String memberEmail);
}
