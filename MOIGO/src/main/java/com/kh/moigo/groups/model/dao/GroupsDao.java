package com.kh.moigo.groups.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.groups.model.vo.Post;
import com.kh.moigo.groups.model.vo.PostReply;
import com.kh.moigo.groups.model.vo.PostWithMem;

public interface GroupsDao {

	List<Map<String, String>> selectGroupMemberList(String groupNo);
	

	int insertPost(Post p);
	
	int selectPostCnt(String groupNo);
	
	ArrayList<PostWithMem> selectPostList(String groupNo,PageInfo p );

	List<Map<String, String>> searchGroupMemberList(Map<String, String> searchMap);


	int insertReply(PostReply r);


	int deletePost(String postNo);


	int deleteReply(String replyNo);


	int updatePost(Post post);


}
