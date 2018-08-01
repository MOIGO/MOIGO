package com.kh.moigo.common.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moigo.common.model.dao.MainDao;
import com.kh.moigo.common.model.vo.JoinGroups;
import com.kh.moigo.common.model.vo.QNABoard;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MainDao mainDao; 
	
	@Override
	public List<QNABoard> qnaList(String selected) {
		return mainDao.qnaList(selected);
	}

	@Override
	public List<JoinGroups> joingroups(String mno) {
		return mainDao.joingroups(mno);
	}
			
			
}
