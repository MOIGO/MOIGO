package com.kh.moigo.groups.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.groups.model.vo.Post;
import com.kh.moigo.groups.model.vo.PostReply;
import com.kh.moigo.groups.model.vo.PostWithMem;
import com.kh.moigo.groups.model.vo.Schedule;
import com.kh.moigo.groups.model.vo.Files;
import com.kh.moigo.groups.model.vo.GroupMember;
import com.kh.moigo.groups.model.vo.Groups;

public interface GroupsDao {

	int createGroup(Groups group);
	
	int updateGroupImg(Groups group);
	
	int insertPost(Post p);
	
	int selectPostCnt(String groupNo);
	
	ArrayList<PostWithMem> selectPostList(String groupNo,PageInfo p );
	
	int insertReply(PostReply r);

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

	GroupMember selectOneGrpMemberWithMemNo(GroupMember gm);
	
	int selectKeywordPostCnt(String groupNo, String keyword);
	
	ArrayList<PostWithMem> selectKeywordPost(String groupNo, String keyword, PageInfo p);
	
	int updateGroupBasics(Groups group);
	
	int insertImageFile(Files files);
	
//-------------------------------------------------------------------------------- 혜진
	
	Groups selectOneGroup(String groupNo);
	
	List<GroupMember> selectGroupMemberList(String groupNo);
	List<GroupMember> searchGroupMemberList(Map<String, String> searchMap);
	int updateGroupMember(GroupMember groupMember);

	int updateGroupCondition(Groups group);
	int updateGroupMemberSetting(Map<String, Object> changeMap);
	int deleteGroupMember(Map<String, Object> changeMap);
	int deleteGroup(String groupNo);

	List<Schedule> selectListGroupSchedule(String groupNo);

	

	

	

	

	

}

