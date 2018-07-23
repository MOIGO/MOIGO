package com.kh.moigo.member.model.vo;

public class MypageGroup {

	private String groupNo;
	private String groupName;
	private String groupPicture;
	private int gropuNum;
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
	public String getGroupPicture() {
		return groupPicture;
	}
	public void setGroupPicture(String groupPicture) {
		this.groupPicture = groupPicture;
	}
	public int getGropuNum() {
		return gropuNum;
	}
	public void setGropuNum(int gropuNum) {
		this.gropuNum = gropuNum;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + gropuNum;
		result = prime * result + ((groupName == null) ? 0 : groupName.hashCode());
		result = prime * result + ((groupNo == null) ? 0 : groupNo.hashCode());
		result = prime * result + ((groupPicture == null) ? 0 : groupPicture.hashCode());
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
		MypageGroup other = (MypageGroup) obj;
		if (gropuNum != other.gropuNum)
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
		return true;
	}
	@Override
	public String toString() {
		return "MypageGroup [groupNo=" + groupNo + ", groupName=" + groupName + ", groupPicture=" + groupPicture
				+ ", gropuNum=" + gropuNum + "]";
	}
	

	

	
	
}
