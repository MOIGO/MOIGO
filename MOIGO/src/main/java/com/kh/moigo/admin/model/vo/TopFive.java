package com.kh.moigo.admin.model.vo;

public class TopFive {
	private int rNum;
	private String targetGroup;
	private String targetMember;
	private String memberName;
	private String groupName;
	private int aCount;
	
	
	
	
	
	
	public TopFive() {
		
	}
	
	
	
	public TopFive(int rNum, String targetGroup, String targetMember, String memberName, String groupName, int aCount) {
		this.rNum = rNum;
		this.targetGroup = targetGroup;
		this.targetMember = targetMember;
		this.memberName = memberName;
		this.groupName = groupName;
		this.aCount = aCount;
	}



	@Override
	public String toString() {
		return "TopFive [rNum=" + rNum + ", targetGroup=" + targetGroup + ", targetMember=" + targetMember
				+ ", memberName=" + memberName + ", groupName=" + groupName + ", aCount=" + aCount + "]";
	}



	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public String getTargetGroup() {
		return targetGroup;
	}
	public void setTargetGroup(String targetGroup) {
		this.targetGroup = targetGroup;
	}
	public String getTargetMember() {
		return targetMember;
	}
	public void setTargetMember(String targetMember) {
		this.targetMember = targetMember;
	}
	public int getaCount() {
		return aCount;
	}
	public void setaCount(int aCount) {
		this.aCount = aCount;
	}

	
	
}
