package com.kh.moigo.admin.model.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.moigo.admin.model.vo.GroupDetail;
import com.kh.moigo.admin.model.vo.MemberDetail;
import com.kh.moigo.admin.model.vo.PageInfo;
import com.kh.moigo.member.model.vo.Member;


@Repository
public class AccuseDaoImpl implements AccuseDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override //단순 신고 불러오기
	public List<Map<String, Object>> selectAccuseList() {
		System.out.println("신고 dao");
		return sqlSession.selectList("accuse.selectAccuseList");
	}

	@Override //paging 관련 신고갯수 부르기
	public int selectAccuseListCnt() {
		// TODO Auto-generated method stub

		return sqlSession.selectOne("accuse.selectAccuseListCnt");
	}

	@Override //paging 추가된 신고 리스트 불러오기.
	public List<Map<String, Object>> selectAccuseListPaging(PageInfo pi) {
		//System.out.println("신고 dao");
		return sqlSession.selectList("accuse.selectAccuseListPaging",pi);
	}

	@Override //memberlist 부르기
	public Member selectMember(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberDetail.memDetail",id);
	}

	

	@Override
	public List<Map<String, Object>> selectmemberList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("member.selectMemberList");
	}

	@Override //멤버 한 사람의 다양한 정보 불러오기
	public MemberDetail memDetail(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberDetail.memDetail",id);
	}

	@Override //멤버 한 사람의 가입 그룹 불러오기
	public List<Map<String, Object>> memPerGroup(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memPerGroup.memPerGroup",id);
	}

	@Override //그룹 하나의 여러 정보 불러오기
	public GroupDetail grpDetail(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("groupDetail.grpDetail",id);
	}

	@Override
	public List<Map<String, Object>> selectgroupList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("groups.selectGroupList");
	}

	@Override
	public List<Map<String, Object>> grpPerMem(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("grpMember.grpMember",id);
	}

	@Override
	public List<Map<String, Object>> atop5memberList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("acusseTop5.atop5memberList");
	}

	@Override
	public List<Map<String, Object>> atop5groupList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("acusseTop5.atop5groupList");
	}

	@Override
	public List<Map<String, Object>> selectAccuse(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("accuse.selectTMList",id);
	}

	@Override
	public List<Map<String, Object>> selectAccuse2(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("accuse.selectTGList",id);
	}

	@Override
	public ArrayList countGender() {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("memberDetail.genderCount");
	}

	@Override
	public List<Map<String, Object>> countAddress() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberDetail.addressCount");
	}

	@Override
	public List<Map<String, Object>> countMinterest() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberDetail.minterestCount");
	}

	@Override
	public List<Map<String, Object>> gGradeCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("groupDetail.gGradeCount");
	}

	@Override
	public List<Map<String, Object>> countGinterest() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("groupDetail.ginterestCount");
	}

	@Override
	public List<Map<String, Object>> countState() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("groupDetail.stateCount");
	}

	@Override
	public List<Map<String, Object>> weeklyMemEnroll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberDetail.weeklyMemEnroll");
	}

	@Override
	public List<Map<String, Object>> weeklyGrpMake() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("groupDetail.weeklyMemEnroll");
	}

	@Override
	public List<Map<String, Object>> memberDashCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberDetail.memberDashCount");
	}

	@Override
	public List<Map<String, Object>> groupDashCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("groupDetail.groupDashCount");
	}

	@Override
	public List<Map<String, Object>> MemEnrollperMonth() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberDetail.MemEnrollperMonth");
	}

	@Override
	public List<Map<String, Object>> GrpEnrollperMonth() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("groupDetail.GrpEnrollperMonth");
	}
	
	
	
//	@Override //신고
//	public List<Map<String, Object>> selectAccusePaging(PageInfo pi) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList("accuse.selectListPaging",pi);
//	}
//
//	@Override
//	public int selectAccuseListCnt(String id) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne("accuse.selectAccuseListCntbyGId",id);
//	}

	

}
