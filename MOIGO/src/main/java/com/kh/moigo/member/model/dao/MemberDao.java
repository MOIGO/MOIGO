package com.kh.moigo.member.model.dao;

import com.kh.moigo.member.model.vo.Member;

public interface MemberDao {

	Member selectOne(String memberNo);
}
