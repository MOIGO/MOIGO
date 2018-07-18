package com.kh.moigo.member.model.dao;

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
	public int deleteMember(int memberNo) {
		return sqlSession.update("member.deleteMember", memberNo);
	}

	@Override
	public int checkIdDuplicate(String memberEmail) {
		return sqlSession.selectOne("member.checkIdDuplicate",memberEmail);
	}


}
