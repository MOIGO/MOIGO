package com.kh.moigo.admin.model.vo;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.kh.moigo.member.model.vo.Member;

public class MemberDetail extends Member implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6145632344199336498L;
	/**
	 * 
	 */
	private int enrollGroup;
	private int postCount;
	private int replyCount;
	private int accuseCount;
	
	//private List<Map<String, Object>> memPerGroup;
	
	
	
	
	public MemberDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDetail(String memberNo, String memberEmail, String memberPwd, String memberName, String memberAddress,
			Date memberBirth, String memberGender, Date enrollDate, String delflag,int enrollGroup, int postCount, int replyCount, int accuseCount) {
		super(memberNo, memberEmail, memberPwd, memberName, memberAddress, memberBirth, memberGender, enrollDate, delflag);
		this.enrollGroup = enrollGroup;
		this.postCount = postCount;
		this.replyCount = replyCount;
		this.accuseCount = accuseCount;
		//this.memPerGroup = memPerGroup;
		// TODO Auto-generated constructor stub
	}

	public int getPostCount() {
		return postCount;
	}
	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getEnrollGroup() {
		return enrollGroup;
	}
	public void setEnrollGroup(int enrollGroup) {
		this.enrollGroup = enrollGroup;
	}
//	public List<Map<String, Object>> getMemPerGroup() {
//		return memPerGroup;
//	}
//	public void setMemPerGroup(List<Map<String, Object>> memPerGroup) {
//		this.memPerGroup = memPerGroup;
//	}
	public int getAccuseCount() {
		return accuseCount;
	}
	public void setAccuseCount(int accuseCount) {
		this.accuseCount = accuseCount;
	}

	
	
	
	

}
