package com.kh.moigo.search.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.moigo.groups.model.vo.Groups;

@Repository
public class SearchDaoImpl implements SearchDao {

	@Autowired
	SqlSessionTemplate session;

	@Override
	public int detailListCount(Map<String, String> map) {
		return session.selectOne("search.detailListCount", map);
	}

	@Override
	   public List<Groups> detailSelectList(Map<String, String> map) {
	      RowBounds row = new RowBounds((Integer.parseInt((map.get("cPage")))-1) * Integer.parseInt(map.get("limit")), Integer.parseInt(map.get("limit")));
	      return session.selectList("search.detailSelectList", map, row);
	   }

	@Override
	public List<Groups> getAddressList(Map<String, String> map) {
		return session.selectList("search.getAddressList", map);
	}

}
