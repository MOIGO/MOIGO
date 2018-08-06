package com.kh.moigo.groups.model.vo;

import java.sql.Date;

public class Files implements java.io.Serializable{

	private static final long serialVersionUID = -4050238556674456737L;
	
	private String fileNo;
	private String fileOriginName;
	private String fileNewName;
	private String filePath;
	private String groupNo;
	private String memberNo;
	private Date fileDate;
	private String isImage;
	private String postNo;
	public Files(String fileNo, String fileOriginName, String fileNewName, String filePath, String groupNo,
			String memberNo, Date fileDate, String isImage, String postNo) {
		super();
		this.fileNo = fileNo;
		this.fileOriginName = fileOriginName;
		this.fileNewName = fileNewName;
		this.filePath = filePath;
		this.groupNo = groupNo;
		this.memberNo = memberNo;
		this.fileDate = fileDate;
		this.isImage = isImage;
		this.postNo = postNo;
	}
	
	public Files(String fileOriginName, String fileNewName, String filePath, String groupNo,
			String memberNo, String isImage) {
		super();
		
		this.fileOriginName = fileOriginName;
		this.fileNewName = fileNewName;
		this.filePath = filePath;
		this.groupNo = groupNo;
		this.memberNo = memberNo;
		this.isImage = isImage;
		
	}
	
	
	public Files() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getFileNo() {
		return fileNo;
	}
	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}
	public String getFileOriginName() {
		return fileOriginName;
	}
	public void setFileOriginName(String fileOriginName) {
		this.fileOriginName = fileOriginName;
	}
	public String getFileNewName() {
		return fileNewName;
	}
	public void setFileNewName(String fileNewName) {
		this.fileNewName = fileNewName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
	public Date getFileDate() {
		return fileDate;
	}
	public void setFileDate(Date fileDate) {
		this.fileDate = fileDate;
	}
	public String getIsImage() {
		return isImage;
	}
	public void setIsImage(String isImage) {
		this.isImage = isImage;
	}
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((fileDate == null) ? 0 : fileDate.hashCode());
		result = prime * result + ((fileNewName == null) ? 0 : fileNewName.hashCode());
		result = prime * result + ((fileNo == null) ? 0 : fileNo.hashCode());
		result = prime * result + ((fileOriginName == null) ? 0 : fileOriginName.hashCode());
		result = prime * result + ((filePath == null) ? 0 : filePath.hashCode());
		result = prime * result + ((groupNo == null) ? 0 : groupNo.hashCode());
		result = prime * result + ((isImage == null) ? 0 : isImage.hashCode());
		result = prime * result + ((memberNo == null) ? 0 : memberNo.hashCode());
		result = prime * result + ((postNo == null) ? 0 : postNo.hashCode());
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
		Files other = (Files) obj;
		if (fileDate == null) {
			if (other.fileDate != null)
				return false;
		} else if (!fileDate.equals(other.fileDate))
			return false;
		if (fileNewName == null) {
			if (other.fileNewName != null)
				return false;
		} else if (!fileNewName.equals(other.fileNewName))
			return false;
		if (fileNo == null) {
			if (other.fileNo != null)
				return false;
		} else if (!fileNo.equals(other.fileNo))
			return false;
		if (fileOriginName == null) {
			if (other.fileOriginName != null)
				return false;
		} else if (!fileOriginName.equals(other.fileOriginName))
			return false;
		if (filePath == null) {
			if (other.filePath != null)
				return false;
		} else if (!filePath.equals(other.filePath))
			return false;
		if (groupNo == null) {
			if (other.groupNo != null)
				return false;
		} else if (!groupNo.equals(other.groupNo))
			return false;
		if (isImage == null) {
			if (other.isImage != null)
				return false;
		} else if (!isImage.equals(other.isImage))
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
		return true;
	}
	@Override
	public String toString() {
		return "Files [fileNo=" + fileNo + ", fileOriginName=" + fileOriginName + ", fileNewName=" + fileNewName
				+ ", filePath=" + filePath + ", groupNo=" + groupNo + ", memberNo=" + memberNo + ", fileDate="
				+ fileDate + ", isImage=" + isImage + ", postNo=" + postNo + "]";
	}

	
}
