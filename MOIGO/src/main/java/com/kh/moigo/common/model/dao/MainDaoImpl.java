package com.kh.moigo.common.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.moigo.common.model.vo.QNABoard;

@Repository
public class MainDaoImpl implements MainDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<QNABoard> qnaList(String selected) {
		return sqlSession.selectList("qna.qnaList",selected);
	}

}
