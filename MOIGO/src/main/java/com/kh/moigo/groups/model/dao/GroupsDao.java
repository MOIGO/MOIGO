package com.kh.moigo.groups.model.dao;

import java.util.List;
import java.util.Map;

public interface GroupsDao {

	List<Map<String, String>> selectGroupMemberList(String groupNo);
	
	List<Map<String, String>> searchGroupMemberList(Map<String, String> searchMap);

}
