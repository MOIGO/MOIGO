package com.kh.moigo.admin.model.vo;

public class MemPerGroup {
	private String groupNo;
	private String groupName;
	private String memberGradeName;
	
	public MemPerGroup() {

	}
	public MemPerGroup(String groupNo, String groupName, String memberGradeName) {
		this.groupNo = groupNo;
		this.groupName = groupName;
		this.memberGradeName = memberGradeName;
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
	public String getMemberGradeName() {
		return memberGradeName;
	}
	public void setMemberGradeName(String memberGradeName) {
		this.memberGradeName = memberGradeName;
	}
	@Override
	public String toString() {
		return "MemPerGroup [groupNo=" + groupNo + ", groupName=" + groupName + ", memberGradeName=" + memberGradeName
				+ "]";
	}

	
	
}
