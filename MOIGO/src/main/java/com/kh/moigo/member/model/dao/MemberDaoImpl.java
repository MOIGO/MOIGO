package com.kh.moigo.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.moigo.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	

	@Override
	public Member selectOneMember(String memberEmail) {
		return sqlSession.selectOne("member.selectOneMember",memberEmail);
	}

	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("member.insertMember", member);
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.update("member.updateMember", member);
	}

	@Override
	public int checkIdDuplicate(String memberEmail) {
		return sqlSession.selectOne("member.checkIdDuplicate",memberEmail);
	}

	@Override
	public int updateMemberPwd(HashMap<String, String> hmap) {
		return sqlSession.update("member.updateMemberPwd",hmap);
	}

	@Override
	public int deleteMember(String memberNo) {
		return sqlSession.update("member.deleteMember",memberNo);
	}

	@Override
	public int insertDropout(HashMap<String, String> hmap) {
		return sqlSession.insert("member.insertDropout",hmap);
	}




	

	

}
