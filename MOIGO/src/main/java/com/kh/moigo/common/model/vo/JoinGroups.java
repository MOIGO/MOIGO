package com.kh.moigo.common.model.vo;

public class JoinGroups {
	
	private String groupNo;
	private String groupName;
	private String groupAddress;
	private String groupImage;
	private int memberNum;
	private int postNum;
	
	public JoinGroups() {
	}

	public JoinGroups(String groupNo, String groupName, String groupAddress, String groupImage, int memberNum,
			int postNum) {
		this.groupNo = groupNo;
		this.groupName = groupName;
		this.groupAddress = groupAddress;
		this.groupImage = groupImage;
		this.memberNum = memberNum;
		this.postNum = postNum;
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

	public String getGroupAddress() {
		return groupAddress;
	}

	public void setGroupAddress(String groupAddress) {
		this.groupAddress = groupAddress;
	}

	public String getGroupImage() {
		return groupImage;
	}

	public void setGroupImage(String groupImage) {
		this.groupImage = groupImage;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	@Override
	public String toString() {
		return "JoinGroups [groupNo=" + groupNo + ", groupName=" + groupName + ", groupAddress=" + groupAddress
				+ ", groupImage=" + groupImage + ", memberNum=" + memberNum + ", postNum=" + postNum + "]";
	}
	
	
	
	
	
}
