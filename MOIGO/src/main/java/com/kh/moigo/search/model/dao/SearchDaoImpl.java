package com.kh.moigo.search.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.moigo.groups.model.vo.Groups;

@Repository
public class SearchDaoImpl implements SearchDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int listCount(String keyword) {
		return session.selectOne("search.listCount", keyword);
	}

	@Override
	public List<Groups> selectList(String keyword) {
		return session.selectList("search.selectList", keyword);
	}

	@Override
	public int detailListCount(Map<String, String> map) {
		return session.selectOne("search.detailListCount", map);
	}

	@Override
	public List<Groups> detailSelectList(Map<String, String> map) {
		return session.selectList("search.detailSelectList", map);
	}

}
