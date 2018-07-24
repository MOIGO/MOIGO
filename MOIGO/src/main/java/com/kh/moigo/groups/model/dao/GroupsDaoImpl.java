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
import com.kh.moigo.groups.model.vo.PostReply;
import com.kh.moigo.groups.model.vo.PostWithMem;

import com.kh.moigo.groups.model.vo.GroupMember;
import com.kh.moigo.groups.model.vo.Groups;

@Repository
public class GroupsDaoImpl implements GroupsDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	
	@Override
	public int createGroup(Groups group) {
		
		return sqlSession.selectOne("groups.insertGroup", group);
	}

	@Override
	public int updateGroupImg(Groups group) {
		
		return sqlSession.update("groups.updateGroupCover",group);
	}
	
	@Override
	public int insertPost(Post p) {
		
		Map<String,String> map = new HashMap<String, String>();
		
		map.put("groupNo", p.getGroupNo());
		map.put("memberNo", p.getMemberNo());;
		map.put("postContent", p.getContent());
		map.put("isNotice", p.getIsNotice());
		
		return sqlSession.insert("groups.insertPost",map);
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


	//------------------------------------------------------------------------- 혜진
	
	@Override
	public List<Map<String, String>> selectGroupMemberList(String groupNo) {
		return sqlSession.selectList("groups.selectGroupMemberList", groupNo);
	}
	
	@Override
	public List<Map<String, String>> searchGroupMemberList(Map<String, String> searchMap) {
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

	

}
