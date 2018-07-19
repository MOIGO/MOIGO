package com.kh.moigo.groups.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.groups.model.vo.Post;

public interface GroupsDao {

	List<Map<String, String>> selectGroupMemberList(String groupNo);
	
	int addPost(Post p);
	
	int selectPostCnt(String groupNo);
	
	ArrayList<Post> selectPostList(String groupNo,PageInfo p );
}
