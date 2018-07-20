package com.kh.moigo.groups.model.service;

import java.util.List;
import java.util.Map;

import com.kh.moigo.groups.model.vo.GroupMember;

public interface GroupsService {

	List<Map<String, String>> selectGroupMemberList(String groupNo);

	List<Map<String, String>> searchGroupMemberList(Map<String, String> searchMap);

	int updateGroupMember(GroupMember groupMember);

}
