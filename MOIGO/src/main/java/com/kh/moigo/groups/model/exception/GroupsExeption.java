package com.kh.moigo.groups.model.exception;

public class GroupsExeption extends RuntimeException{

	public GroupsExeption(){
		super();
	}
	
	public GroupsExeption(String msg){
		super("그룹 에러 에러 발생 : "+msg);
	}
	
}
