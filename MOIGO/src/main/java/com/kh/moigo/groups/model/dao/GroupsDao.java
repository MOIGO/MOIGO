package com.kh.moigo.groups.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.groups.model.vo.Post;
import com.kh.moigo.groups.model.vo.PostWithMem;

import com.kh.moigo.groups.model.vo.GroupMember;

public interface GroupsDao {

	int addPost(Post p);
	
	int selectPostCnt(String groupNo);
	
	ArrayList<PostWithMem> selectPostList(String groupNo,PageInfo p );

//-------------------------------------------------------------------------------- 혜진
	
	List<Map<String, String>> selectGroupMemberList(String groupNo);
	
	List<Map<String, String>> searchGroupMemberList(Map<String, String> searchMap);

	int updateGroupMember(GroupMember groupMember);

	int deleteGroup(String groupNo);

}
