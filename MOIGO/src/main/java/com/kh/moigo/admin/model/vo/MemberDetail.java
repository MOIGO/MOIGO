package com.kh.moigo.admin.model.vo;

import java.sql.Date;

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
	
	
	public MemberDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDetail(String memberNo, String memberEmail, String memberPwd, String memberName, String memberAddress,
			Date memberBirth, String memberGender, Date enrollDate, String delflag,int enrollGroup, int postCount, int replyCount) {
		super(memberNo, memberEmail, memberPwd, memberName, memberAddress, memberBirth, memberGender, enrollDate, delflag);
		this.enrollGroup = enrollGroup;
		this.postCount = postCount;
		this.replyCount = replyCount;
		// TODO Auto-generated constructor stub
	}
	public int getEnrollGR() {
		return enrollGroup;
	}
	public void setEnrollGR(int enrollGroup) {
		this.enrollGroup = enrollGroup;
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
	
	
	
	

}
