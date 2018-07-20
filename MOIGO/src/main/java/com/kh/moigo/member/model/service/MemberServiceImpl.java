package com.kh.moigo.member.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moigo.member.model.dao.MemberDao;
import com.kh.moigo.member.model.vo.Member;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Override
	public Member selectOneMember(String memberEmail) {
		return memberDao.selectOneMember(memberEmail);
	}


	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}


	@Override
	public int checkIdDuplicate(String memberEmail) {
		return memberDao.checkIdDuplicate(memberEmail);
	}

	@Override
	public int updateMemberPwd(String memberEmail, String memberPwd) {
		
		HashMap<String, String> hmap = new HashMap<>();
		
		hmap.put("memberEmail",memberEmail);
		hmap.put("memberPwd",memberPwd);
		
		return memberDao.updateMemberPwd(hmap);
	}

	@Override
	public int deleteMember(String memberNo, String contentW) {
		HashMap<String, String> hmap = new HashMap<>();
		
		hmap.put("memberNo",memberNo);
		hmap.put("contentW",contentW);
		
		int result = memberDao.deleteMember(memberNo);
		if(result>0){
			result = memberDao.insertDropout(hmap);
		}
		return result;
		
		
	}
	
	
	
	

	@Override
	public int insertMember(Member member, List<String> interestList) {

		int result = 0;
		String memberNo = "";

		result = memberDao.insertMember(member);
		memberNo = member.getMemberNo();

		if (interestList.size() > 0) {
			for (String interest : interestList) {
				HashMap<String, String> hmap = new HashMap<>();

				hmap.put("memberNo", memberNo);
				hmap.put("interest", interest);

				int res = memberDao.insertMemberInterest(hmap);
			}
			
		} /*else if (interestList.size() == 0) {
			HashMap<String, String> hmap = new HashMap<>();

			hmap.put("memberNo", memberNo);
			hmap.put("interest", null);
		}*/
		System.out.println(memberNo);

		return result;
	}


	@Override
	public List<String> selectInterestList(String memberNo) {
		return memberDao.selectInterestList(memberNo);
	}




}
