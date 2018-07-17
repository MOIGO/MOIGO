package com.kh.moigo.post.model.vo;

public class Files implements java.io.Serializable{

	private static final long serialVersionUID = -4050238556674456737L;
	
	private String fileNo;
	private String fileOriginName;
	private String fileNewName;
	private String filePath;
	private String groupNo;
	private String memberNo;
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
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((fileNewName == null) ? 0 : fileNewName.hashCode());
		result = prime * result + ((fileNo == null) ? 0 : fileNo.hashCode());
		result = prime * result + ((fileOriginName == null) ? 0 : fileOriginName.hashCode());
		result = prime * result + ((filePath == null) ? 0 : filePath.hashCode());
		result = prime * result + ((groupNo == null) ? 0 : groupNo.hashCode());
		result = prime * result + ((memberNo == null) ? 0 : memberNo.hashCode());
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
		if (memberNo == null) {
			if (other.memberNo != null)
				return false;
		} else if (!memberNo.equals(other.memberNo))
			return false;
		return true;
	}
	public Files(String fileNo, String fileOriginName, String fileNewName, String filePath, String groupNo,
			String memberNo) {
		super();
		this.fileNo = fileNo;
		this.fileOriginName = fileOriginName;
		this.fileNewName = fileNewName;
		this.filePath = filePath;
		this.groupNo = groupNo;
		this.memberNo = memberNo;
	}
	public Files() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Files [fileNo=" + fileNo + ", fileOriginName=" + fileOriginName + ", fileNewName=" + fileNewName
				+ ", filePath=" + filePath + ", groupNo=" + groupNo + ", memberNo=" + memberNo + "]";
	}
	
	
	
	
}
