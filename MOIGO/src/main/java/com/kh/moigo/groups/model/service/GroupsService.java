package com.kh.moigo.groups.model.service;

import java.util.List;
import java.util.Map;

public interface GroupsService {

	List<Map<String, String>> selectGroupMemberList(String groupNo);

}
