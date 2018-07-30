package com.kh.moigo.admin.model.vo;

import java.sql.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.kh.moigo.member.model.vo.JsonDateSerializer;


public class Accuse implements java.io.Serializable {


private static final long serialVersionUID = 8565888549654582679L;

private int accuseNo;
private String targetMember;
private String targetGroup;
private String reporter;
private String content;
private Date accuseDate;








public Accuse(int accuseNo, String targetMember, String targetGroup, String reporter, String content, Date accuseDate) {
	super();
	this.accuseNo = accuseNo;
	this.targetMember = targetMember;
	this.targetGroup = targetGroup;
	this.reporter = reporter;
	this.content = content;
	this.accuseDate = accuseDate;
}



public Accuse() {
	
}



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



public String getContent() {
	return content;
}



public void setContent(String content) {
	this.content = content;
}


@JsonSerialize(using=JsonDateSerializer.class)
public Date getAccuseDate() {
	return accuseDate;
}



public void setAccuseDate(Date accuseDate) {
	this.accuseDate = accuseDate;
}



public static long getSerialversionuid() {
	return serialVersionUID;
}



@Override
public String toString() {
	return "Accuse [accuseNo=" + accuseNo + ", targetMember=" + targetMember + ", targetGroup=" + targetGroup
			+ ", reporter=" + reporter + ", content=" + content + ", accuseDate=" + accuseDate + "]";
}



	
}
