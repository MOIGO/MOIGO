package com.kh.moigo.groups.model.service;

<<<<<<< HEAD
=======

import java.util.ArrayList;

import java.util.HashMap;

>>>>>>> branch 'master' of https://github.com/MOIGO/MOIGO.git
import java.util.List;
import java.util.Map;

<<<<<<< HEAD
import com.kh.moigo.groups.model.vo.GroupMember;
=======
import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.groups.model.vo.Post;
import com.kh.moigo.groups.model.vo.PostWithMem;
>>>>>>> branch 'master' of https://github.com/MOIGO/MOIGO.git

public interface GroupsService {

	List<Map<String, String>> selectGroupMemberList(String groupNo);
	int addPost(Post p);
	
	ArrayList<PostWithMem> selectPostList(String groupNo,PageInfo p);
	
	int selectPostCnt(String groupNo);
  
	List<Map<String, String>> searchGroupMemberList(Map<String, String> searchMap);
<<<<<<< HEAD

	int updateGroupMember(GroupMember groupMember);

=======
>>>>>>> branch 'master' of https://github.com/MOIGO/MOIGO.git
}
