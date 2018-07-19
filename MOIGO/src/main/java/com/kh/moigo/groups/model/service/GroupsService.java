package com.kh.moigo.groups.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface GroupsService {

	List<Map<String, String>> selectGroupMemberList(String groupNo);

	List<Map<String, String>> searchGroupMemberList(Map<String, String> searchMap);

}
