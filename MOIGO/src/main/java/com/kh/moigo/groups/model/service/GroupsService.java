package com.kh.moigo.groups.model.service;


import java.util.ArrayList;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.groups.model.vo.Post;
import com.kh.moigo.groups.model.vo.PostWithMem;

public interface GroupsService {

	List<Map<String, String>> selectGroupMemberList(String groupNo);
	int addPost(Post p);
	
	ArrayList<PostWithMem> selectPostList(String groupNo,PageInfo p);
	
	int selectPostCnt(String groupNo);
  
	List<Map<String, String>> searchGroupMemberList(Map<String, String> searchMap);
}
