package com.kh.moigo.groups.model.dao;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.groups.model.vo.Post;
import com.kh.moigo.groups.model.vo.PostFiles;
import com.kh.moigo.groups.model.vo.PostReply;
import com.kh.moigo.groups.model.vo.PostWithMem;
import com.kh.moigo.groups.model.vo.Schedule;
import com.kh.moigo.groups.model.vo.Files;
import com.kh.moigo.groups.model.vo.GroupMember;
import com.kh.moigo.groups.model.vo.Groups;

@Repository
public class GroupsDaoImpl implements GroupsDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int createGroup(Groups group) {
		
		return sqlSession.insert("groups.insertGroup", group);
	}

	@Override
	public int updateGroupImg(Groups group) {
		
		return sqlSession.update("groups.updateGroupCover",group);
	}
	
	@Override
	public int insertPost(Post p) {
		
		/*Map<String,String> map = new HashMap<String, String>();
		
		map.put("groupNo", p.getGroupNo());
		map.put("memberNo", p.getMemberNo());;
		map.put("postContent", p.getContent());
		map.put("isNotice", p.getIsNotice());*/
		
		return sqlSession.insert("groups.insertPost",p);
	}

	@Override
	public int selectPostCnt(String groupNo) {
		
		return sqlSession.selectOne("groups.selectPostCnt",groupNo);
	}

	@Override
	public ArrayList<PostWithMem> selectPostList(String groupNo, PageInfo p) {
			
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("groupNo", groupNo);
		map.put("startRow", p.getStartRow());
		map.put("endRow", p.getEndRow());
		
		return new ArrayList<PostWithMem>(sqlSession.selectList("groups.selectPostWithMemList",map));
	}
	
	@Override
	public int insertReply(PostReply r) {
		
		return sqlSession.insert("groups.insertReply",r);
	}

	@Override
	public int deletePost(String postNo) {
		
		return sqlSession.delete("groups.deletePost",postNo);
	}

	@Override
	public int deleteReply(String replyNo) {
		
		return sqlSession.delete("groups.deleteReply",replyNo);
	}

	@Override
	public int updatePost(Post post) {
		
		return sqlSession.update("groups.updatePost",post);
	}


	@Override
	public int updateReply(PostReply postReply) {
		
		return sqlSession.update("groups.updateReply",postReply);
	}
	
	@Override
	public int selectGrpMemNum(String groupNo) {
		
		return sqlSession.selectOne("groups.selectGrpMemNum",groupNo);
	}
	
	@Override
	public GroupMember selectGroupLeader(String groupNo) {
		
		return sqlSession.selectOne("groups.selectGroupLeader",groupNo);
	}
	
	@Override
	public GroupMember selectOneMember(GroupMember gm) {
		
		return sqlSession.selectOne("groups.selectOneGrpMem",gm);
	}
	
	@Override
	public int insertGroupMember(GroupMember gm) {
		
		return sqlSession.insert("groups.insertGroupMember",gm);
	}
	
	@Override
	public int insertSchedule(Schedule schedule) {
		
		return sqlSession.insert("groups.insertSchedule",schedule);
	}
	
	@Override
	public Schedule selectOneSchedule(String scheduleNo) {
		
		return sqlSession.selectOne("groups.selectOneSchedule",scheduleNo);
	}

	@Override
	public int updateSchedule(Schedule schedule) {
		
		return sqlSession.update("groups.updateSchedule",schedule);
	}
	
	@Override
	public int deleteSchedule(String scheduleNo) {
		
		return sqlSession.update("groups.deleteSchedule",scheduleNo);
	}
	
	@Override
	public GroupMember selectOneGrpMemberWithMemNo(GroupMember gm) {
		
		return sqlSession.selectOne("groups.selectOneGroupMember",gm);
	}

	@Override
	public int selectKeywordPostCnt(String groupNo, String keyword) {
		
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("groupNo", groupNo);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("groups.selectKeywordPostCnt", map);
		
		
	}


	@Override
	public ArrayList<PostWithMem> selectKeywordPost(String groupNo, String keyword, PageInfo p) {
	
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("groupNo", groupNo);
		map.put("keyword", keyword);
		map.put("startRow", p.getStartRow());
		map.put("endRow", p.getStartRow());
		
		return new ArrayList<PostWithMem>(sqlSession.selectList("groups.selectKeywordPost",map));
	}
	
	
	@Override
	public int updateGroupBasics(Groups group) {
		
		return sqlSession.update("groups.updateGroupBasics",group);
	}

	@Override
	public int insertImageFile(Files files) {
		return sqlSession.insert("groups.insertImageFile",files);
	}
	
	

	@Override
	public int deleteOneGroupMember(GroupMember groupMember) {
		
		return sqlSession.delete("groups.deleteOneGroupMember",groupMember);
	}


	//------------------------------------------------------------------------- 혜진
	
	@Override
	public List<GroupMember> selectGroupMemberList(String groupNo) {
		return sqlSession.selectList("groups.selectGroupMemberList", groupNo);
	}
	
	@Override
	public List<GroupMember> searchGroupMemberList(Map<String, String> searchMap) {
		return sqlSession.selectList("groups.searchGroupMemberList", searchMap);
	}

	@Override
	public int updateGroupMember(GroupMember groupMember) {
		return sqlSession.update("groups.updateGroupMember", groupMember);
	}

	@Override
	public int deleteGroup(String groupNo) {
		return sqlSession.delete("groups.deleteGroup", groupNo);
	}

	@Override
	public Groups selectOneGroup(String groupNo) {
		return sqlSession.selectOne("groups.selectOneGroup", groupNo);
	}

	@Override
	public int updateGroupCondition(Groups group) {
		return sqlSession.update("groups.updateGroupCondition", group);
	}
	
	@Override
	public int updateGroupMemberSetting(Map<String, Object> changeMap) {
		return sqlSession.update("groups.updateGroupMemberSetting", changeMap);
	}

	@Override
	public int deleteGroupMember(Map<String, Object> changeMap) {
		return sqlSession.delete("groups.deleteGroupMember", changeMap);
	}

	@Override
	public List<Schedule> selectListGroupSchedule(String groupNo) {
		return sqlSession.selectList("groups.selectListGroupSchedule", groupNo);
	}

	


}

