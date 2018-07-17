package com.kh.moigo.admin.model.vo;

import java.sql.Date;

import com.kh.moigo.groups.model.vo.Groups;

public class GroupDetail extends Groups implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5252765492046188622L;
		
	private int memNum;


	public GroupDetail() {
		super();
		// TODO Auto-generated constructor stub
	}





	public GroupDetail(String groupNo, String groupName, String groupMsg, String groupPicture, String groupGradeCode,
			String groupStateCode, int maxMember, Date enrollDate, String interestBigCode, String interestSmallCode,
			String allowSignup, int minAge, int maxAge, String groupGender, String openSetting, int memNum) {
		super(groupNo, groupName, groupMsg, groupPicture, groupGradeCode, groupStateCode, maxMember, enrollDate,
				interestBigCode, interestSmallCode, allowSignup, minAge, maxAge, groupGender, openSetting);
		this.memNum = memNum;
	}





	public int getMemNum() {
		return memNum;
	}





	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}
	
	
	
}
