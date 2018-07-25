package com.kh.moigo.member.model.dao;

import java.util.HashMap;
import java.util.List;

import com.kh.moigo.member.model.vo.Member;
import com.kh.moigo.member.model.vo.MypageGroup;

public interface MemberDao {

	
	Member selectOneMember(String memberEmail);
	
	int insertMember(Member member);

	int updateMember(Member member);
	
	int checkIdDuplicate(String memberEmail);

	int updateMemberPwd(HashMap<String, String> hmap);

	int deleteMember(String memberNo);

	int insertDropout(HashMap<String, String> hmap);

	int insertMemberInterest(HashMap<String, String> hmap);

	List<String> selectInterestList(String memberNo);

	int deleteMemberInterest(String memberNo);

	List<MypageGroup> selectGroupList(HashMap<String, String> hmap);

	int insertFbMember(Member m);


}
