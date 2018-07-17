package com.kh.moigo.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.moigo.admin.model.vo.Accuse;
import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.member.model.vo.Member;

public interface AccuseDao {

	List<Map<String, Object>> selectAccuseList();
	int selectAccuseListCnt();
	List<Map<String, Object>> selectAccuseListPaging(PageInfo pi);
	Member selectMember(String id);
	List<Map<String, Object>> selectAccuse(String id);

}
