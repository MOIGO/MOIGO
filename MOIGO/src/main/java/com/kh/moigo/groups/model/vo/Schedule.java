package com.kh.moigo.groups.model.vo;

import java.sql.Date;

public class Schedule implements java.io.Serializable{

	private static final long serialVersionUID = 7329042052577028409L;
	
	private String scheduleNo;
	private String groupNo;
	private String scheduleName;
	private String scheduleContent;
	private String scheduleAddress;
	private String memberNo;
	private Date startTime;
	private Date endTime;
	private String colorLabel;
	public String getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(String scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public String getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}
	public String getScheduleName() {
		return scheduleName;
	}
	public void setScheduleName(String scheduleName) {
		this.scheduleName = scheduleName;
	}
	public String getScheduleContent() {
		return scheduleContent;
	}
	public void setScheduleContent(String scheduleContent) {
		this.scheduleContent = scheduleContent;
	}
	public String getScheduleAddress() {
		return scheduleAddress;
	}
	public void setScheduleAddress(String scheduleAddress) {
		this.scheduleAddress = scheduleAddress;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getColorLabel() {
		return colorLabel;
	}
	public void setColorLabel(String colorLabel) {
		this.colorLabel = colorLabel;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((colorLabel == null) ? 0 : colorLabel.hashCode());
		result = prime * result + ((endTime == null) ? 0 : endTime.hashCode());
		result = prime * result + ((groupNo == null) ? 0 : groupNo.hashCode());
		result = prime * result + ((memberNo == null) ? 0 : memberNo.hashCode());
		result = prime * result + ((scheduleAddress == null) ? 0 : scheduleAddress.hashCode());
		result = prime * result + ((scheduleContent == null) ? 0 : scheduleContent.hashCode());
		result = prime * result + ((scheduleName == null) ? 0 : scheduleName.hashCode());
		result = prime * result + ((scheduleNo == null) ? 0 : scheduleNo.hashCode());
		result = prime * result + ((startTime == null) ? 0 : startTime.hashCode());
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
		Schedule other = (Schedule) obj;
		if (colorLabel == null) {
			if (other.colorLabel != null)
				return false;
		} else if (!colorLabel.equals(other.colorLabel))
			return false;
		if (endTime == null) {
			if (other.endTime != null)
				return false;
		} else if (!endTime.equals(other.endTime))
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
		if (scheduleAddress == null) {
			if (other.scheduleAddress != null)
				return false;
		} else if (!scheduleAddress.equals(other.scheduleAddress))
			return false;
		if (scheduleContent == null) {
			if (other.scheduleContent != null)
				return false;
		} else if (!scheduleContent.equals(other.scheduleContent))
			return false;
		if (scheduleName == null) {
			if (other.scheduleName != null)
				return false;
		} else if (!scheduleName.equals(other.scheduleName))
			return false;
		if (scheduleNo == null) {
			if (other.scheduleNo != null)
				return false;
		} else if (!scheduleNo.equals(other.scheduleNo))
			return false;
		if (startTime == null) {
			if (other.startTime != null)
				return false;
		} else if (!startTime.equals(other.startTime))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Schedule [scheduleNo=" + scheduleNo + ", groupNo=" + groupNo + ", scheduleName=" + scheduleName
				+ ", scheduleContent=" + scheduleContent + ", scheduleAddress=" + scheduleAddress + ", memberNo="
				+ memberNo + ", startTime=" + startTime + ", endTime=" + endTime + ", colorLabel=" + colorLabel + "]";
	}
	public Schedule(String scheduleNo, String groupNo, String scheduleName, String scheduleContent,
			String scheduleAddress, String memberNo, Date startTime, Date endTime, String colorLabel) {
		super();
		this.scheduleNo = scheduleNo;
		this.groupNo = groupNo;
		this.scheduleName = scheduleName;
		this.scheduleContent = scheduleContent;
		this.scheduleAddress = scheduleAddress;
		this.memberNo = memberNo;
		this.startTime = startTime;
		this.endTime = endTime;
		this.colorLabel = colorLabel;
	}
	public Schedule() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
