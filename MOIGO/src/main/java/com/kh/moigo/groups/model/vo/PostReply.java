package com.kh.moigo.groups.model.vo;

import java.sql.Date;


public class PostReply implements java.io.Serializable{
	
	
	private static final long serialVersionUID = 879424659910126755L;
	
	private String replyNo; 
	private String postNo; 
	private String memberNo;
	private String groupNo;
	private String content; 
	private Date submitDate;
	
	public PostReply(String replyNo, String postNo, String memberNo, String groupNo, String content, Date submitDate) {
		super();
		this.replyNo = replyNo;
		this.postNo = postNo;
		this.memberNo = memberNo;
		this.groupNo = groupNo;
		this.content = content;
		this.submitDate = submitDate;
	}
	public PostReply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSubmitDate() {
		return submitDate;
	}
	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((groupNo == null) ? 0 : groupNo.hashCode());
		result = prime * result + ((memberNo == null) ? 0 : memberNo.hashCode());
		result = prime * result + ((postNo == null) ? 0 : postNo.hashCode());
		result = prime * result + ((replyNo == null) ? 0 : replyNo.hashCode());
		result = prime * result + ((submitDate == null) ? 0 : submitDate.hashCode());
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
		PostReply other = (PostReply) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (groupNo == null) {
			if (other.groupNo != null)
				return false;
		} else if (!groupNo.equals(other.groupNo))
			return false;
		if (memberNo == null) {
			if (other.memberNo != null)
				return false;
		} else if (!memberNo.equals(other.memberNo))
			return false;
		if (postNo == null) {
			if (other.postNo != null)
				return false;
		} else if (!postNo.equals(other.postNo))
			return false;
		if (replyNo == null) {
			if (other.replyNo != null)
				return false;
		} else if (!replyNo.equals(other.replyNo))
			return false;
		if (submitDate == null) {
			if (other.submitDate != null)
				return false;
		} else if (!submitDate.equals(other.submitDate))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "PostReply [replyNo=" + replyNo + ", postNo=" + postNo + ", memberNo=" + memberNo + ", groupNo="
				+ groupNo + ", content=" + content + ", submitDate=" + submitDate + "]";
	}
	
	
}
