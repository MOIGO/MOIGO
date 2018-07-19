package com.kh.moigo.groups.model.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moigo.groups.model.dao.GroupsDao;

@Service
public class GroupsServiceImpl implements GroupsService {
	
	@Autowired
	private GroupsDao groupDao;

	@Override
	public List<Map<String, String>> selectGroupMemberList(String groupNo) {
		return groupDao.selectGroupMemberList(groupNo);
	}

	@Override
	public List<Map<String, String>> searchGroupMemberList(Map<String, String> searchMap) {
		return groupDao.searchGroupMemberList(searchMap);
	}

}
