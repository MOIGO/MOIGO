package com.kh.moigo.groups.model.vo;

import java.sql.Date;

public class Groups implements java.io.Serializable{
	
	private static final long serialVersionUID = 2632711817694753551L;
	
	private String groupNo;
	private String groupName;
	private String groupMsg;
	private String groupPicture;
	private String groupGradeCode;
	private String groupStateCode;
	private int maxMember;
	private Date enrollDate;
	private String interestBigCode;
	private String interestSmallCode;
	private String allowSignup;
	private int minAge;
	private int maxAge;
	private String groupGender;
	private String openSetting;
	
	public Groups(String groupNo, String groupName, String groupMsg, String groupPicture, String groupGradeCode,
			String groupStateCode, int maxMember, Date enrollDate, String interestBigCode, String interestSmallCode,
			String allowSignup, int minAge, int maxAge, String groupGender, String openSetting) {
		super();
		this.groupNo = groupNo;
		this.groupName = groupName;
		this.groupMsg = groupMsg;
		this.groupPicture = groupPicture;
		this.groupGradeCode = groupGradeCode;
		this.groupStateCode = groupStateCode;
		this.maxMember = maxMember;
		this.enrollDate = enrollDate;
		this.interestBigCode = interestBigCode;
		this.interestSmallCode = interestSmallCode;
		this.allowSignup = allowSignup;
		this.minAge = minAge;
		this.maxAge = maxAge;
		this.groupGender = groupGender;
		this.openSetting = openSetting;
	}
	
	public Groups() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupMsg() {
		return groupMsg;
	}
	public void setGroupMsg(String groupMsg) {
		this.groupMsg = groupMsg;
	}
	public String getGroupPicture() {
		return groupPicture;
	}
	public void setGroupPicture(String groupPicture) {
		this.groupPicture = groupPicture;
	}
	public String getGroupGradeCode() {
		return groupGradeCode;
	}
	public void setGroupGradeCode(String groupGradeCode) {
		this.groupGradeCode = groupGradeCode;
	}
	public String getGroupStateCode() {
		return groupStateCode;
	}
	public void setGroupStateCode(String groupStateCode) {
		this.groupStateCode = groupStateCode;
	}
	public int getMaxMember() {
		return maxMember;
	}
	public void setMaxMember(int maxMember) {
		this.maxMember = maxMember;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getInterestBigCode() {
		return interestBigCode;
	}
	public void setInterestBigCode(String interestBigCode) {
		this.interestBigCode = interestBigCode;
	}
	public String getInterestSmallCode() {
		return interestSmallCode;
	}
	public void setInterestSmallCode(String interestSmallCode) {
		this.interestSmallCode = interestSmallCode;
	}
	public String getAllowSignup() {
		return allowSignup;
	}
	public void setAllowSignup(String allowSignup) {
		this.allowSignup = allowSignup;
	}
	public int getMinAge() {
		return minAge;
	}
	public void setMinAge(int minAge) {
		this.minAge = minAge;
	}
	public int getMaxAge() {
		return maxAge;
	}
	public void setMaxAge(int maxAge) {
		this.maxAge = maxAge;
	}
	public String getGroupGender() {
		return groupGender;
	}
	public void setGroupGender(String groupGender) {
		this.groupGender = groupGender;
	}
	public String getOpenSetting() {
		return openSetting;
	}
	public void setOpenSetting(String openSetting) {
		this.openSetting = openSetting;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((allowSignup == null) ? 0 : allowSignup.hashCode());
		result = prime * result + ((enrollDate == null) ? 0 : enrollDate.hashCode());
		result = prime * result + ((groupGender == null) ? 0 : groupGender.hashCode());
		result = prime * result + ((groupGradeCode == null) ? 0 : groupGradeCode.hashCode());
		result = prime * result + ((groupMsg == null) ? 0 : groupMsg.hashCode());
		result = prime * result + ((groupName == null) ? 0 : groupName.hashCode());
		result = prime * result + ((groupNo == null) ? 0 : groupNo.hashCode());
		result = prime * result + ((groupPicture == null) ? 0 : groupPicture.hashCode());
		result = prime * result + ((groupStateCode == null) ? 0 : groupStateCode.hashCode());
		result = prime * result + ((interestBigCode == null) ? 0 : interestBigCode.hashCode());
		result = prime * result + ((interestSmallCode == null) ? 0 : interestSmallCode.hashCode());
		result = prime * result + maxAge;
		result = prime * result + maxMember;
		result = prime * result + minAge;
		result = prime * result + ((openSetting == null) ? 0 : openSetting.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Groups other = (Groups) obj;
		if (allowSignup == null) {
			if (other.allowSignup != null)
				return false;
		} else if (!allowSignup.equals(other.allowSignup))
			return false;
		if (enrollDate == null) {
			if (other.enrollDate != null)
				return false;
		} else if (!enrollDate.equals(other.enrollDate))
			return false;
		if (groupGender == null) {
			if (other.groupGender != null)
				return false;
		} else if (!groupGender.equals(other.groupGender))
			return false;
		if (groupGradeCode == null) {
			if (other.groupGradeCode != null)
				return false;
		} else if (!groupGradeCode.equals(other.groupGradeCode))
			return false;
		if (groupMsg == null) {
			if (other.groupMsg != null)
				return false;
		} else if (!groupMsg.equals(other.groupMsg))
			return false;
		if (groupName == null) {
			if (other.groupName != null)
				return false;
		} else if (!groupName.equals(other.groupName))
			return false;
		if (groupNo == null) {
			if (other.groupNo != null)
				return false;
		} else if (!groupNo.equals(other.groupNo))
			return false;
		if (groupPicture == null) {
			if (other.groupPicture != null)
				return false;
		} else if (!groupPicture.equals(other.groupPicture))
			return false;
		if (groupStateCode == null) {
			if (other.groupStateCode != null)
				return false;
		} else if (!groupStateCode.equals(other.groupStateCode))
			return false;
		if (interestBigCode == null) {
			if (other.interestBigCode != null)
				return false;
		} else if (!interestBigCode.equals(other.interestBigCode))
			return false;
		if (interestSmallCode == null) {
			if (other.interestSmallCode != null)
				return false;
		} else if (!interestSmallCode.equals(other.interestSmallCode))
			return false;
		if (maxAge != other.maxAge)
			return false;
		if (maxMember != other.maxMember)
			return false;
		if (minAge != other.minAge)
			return false;
		if (openSetting == null) {
			if (other.openSetting != null)
				return false;
		} else if (!openSetting.equals(other.openSetting))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "Groups [groupNo=" + groupNo + ", groupName=" + groupName + ", groupMsg=" + groupMsg + ", groupPicture="
				+ groupPicture + ", groupGradeCode=" + groupGradeCode + ", groupStateCode=" + groupStateCode
				+ ", maxMember=" + maxMember + ", enrollDate=" + enrollDate + ", interestBigCode=" + interestBigCode
				+ ", interestSmallCode=" + interestSmallCode + ", allowSignup=" + allowSignup + ", minAge=" + minAge
				+ ", maxAge=" + maxAge + ", groupGender=" + groupGender + ", openSetting=" + openSetting + "]";
	}	
	
}
