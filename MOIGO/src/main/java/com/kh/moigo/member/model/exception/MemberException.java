package com.kh.moigo.member.model.exception;

public class MemberException extends RuntimeException{
	public MemberException(){
		super();
	}
	
	public MemberException(String msg){
		super("멤버 에러 발생 : " + msg);
	}
	
}
