package com.kh.moigo.member.model.dao;

import java.util.HashMap;

import com.kh.moigo.member.model.vo.Member;

public interface MemberDao {

	
	Member selectOneMember(String memberEmail);
	
	int insertMember(Member member);

	int updateMember(Member member);
	
	int checkIdDuplicate(String memberEmail);

	int updateMemberPwd(HashMap<String, String> hmap);

	int deleteMember(String memberNo);

	int insertDropout(HashMap<String, String> hmap);


}
