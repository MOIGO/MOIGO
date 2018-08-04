package com.kh.moigo.admin.model.vo;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.kh.moigo.member.model.vo.Member;

@JsonAutoDetect
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
	private int genderCount;
	private String metrocity;
	private int addressCount;
	private String bigInterest;
	private int minterestCount;
	private int countWmember;
	private int totalMember;
	private int todayMember;
	private String enrollM;
	private int mmCount;

	public String getEnrollM() {
		return enrollM;
	}
	public void setEnrollM(String enrollM) {
		this.enrollM = enrollM;
	}
	public int getMmCount() {
		return mmCount;
	}
	public void setMmCount(int mmCount) {
		this.mmCount = mmCount;
	}
	public int getTotalMember() {
		return totalMember;
	}
	public void setTotalMember(int totalMember) {
		this.totalMember = totalMember;
	}
	public int getTodayMember() {
		return todayMember;
	}
	public void setTodayMember(int todayMember) {
		this.todayMember = todayMember;
	}
	public int getCountWmember() {
		return countWmember;
	}
	public void setCountWmember(int countWmember) {
		this.countWmember = countWmember;
	}
	public String getEnrollD() {
		return enrollD;
	}
	public void setEnrollD(String enrollD) {
		this.enrollD = enrollD;
	}
	private String enrollD;
	//private List<Map<String, Object>> memPerGroup;
	
	
	
	
	public int getMinterestCount() {
		return minterestCount;
	}
	public String getBigInterest() {
		return bigInterest;
	}
	public void setBigInterest(String bigInterest) {
		this.bigInterest = bigInterest;
	}
	public void setMinterestCount(int minterestCount) {
		this.minterestCount = minterestCount;
	}
	public MemberDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMetrocity() {
		return metrocity;
	}
	public void setMetrocity(String metrocity) {
		this.metrocity = metrocity;
	}
	public int getAddressCount() {
		return addressCount;
	}
	public void setAddressCount(int addressCount) {
		this.addressCount = addressCount;
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
	@Override
	public String toString() {
		return "MemberDetail [enrollGroup=" + enrollGroup + ", postCount=" + postCount + ", replyCount=" + replyCount
				+ ", accuseCount=" + accuseCount + ", toString()=" + super.toString() + "]";
	}
	public int getGenderCount() {
		return genderCount;
	}
	public void setGenderCount(int genderCount) {
		this.genderCount = genderCount;
	}

	
	
	

}
