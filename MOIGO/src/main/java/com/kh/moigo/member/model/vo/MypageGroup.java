package com.kh.moigo.member.model.vo;

public class MypageGroup {

	private String groupNo;
	private String groupName;
	private String groupPicture;
	private String groupGrade;
	private int memberNum;
	private int postNum;

	
	public MypageGroup() {
		super();
	}


	public MypageGroup(String groupNo, String groupName, String groupPicture, String groupGrade, int memberNum,
			int postNum) {
		super();
		this.groupNo = groupNo;
		this.groupName = groupName;
		this.groupPicture = groupPicture;
		this.groupGrade = groupGrade;
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


	public String getGroupPicture() {
		return groupPicture;
	}


	public void setGroupPicture(String groupPicture) {
		this.groupPicture = groupPicture;
	}


	public String getGroupGrade() {
		return groupGrade;
	}


	public void setGroupGrade(String groupGrade) {
		this.groupGrade = groupGrade;
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
		return "MypageGroup [groupNo=" + groupNo + ", groupName=" + groupName + ", groupPicture=" + groupPicture
				+ ", groupGrade=" + groupGrade + ", memberNum=" + memberNum + ", postNum=" + postNum + "]";
	}
	
	
	
}
