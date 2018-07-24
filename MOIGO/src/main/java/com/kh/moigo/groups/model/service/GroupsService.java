package com.kh.moigo.groups.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import com.kh.moigo.groups.model.vo.GroupMember;
import com.kh.moigo.groups.model.vo.Groups;
import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.groups.model.vo.Post;
import com.kh.moigo.groups.model.vo.PostWithMem;
import com.kh.moigo.groups.model.vo.PostReply;

public interface GroupsService {

	int insertPost(Post p);
	int insertReply(PostReply r);
	ArrayList<PostWithMem> selectPostList(String groupNo,PageInfo p);
	
	int selectPostCnt(String groupNo);
	int deletePost(String postNo);
	int deleteReply(String replyNo);

	int updatePost(Post post);
	int updateReply(PostReply postReply);

	int updatePost(Post post);

	//--------------------------------------------------------------------------- 혜진
	
	List<Map<String, String>> selectGroupMemberList(String groupNo);
	
	List<Map<String, String>> searchGroupMemberList(Map<String, String> searchMap);
  
	int updateGroupMember(GroupMember groupMember);

	int deleteGroup(String groupNo);
	
	Groups selectOneGroup(String groupNo);

}
