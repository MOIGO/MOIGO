package com.kh.moigo.search.model.service;

import java.util.List;
import java.util.Map;

import com.kh.moigo.groups.model.vo.Groups;

public interface SearchService {

	int listCount(String keyword);

	List<Groups> selectList(String keyword);

	int detailListCount(Map<String, String> map);

	List<Groups> detailSelectList(Map<String, String> map);

	List<Groups> getAddressList(Map<String, String> map);

}
