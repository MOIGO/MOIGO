package com.kh.moigo.member.model.service;

import java.util.List;

import com.kh.moigo.member.model.vo.Member;

public interface MemberService {

	
	Member selectOneMember(String memberEmail);
	
	int insertMember(Member member, List<String> interestList);

	int updateMember(Member member);
	
	int checkIdDuplicate(String memberEmail);

	int updateMemberPwd(String memberEmail, String memberPwd);

	int deleteMember(String memberNo, String contentW);

	List<String> selectInterestList(String memberNo);


	
}
