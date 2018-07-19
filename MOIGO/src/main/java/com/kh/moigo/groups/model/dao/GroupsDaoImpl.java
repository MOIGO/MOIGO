package com.kh.moigo.groups.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroupsDaoImpl implements GroupsDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectGroupMemberList(String groupNo) {
		return sqlSession.selectList("groups.selectGroupMemberList", groupNo);
	}

	@Override
	public List<Map<String, String>> searchGroupMemberList(Map<String, String> searchMap) {
		return sqlSession.selectList("groups.searchGroupMemberList", searchMap);
	}


}
