package com.kh.moigo.member.model.service;

import com.kh.moigo.member.model.vo.Member;

public interface MemberService {

	
	Member selectOneMember(String memberEmail);
	
	int insertMember(Member member);

	int updateMember(Member member);
	
	int checkIdDuplicate(String memberEmail);

	int updateMemberPwd(String memberEmail, String memberPwd);

	int deleteMember(String memberNo, String contentW);


	
}
