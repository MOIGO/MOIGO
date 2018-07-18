package com.kh.moigo.admin.model.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.moigo.admin.model.vo.GroupDetail;
import com.kh.moigo.admin.model.vo.MemberDetail;
import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.member.model.vo.Member;


@Repository
public class AccuseDaoImpl implements AccuseDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> selectAccuseList() {
		System.out.println("신고 dao");
		return sqlSession.selectList("accuse.selectAccuseList");
	}

	@Override
	public int selectAccuseListCnt() {
		// TODO Auto-generated method stub
		System.out.println("신고카운트 dao");
		int result =sqlSession.selectOne("accuse.selectAccuseListCnt");
		System.out.println("result" +result);
		return sqlSession.selectOne("accuse.selectAccuseListCnt");
	}

	@Override
	public List<Map<String, Object>> selectAccuseListPaging(PageInfo pi) {
		System.out.println("신고 dao");
		return sqlSession.selectList("accuse.selectAccuseListPaging",pi);
	}

	@Override
	public Member selectMember(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOne",id);
	}

	@Override
	public List<Map<String, Object>> selectAccuse(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("accuse.selectList",id);
	}

	@Override
	public List<Map<String, Object>> selectmemberList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("member.selectMemberList");
	}

	@Override
	public MemberDetail memDetail(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberDetail.memDetail",id);
	}

	@Override
	public List<Map<String, Object>> memPerGroup(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberDetail.memPerGroup",id);
	}

	@Override
	public GroupDetail grpDetail(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("groupDetail.grpDetail",id);
	}

	@Override
	public List<Map<String, Object>> selectgroupList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("groups.selectGroupList");
	}
	


	

}
