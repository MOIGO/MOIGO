package com.kh.moigo.admin.model.vo;

import java.sql.Date;

public class Accuse implements java.io.Serializable{


private static final long serialVersionUID = 8565888549654582679L;

private int accuseNo;
private String targetMember;
private String targetGroup;
private String reporter;
private String targeType;
private String content;
private Date accuseDate;
public int getAccuseNo() {
	return accuseNo;
}
public void setAccuseNo(int accuseNo) {
	this.accuseNo = accuseNo;
}
public String getTargetMember() {
	return targetMember;
}
public void setTargetMember(String targetMember) {
	this.targetMember = targetMember;
}
public String getTargetGroup() {
	return targetGroup;
}
public void setTargetGroup(String targetGroup) {
	this.targetGroup = targetGroup;
}
public String getReporter() {
	return reporter;
}
public void setReporter(String reporter) {
	this.reporter = reporter;
}
public String getTargeType() {
	return targeType;
}
public void setTargeType(String targeType) {
	this.targeType = targeType;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Date getAccuseDate() {
	return accuseDate;
}
public void setAccuseDate(Date accuseDate) {
	this.accuseDate = accuseDate;
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((accuseDate == null) ? 0 : accuseDate.hashCode());
	result = prime * result + accuseNo;
	result = prime * result + ((content == null) ? 0 : content.hashCode());
	result = prime * result + ((reporter == null) ? 0 : reporter.hashCode());
	result = prime * result + ((targeType == null) ? 0 : targeType.hashCode());
	result = prime * result + ((targetGroup == null) ? 0 : targetGroup.hashCode());
	result = prime * result + ((targetMember == null) ? 0 : targetMember.hashCode());
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
	Accuse other = (Accuse) obj;
	if (accuseDate == null) {
		if (other.accuseDate != null)
			return false;
	} else if (!accuseDate.equals(other.accuseDate))
		return false;
	if (accuseNo != other.accuseNo)
		return false;
	if (content == null) {
		if (other.content != null)
			return false;
	} else if (!content.equals(other.content))
		return false;
	if (reporter == null) {
		if (other.reporter != null)
			return false;
	} else if (!reporter.equals(other.reporter))
		return false;
	if (targeType == null) {
		if (other.targeType != null)
			return false;
	} else if (!targeType.equals(other.targeType))
		return false;
	if (targetGroup == null) {
		if (other.targetGroup != null)
			return false;
	} else if (!targetGroup.equals(other.targetGroup))
		return false;
	if (targetMember == null) {
		if (other.targetMember != null)
			return false;
	} else if (!targetMember.equals(other.targetMember))
		return false;
	return true;
}
@Override
public String toString() {
	return "Accuse [accuseNo=" + accuseNo + ", targetMember=" + targetMember + ", targetGroup=" + targetGroup
			+ ", reporter=" + reporter + ", targeType=" + targeType + ", content=" + content + ", accuseDate="
			+ accuseDate + "]";
}
public Accuse(int accuseNo, String targetMember, String targetGroup, String reporter, String targeType, String content,
		Date accuseDate) {
	super();
	this.accuseNo = accuseNo;
	this.targetMember = targetMember;
	this.targetGroup = targetGroup;
	this.reporter = reporter;
	this.targeType = targeType;
	this.content = content;
	this.accuseDate = accuseDate;
}
public Accuse() {
	super();
	// TODO Auto-generated constructor stub
}


}
