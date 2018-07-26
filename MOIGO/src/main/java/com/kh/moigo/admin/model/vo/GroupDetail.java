package com.kh.moigo.admin.model.vo;

import java.sql.Date;

import com.kh.moigo.groups.model.vo.Groups;

public class GroupDetail extends Groups implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5252765492046188622L;
		
	private int memNum;
	private String masterEmail;
	private int gGradeCount;
	private String groupGradeName;
	private String groupStateName;
	private String bigInterest;
	private int ginterestCount;
	private int countWgroup;
	private String enrollD;
	private int totalGroup;
	private int todayGroup;
	private String enrollM;
	private int grCount;
	
	public String getEnrollM() {
		return enrollM;
	}





	public void setEnrollM(String enrollM) {
		this.enrollM = enrollM;
	}





	public int getGrCount() {
		return grCount;
	}





	public void setGrCount(int grCount) {
		this.grCount = grCount;
	}





	public int getTotalGroup() {
		return totalGroup;
	}





	public void setTotalGroup(int totalGroup) {
		this.totalGroup = totalGroup;
	}





	public int getTodayGroup() {
		return todayGroup;
	}





	public void setTodayGroup(int todayGroup) {
		this.todayGroup = todayGroup;
	}





	public String getGroupStateName() {
		return groupStateName;
	}





	public void setGroupStateName(String groupStateName) {
		this.groupStateName = groupStateName;
	}





	public String getGroupGradeName() {
		return groupGradeName;
	}





	public void setGroupGradeName(String groupGradeName) {
		this.groupGradeName = groupGradeName;
	}





	public GroupDetail() {

	}





	public int getgGradeCount() {
		return gGradeCount;
	}





	public void setgGradeCount(int gGradeCount) {
		this.gGradeCount = gGradeCount;
	}





	public String getBigInterest() {
		return bigInterest;
	}





	public void setBigInterest(String bigInterest) {
		this.bigInterest = bigInterest;
	}





	public int getGinterestCount() {
		return ginterestCount;
	}





	public void setGinterestCount(int ginterestCount) {
		this.ginterestCount = ginterestCount;
	}





	public GroupDetail(String groupNo, String groupName, String groupMsg, String groupPicture, String groupAddress,
			String groupGradeCode, String groupStateCode, int maxMember, Date enrollDate, String interestBigCode,
			 String allowSignup, int minAge, int maxAge, String groupGender,
			String openSetting) {
		super(groupNo, groupName, groupMsg, groupPicture, groupAddress, groupGradeCode, groupStateCode, maxMember, enrollDate,
				interestBigCode, allowSignup, minAge, maxAge, groupGender, openSetting);
		// TODO Auto-generated constructor stub
	}


	public GroupDetail(String groupNo, String groupName, String groupMsg, String groupPicture, String groupAddress,
			String groupGradeCode, String groupStateCode, int maxMember, Date enrollDate, String interestBigCode,
			String allowSignup, int minAge, int maxAge, String groupGender, String openSetting, int memNum,
			String masterEmail) {
		super(groupNo, groupName, groupMsg, groupPicture, groupAddress, groupGradeCode, groupStateCode, maxMember,
				enrollDate, interestBigCode, allowSignup, minAge, maxAge, groupGender, openSetting);
		this.memNum = memNum;
		this.masterEmail = masterEmail;
	}



	@Override
	public String toString() {
		return "GroupDetail [memNum=" + memNum + ", masterEmail=" + masterEmail + ", toString()=" + super.toString()
				+ "]";
	}


	public String getMasterEmail() {
		return masterEmail;
	}


	public void setMasterEmail(String masterEmail) {
		this.masterEmail = masterEmail;
	}



	public int getMemNum() {
		return memNum;
	}





	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}





	public int getCountWgroup() {
		return countWgroup;
	}





	public void setCountWgroup(int countWgroup) {
		this.countWgroup = countWgroup;
	}





	public String getEnrollD() {
		return enrollD;
	}





	public void setEnrollD(String enrollD) {
		this.enrollD = enrollD;
	}
	
	
	
}
