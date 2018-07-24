package com.kh.moigo.common.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.moigo.common.model.vo.QNABoard;

public class MainDaoImpl implements MainDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<QNABoard> qnaList() {
		return sqlSession.selectList("qna.qnaList");
	}

}
