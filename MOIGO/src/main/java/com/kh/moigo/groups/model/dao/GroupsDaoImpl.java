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
import com.kh.moigo.groups.model.vo.PostWithMem;

@Repository
public class GroupsDaoImpl implements GroupsDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectGroupMemberList(String groupNo) {
		return sqlSession.selectList("groups.selectGroupMemberList", groupNo);
	}

	@Override
	public int addPost(Post p) {
		
		Map<String,String> map = new HashMap<String, String>();
		
		map.put("groupNo", p.getGroupNo());
		map.put("memberNo", p.getMemberNo());;
		map.put("postContent", p.getContent());
		map.put("isNotice", p.getIsNotice());
		
		
		return sqlSession.insert("groups.addPost",map);
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

}
