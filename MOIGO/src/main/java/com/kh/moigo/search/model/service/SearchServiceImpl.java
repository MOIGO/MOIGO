package com.kh.moigo.search.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moigo.groups.model.vo.Groups;
import com.kh.moigo.search.model.dao.SearchDao;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	SearchDao searchDao;

	@Override
	public int detailListCount(Map<String, String> map) {
		return searchDao.detailListCount(map);
	}

	@Override
	public List<Groups> detailSelectList(Map<String, String> map) {
		return searchDao.detailSelectList(map);
	}

	@Override
	public List<Groups> getAddressList(Map<String, String> map) {
		return searchDao.getAddressList(map);
	}


}
