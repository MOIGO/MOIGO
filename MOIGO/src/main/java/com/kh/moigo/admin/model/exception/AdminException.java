package com.kh.moigo.admin.model.exception;

public class AdminException extends RuntimeException{

	public AdminException(){
		super();
	}
	
	public AdminException(String msg){
		super("관리자 에러 발생 : "+msg);
	}
	
}
