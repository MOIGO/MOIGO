package com.kh.moigo.common.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.moigo.common.model.vo.JoinGroups;
import com.kh.moigo.common.model.vo.QNABoard;

public interface MainService {

	List<QNABoard> qnaList(String selected);

	List<JoinGroups> joingroups(String mno);

	List<JoinGroups> recommendgroups();

	
	
}
