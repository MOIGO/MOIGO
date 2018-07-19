package com.kh.moigo.admin.model.vo;

public class GrpMember {
	private String memberNo;
	private String memberName;
	private String memberGradeName;
	private int postCount;
	private int replyCount;
	
	public GrpMember() {	
	}

	public GrpMember(String memberNo, String memberName, String memberGradeName, int postCount, int replyCount) {
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberGradeName = memberGradeName;
		this.postCount = postCount;
		this.replyCount = replyCount;
	}

	@Override
	public String toString() {
		return "GrpPerGroup [memberNo=" + memberNo + ", memberName=" + memberName + ", memberGradeName="
				+ memberGradeName + ", postCount=" + postCount + ", replyCount=" + replyCount + "]";
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberGradeName() {
		return memberGradeName;
	}
	public void setMemberGradeName(String memberGradeName) {
		this.memberGradeName = memberGradeName;
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

	
	
}
