package com.kh.moigo.groups.model.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.groups.model.vo.Post;
import com.kh.moigo.groups.model.vo.PostReply;
import com.kh.moigo.groups.model.vo.PostWithMem;

public interface GroupsService {

	List<Map<String, String>> selectGroupMemberList(String groupNo);
	int insertPost(Post p);
	int insertReply(PostReply r);
	ArrayList<PostWithMem> selectPostList(String groupNo,PageInfo p);
	
	int selectPostCnt(String groupNo);
	
	List<Map<String, String>> searchGroupMemberList(Map<String, String> searchMap);
	int deletePost(String postNo);
	int deleteReply(String replyNo);
	int updatePost(Post post);
	int updateReply(PostReply postReply);
}
