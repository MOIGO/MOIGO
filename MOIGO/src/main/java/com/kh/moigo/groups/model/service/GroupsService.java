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
import com.kh.moigo.groups.model.vo.Schedule;
import com.kh.moigo.groups.model.vo.PostReply;

public interface GroupsService {

	
	int createGroup(Groups group);
	int updateGroupImg(Groups group);
	int insertPost(Post p);
	int insertReply(PostReply r);
	ArrayList<PostWithMem> selectPostList(String groupNo,PageInfo p);
	
	int selectPostCnt(String groupNo);
	int deletePost(String postNo);
	int deleteReply(String replyNo);
	int updatePost(Post post);

	int updateReply(PostReply postReply);

	int selectGrpMemNum(String groupNo);
	
	GroupMember selectGroupLeader(String groupNo);
	GroupMember selectOneMember(GroupMember gm);
	int insertGroupMember(GroupMember gm);
	int insertSchedule(Schedule schedule);
	Schedule selectOneSchedule(String scheduleNo);
	int updateSchedule(Schedule schedule);
	int deleteSchedule(String scheduleNo);
	
	//--------------------------------------------------------------------------- 혜진
	
	List<GroupMember> selectGroupMemberList(String groupNo);

	List<GroupMember> searchGroupMemberList(Map<String, String> searchMap);

	int updateGroupMember(GroupMember groupMember);

	Groups selectOneGroup(String groupNo);
	
	int updateGroupCondition(Groups group);

	int deleteGroup(String groupNo);

	
	
	
	
	
	

	

}
