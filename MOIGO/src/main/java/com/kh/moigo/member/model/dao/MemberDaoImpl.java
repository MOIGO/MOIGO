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
	public Member selectOne(String memberNo) {
		
		System.out.println(memberNo);
		
		return sqlSession.selectOne("member.selectOne",memberNo);
	}

}
