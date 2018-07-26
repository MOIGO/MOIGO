package com.kh.moigo.groups.model.vo;

import java.io.Serializable;

public class GroupMember implements Serializable{
	
	private static final long serialVersionUID = 7389782174016066185L;
	
	private String memberNo;
	private String groupNo;
	private String profileImg;
	private String profileThumb;
	private String profileMsg;
	private int memberGradeCode;
	private String memberName;
	
	public GroupMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GroupMember(String memberNo, String groupNo, String profileImg, String profileThumb, String profileMsg,
			int memberGradeCode) {
		super();
		this.memberNo = memberNo;
		this.groupNo = groupNo;
		this.profileImg = profileImg;
		this.profileThumb = profileThumb;
		this.profileMsg = profileMsg;
		this.memberGradeCode = memberGradeCode;
	}
	
	public GroupMember(String memberNo, String groupNo, String profileImg, String profileThumb, String profileMsg,
			int memberGradeCode, String memberName) {
		super();
		this.memberNo = memberNo;
		this.groupNo = groupNo;
		this.profileImg = profileImg;
		this.profileThumb = profileThumb;
		this.profileMsg = profileMsg;
		this.memberGradeCode = memberGradeCode;
		this.memberName = memberName;
	}
	
	public GroupMember(String memberNo,String groupNo){
		this.memberNo = memberNo;
		this.groupNo = groupNo;
	}
	
	public GroupMember(String memberNo, String groupNo, int memberGradeCode) {
			this.memberNo=memberNo;
			this.groupNo=groupNo;
			this.memberGradeCode=memberGradeCode;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getProfileThumb() {
		return profileThumb;
	}
	public void setProfileThumb(String profileThumb) {
		this.profileThumb = profileThumb;
	}
	public String getProfileMsg() {
		return profileMsg;
	}
	public void setProfileMsg(String profileMsg) {
		this.profileMsg = profileMsg;
	}
	public int getMemberGradeCode() {
		return memberGradeCode;
	}
	public void setMemberGradeCode(int memberGradeCode) {
		this.memberGradeCode = memberGradeCode;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	@Override
	public String toString() {
		return "GroupMember [memberNo=" + memberNo + ", groupNo=" + groupNo + ", profileImg=" + profileImg
				+ ", profileThumb=" + profileThumb + ", profileMsg=" + profileMsg + ", memberGradeCode="
				+ memberGradeCode + ", memberName=" + memberName + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((groupNo == null) ? 0 : groupNo.hashCode());
		result = prime * result + memberGradeCode;
		result = prime * result + ((memberName == null) ? 0 : memberName.hashCode());
		result = prime * result + ((memberNo == null) ? 0 : memberNo.hashCode());
		result = prime * result + ((profileImg == null) ? 0 : profileImg.hashCode());
		result = prime * result + ((profileMsg == null) ? 0 : profileMsg.hashCode());
		result = prime * result + ((profileThumb == null) ? 0 : profileThumb.hashCode());
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
		GroupMember other = (GroupMember) obj;
		if (groupNo == null) {
			if (other.groupNo != null)
				return false;
		} else if (!groupNo.equals(other.groupNo))
			return false;
		if (memberGradeCode != other.memberGradeCode)
			return false;
		if (memberName == null) {
			if (other.memberName != null)
				return false;
		} else if (!memberName.equals(other.memberName))
			return false;
		if (memberNo == null) {
			if (other.memberNo != null)
				return false;
		} else if (!memberNo.equals(other.memberNo))
			return false;
		if (profileImg == null) {
			if (other.profileImg != null)
				return false;
		} else if (!profileImg.equals(other.profileImg))
			return false;
		if (profileMsg == null) {
			if (other.profileMsg != null)
				return false;
		} else if (!profileMsg.equals(other.profileMsg))
			return false;
		if (profileThumb == null) {
			if (other.profileThumb != null)
				return false;
		} else if (!profileThumb.equals(other.profileThumb))
			return false;
		return true;
	}
	
	
	
}