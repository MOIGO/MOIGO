package com.kh.moigo.admin.model.vo;

public class TopFive {
	private int rNum;
	private String targetGroup;
	private String targetMember;
	
	private int aCount;
	
	
	
	public TopFive(int rNum, String targetGroup, String targetMember, int aCount) {
		this.rNum = rNum;
		this.targetGroup = targetGroup;
		this.targetMember = targetMember;
		this.aCount = aCount;
	}
	public TopFive() {
		
	}
	@Override
	public String toString() {
		return "Top5 [targetGroup=" + targetGroup + ", targetMember=" + targetMember + ", rowNum=" + rNum
				+ ", aCount=" + aCount + "]";
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public String getTargetGroup() {
		return targetGroup;
	}
	public void setTargetGroup(String targetGroup) {
		this.targetGroup = targetGroup;
	}
	public String getTargetMember() {
		return targetMember;
	}
	public void setTargetMember(String targetMember) {
		this.targetMember = targetMember;
	}
	public int getaCount() {
		return aCount;
	}
	public void setaCount(int aCount) {
		this.aCount = aCount;
	}

	
	
}
