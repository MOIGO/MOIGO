package com.kh.moigo.groups.model.vo;
import java.sql.Date;
import java.util.ArrayList;

public class Post implements java.io.Serializable{

	private static final long serialVersionUID = 2808015714413799361L;
	
	private String postNo;
	private String groupNo;
	private String memberNo;
	private String isNotice;
	private String content;
	private String delflag;
	private Date submitDate;
	
	public Post(String postNo, String groupNo, String memberNo, String isNotice, String content, String delflag,
			Date submitDate) {
		super();
		this.postNo = postNo;
		this.groupNo = groupNo;
		this.memberNo = memberNo;
		this.isNotice = isNotice;
		this.content = content;
		this.delflag = delflag;
		this.submitDate = submitDate;
	}
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	public String getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getIsNotice() {
		return isNotice;
	}
	public void setIsNotice(String isNotice) {
		this.isNotice = isNotice;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
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
		result = prime * result + ((delflag == null) ? 0 : delflag.hashCode());
		result = prime * result + ((groupNo == null) ? 0 : groupNo.hashCode());
		result = prime * result + ((isNotice == null) ? 0 : isNotice.hashCode());
		result = prime * result + ((memberNo == null) ? 0 : memberNo.hashCode());
		result = prime * result + ((postNo == null) ? 0 : postNo.hashCode());
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
		Post other = (Post) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (delflag == null) {
			if (other.delflag != null)
				return false;
		} else if (!delflag.equals(other.delflag))
			return false;
		if (groupNo == null) {
			if (other.groupNo != null)
				return false;
		} else if (!groupNo.equals(other.groupNo))
			return false;
		if (isNotice == null) {
			if (other.isNotice != null)
				return false;
		} else if (!isNotice.equals(other.isNotice))
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
		if (submitDate == null) {
			if (other.submitDate != null)
				return false;
		} else if (!submitDate.equals(other.submitDate))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", groupNo=" + groupNo + ", memberNo=" + memberNo + ", isNotice=" + isNotice
				+ ", content=" + content + ", delflag=" + delflag + ", submitDate=" + submitDate + "]";
	}
	
	
	
}


