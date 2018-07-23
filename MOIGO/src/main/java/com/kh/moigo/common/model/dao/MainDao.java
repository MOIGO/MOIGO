package com.kh.moigo.common.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.moigo.common.model.vo.QNABoard;

@Repository
public interface MainDao {

	List<QNABoard> qnaList();
	
}
