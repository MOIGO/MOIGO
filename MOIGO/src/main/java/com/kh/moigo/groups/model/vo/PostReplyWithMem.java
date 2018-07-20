package com.kh.moigo.groups.model.vo;

import java.sql.Date;

public class PostReplyWithMem extends PostReply implements java.io.Serializable {


	private static final long serialVersionUID = -2920131548021173232L;
	
	public PostReplyWithMem() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PostReplyWithMem(String replyNo, String postNo, String memberNo, String content, Date submitDate) {
		super(replyNo, postNo, memberNo, content, submitDate);
		// TODO Auto-generated constructor stub
	}

	public PostReplyWithMem(String replyNo, String postNo, String memberNo, String content, Date submitDate,
			GroupMember groupMember) {
		super(replyNo, postNo, memberNo, content, submitDate);
		this.groupMember = groupMember;
	}

	private GroupMember groupMember;

	public GroupMember getGroupMember() {
		return groupMember;
	}

	public void setGroupMember(GroupMember groupMember) {
		this.groupMember = groupMember;
	}
	
	
	
}
