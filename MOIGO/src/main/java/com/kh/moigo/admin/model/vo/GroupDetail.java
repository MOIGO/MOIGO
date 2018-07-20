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


	public GroupDetail() {

	}






	public GroupDetail(String groupNo, String groupName, String groupMsg, String groupPicture, String groupAddress,
			String groupGradeCode, String groupStateCode, int maxMember, Date enrollDate, String interestBigCode,
			String interestSmallCode, String allowSignup, int minAge, int maxAge, String groupGender,
			String openSetting, int memNum, String masterEmail) {
		super(groupNo, groupName, groupMsg, groupPicture, groupAddress, groupGradeCode, groupStateCode, maxMember,
				enrollDate, interestBigCode, interestSmallCode, allowSignup, minAge, maxAge, groupGender, openSetting);
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
	
	
	
}
