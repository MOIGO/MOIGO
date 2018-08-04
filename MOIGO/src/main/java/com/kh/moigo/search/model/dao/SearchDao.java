package com.kh.moigo.search.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.moigo.groups.model.vo.Groups;

public interface SearchDao {

	int detailListCount(Map<String, String> map);

	List<Groups> detailSelectList(Map<String, String> map);

	List<Groups> getAddressList(Map<String, String> map);
}
