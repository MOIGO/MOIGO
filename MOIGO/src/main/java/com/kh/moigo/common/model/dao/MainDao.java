package com.kh.moigo.common.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.moigo.common.model.vo.JoinGroups;
import com.kh.moigo.common.model.vo.QNABoard;

@Repository
public interface MainDao {

	List<QNABoard> qnaList(String selected);

	List<JoinGroups> joingroups(String mno);
	
}
