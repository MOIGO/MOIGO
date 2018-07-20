package com.kh.moigo.groups.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class PostWithMem extends Post implements java.io.Serializable {


	private static final long serialVersionUID = 5899267560888960431L;
	
	private ArrayList<PostReplyWithMem> postReplyWithMem;
	private GroupMember groupMember;
	private ArrayList<Files> files;
	public PostWithMem(String postNo, String groupNo, String memberNo, String isNotice, String content, String delflag,
			Date submitDate, ArrayList<PostReplyWithMem> postReplyWithMem, GroupMember groupMember,
			ArrayList<Files> files) {
		super(postNo, groupNo, memberNo, isNotice, content, delflag, submitDate);
		this.postReplyWithMem = postReplyWithMem;
		this.groupMember = groupMember;
		this.files = files;
	}
	public PostWithMem() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PostWithMem(String postNo, String groupNo, String memberNo, String isNotice, String content, String delflag,
			Date submitDate) {
		super(postNo, groupNo, memberNo, isNotice, content, delflag, submitDate);
		// TODO Auto-generated constructor stub
	}
	public ArrayList<PostReplyWithMem> getPostReplyWithMem() {
		return postReplyWithMem;
	}
	public void setPostReplyWithMem(ArrayList<PostReplyWithMem> postReplyWithMem) {
		this.postReplyWithMem = postReplyWithMem;
	}
	public GroupMember getGroupMember() {
		return groupMember;
	}
	public void setGroupMember(GroupMember groupMember) {
		this.groupMember = groupMember;
	}
	public ArrayList<Files> getFiles() {
		return files;
	}
	public void setFiles(ArrayList<Files> files) {
		this.files = files;
	}
	
	
	
}
