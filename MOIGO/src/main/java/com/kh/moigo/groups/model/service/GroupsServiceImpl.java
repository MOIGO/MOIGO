package com.kh.moigo.groups.model.service;


import java.util.*;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.groups.model.dao.GroupsDao;
import com.kh.moigo.groups.model.vo.Files;
import com.kh.moigo.groups.model.vo.GroupMember;
import com.kh.moigo.groups.model.vo.Groups;
import com.kh.moigo.groups.model.exception.GroupsExeption;
import com.kh.moigo.groups.model.vo.Post;
import com.kh.moigo.groups.model.vo.PostFiles;
import com.kh.moigo.groups.model.vo.PostWithMem;
import com.kh.moigo.groups.model.vo.Schedule;
import com.kh.moigo.groups.model.vo.PostReply;

@Service
public class GroupsServiceImpl implements GroupsService {
	
	@Autowired
	private GroupsDao groupDao;

	
	@Override
	public int createGroup(Groups group) {
		
		return groupDao.createGroup(group);
	}
	
	@Override
	public int updateGroupImg(Groups group) {
		
		return groupDao.updateGroupImg(group);
	}

	@Override
	public int insertPost(Post p) {
	
		int result = groupDao.insertPost(p);
		
		if(result==0) throw new GroupsExeption();
		
		return result;
	}

	@Override
	public ArrayList<PostWithMem> selectPostList(String groupNo, PageInfo p) {
		
		return groupDao.selectPostList(groupNo, p);
	}

	@Override
	public int selectPostCnt(String groupNo) {	
		return groupDao.selectPostCnt(groupNo);
	}
	
	@Override
	public int insertReply(PostReply r) {
		
		return groupDao.insertReply(r);
	}

	@Override
	public int deletePost(String postNo) {
		
		return groupDao.deletePost(postNo);
	}

	@Override
	public int deleteReply(String replyNo) {
		
		return groupDao.deleteReply(replyNo);
	}

	@Override
	public int updatePost(Post post) {
		
		return groupDao.updatePost(post);
	}
  
	@Override
	public int updateReply(PostReply postReply) {	
		return groupDao.updateReply(postReply);
	}
  
  	@Override
	public int selectGrpMemNum(String groupNo) {
		
		return groupDao.selectGrpMemNum(groupNo);
	}
  	
  	@Override
	public GroupMember selectGroupLeader(String groupNo) {
		
		return groupDao.selectGroupLeader(groupNo);
	}
  	
  	@Override
	public GroupMember selectOneMember(GroupMember gm) {
		return groupDao.selectOneMember(gm);
		
	}
  	
  	@Override
	public int insertGroupMember(GroupMember gm) {
		return groupDao.insertGroupMember(gm);
		
	}
  	
  	@Override
	public int insertSchedule(Schedule schedule) {
		
		return groupDao.insertSchedule(schedule);
	}
  	

	@Override
	public Schedule selectOneSchedule(String scheduleNo) {
		
		return groupDao.selectOneSchedule(scheduleNo);
	}
	
	@Override
	public int updateSchedule(Schedule schedule) {
		
		return groupDao.updateSchedule(schedule);
	}
	

	@Override
	public int deleteSchedule(String scheduleNo) {
		
		return groupDao.deleteSchedule(scheduleNo);
	}
	
	
	@Override
	public GroupMember selectOneGrpMemberWithMemNo(GroupMember gm) {
		
		return groupDao.selectOneGrpMemberWithMemNo(gm);
	}
	
	@Override
	public int selectKeywordPostCnt(String groupNo, String keyword) {
		
		return groupDao.selectKeywordPostCnt(groupNo,keyword);
	}

	@Override
	public ArrayList<PostWithMem> selectKeywordPost(String groupNo, String keyword, PageInfo p) {
		
		return groupDao.selectKeywordPost(groupNo,keyword,p);
	}

	@Override
	public int updategroupBasics(Groups group) {
		
		return groupDao.updateGroupBasics(group);
	}

	@Override
	public int insertImageFile(Files files) {
		return groupDao.insertImageFile(files);
		
	}
	
	@Override
	public int insertPostFiles(PostFiles postFiles) {
		
		return groupDao.insertPostFiles(postFiles);
	}

  
	//--------------------------------------------------------------------- 혜진
	
	@Override
	public List<GroupMember> selectGroupMemberList(String groupNo) {
		return groupDao.selectGroupMemberList(groupNo);
	}
	
	@Override
	public List<GroupMember> searchGroupMemberList(Map<String, String> searchMap) {
		return groupDao.searchGroupMemberList(searchMap);
	}

	@Override
	public int updateGroupMember(GroupMember groupMember) {
		return groupDao.updateGroupMember(groupMember);
	}

	@Override
	public int deleteGroup(String groupNo) {
		return groupDao.deleteGroup(groupNo);
	}

	@Override
	public Groups selectOneGroup(String groupNo) {
		return groupDao.selectOneGroup(groupNo);
	}

	@Override
	public int updateGroupCondition(Groups group) {
		return groupDao.updateGroupCondition(group);
	}


	@Override
	public int updateGroupMemberSetting(Map<String, Object> changeMap) {
		return groupDao.updateGroupMemberSetting(changeMap);
	}

	@Override
	public int deleteGroupMember(Map<String, Object> changeMap) {
		return groupDao.deleteGroupMember(changeMap);
	}

	@Override
	public List<Schedule> selectListGroupSchedule(String groupNo) {
		return groupDao.selectListGroupSchedule(groupNo);
	}

	

	
}