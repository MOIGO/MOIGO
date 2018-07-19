<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login_modal_custom.css?ver=0">


</head>
<body> 

    <!-- 로그인 모달 -->
    <!-- Modal -->
    <div class="modal fade login_modal" id="Login_Modal" role="dialog"  >
        <div class="modal-dialog login_modal_dialog">
             <div id="login_check_msg" style="display: none;  height: 40px; line-height:40px; background-color: red ;text-align:center; color:white;"></div> 
            
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header login_modal_header">
                	<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    <h4 class="modal-title"></h4>
                </div>

                <div class="modal-body login_modal_body">
                    
                    <div class="btn_facebook">   <i class="fab fa-facebook-f" style="margin-right:20px;"></i>페이스북으로 시작하기</div>
                    <hr style="margin-top:8px; margin-bottom:15px;">

                    <form  id="loginForm">
	                    <input type="hidden" name="pathName" value="" id="pathName">
	                    
	                    <div class="form-group">
	                        <span class="letter_space_modal">아이디</span> 
	                        <input type="text" class="form-control login_form_control" name="memberEmail" id="loginId" placeholder="이메일을 입력해주세요"/>
	                    </div>
	                    <div  class="form-group" >
	                        <span class="letter_space_modal">비밀번호</span> 
	                        <input type="password" class="form-control login_form_control" name="memberPwd" id="loginPwd" placeholder="비밀번호를 입력해주세요" >
	                    </div>
	                    <div>
	                        <a href="" id="findPwd" class="link_forgotPwd"  data-toggle="modal" data-target="#findPwd_Modal" data-dismiss="modal">비밀번호를 잊으셨나요?</a>
	                    </div>
	                    <div>
	                        <button type="button" class="btn_login" id="btn_login" >로그인</button>
	                    </div>
                    </form>
                    <hr style="margin-top:15px; margin-bottom:10px;">
                    
                </div>
                <div class="modal-footer login_modal_footer">
                    <div style="width: 100%;">
                        <span style="color:#aaa; font-size:0.9em; float:left;"> 모이고 계정이 없으신가요? </span>
                        <button  class="btn_join btn " onclick="location.href='${pageContext.request.contextPath}/member/signUp.do'"> 이메일 회원가입</button>
                    </div>
                </div>
            </div>
        
        </div>
    </div>
    <!-- 로그인 모달 끝 -->


    <!-- 비밀번호 찾기 모달 -->
    <!-- Modal -->
    <div class="modal fade login_modal" id="findPwd_Modal" role="dialog" >
        <div class="modal-dialog login_modal_dialog">
        
          <!-- Modal content-->
            <div class="modal-content"> 
                <div class="modal-header login_modal_header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title1" style="text-align: center;"></h4>
                </div>
                
              	<div class="d-flex justify-content-center "> <img style="width:50%;height:10%;" src="${pageContext.request.contextPath}/resources/images/moigo.png"> </div>	
                <div class="modal-body login_modal_body">
                   
                  	<form  id="newPwdForm">              
	                	<div class="form-group">
	                        <span class="letter_space_modal">이메일</span> 
	                        <input type="text" class="form-control login_form_control" name="memberEmail"id="findEmail" placeholder="example@domain.com">
	                    </div>
	                    <div class="form-group">
	                        <span class="letter_space_modal">이름</span> 
	                        <input type="text" class="form-control login_form_control" name ="memberName" id="findName" placeholder="ex)홍길동">
	                    </div>
	                    <div>
	                        <ul style="padding-left:15px;">
	                            <li style="font-size:12px; letter-spacing: -1px;"> 가입 시 기재했던 이름,이메일 주소를 입력해주세요.</li>
	                            <li style="font-size:12px; letter-spacing: -1px;">해당 이메일 주소로 재설정된 비밀번호가 전송됩니다.</li>
	                        </ul>
	                    </div>
	                    <div>
	                        <button type="button" class="btn_login"  style="height:40px;" id="btnNewpwd">비밀번호 재설정</button>
	                    </div>
                    </form>
                </div>
                <div class="modal-footer login_modal_footer">
                </div>
            </div>
          
        </div>
    </div>
    <!-- 비밀번호 찾기 모달 끝 -->
  

    
    <script>
    	
    	$('#btn_login').on('click',function(){
			var loginId = $('#loginId').val();
			var loginPwd = $('#loginPwd').val();
		/* 	var link = document.location.pathname;
			console.log(link); */
			
			if(loginId=="" || loginPwd==""){
				$('#login_check_msg').css('display','block').html("아이디/비밀번호 입력해주세요.").fadeOut(2000);
			}else{
				$.ajax({
					url :"${pageContext.request.contextPath}/member/memberLogin.do",
					type:'post',
					data : {memberEmail : loginId , memberPwd:loginPwd},
					dataType : "json",
					success : function(data){
							/* alert(data.msg); */
							// -1: 회원x  0:성공  1:비번x
						if(data.result == -1){
							$('#login_check_msg').css('display','block').html(data.msg).fadeOut(2000);
							$('#loginId, #loginPwd').val('');
						}else if (data.result==0){
							location.href="${pageContext.request.contextPath}/";
						}else if (data.result==1){
							$('#login_check_msg').css('display','block').html(data.msg).fadeOut(2000);
							$('#loginPwd').val('');
						}
						
					}, error : function(error,msg){
						alert('실패');
					}
				});
			}
    	});
    	
    	$('#btnNewpwd').on('click',function(){
			var findEmail = $('#findEmail').val();
			var findName = $('#findName').val();

			if(findEmail=="" || findName==""){
				alert('이메일/이름 모두 입력해주세요');
			}else{
				$.ajax({
					url :"${pageContext.request.contextPath}/member/findPwdEmail.do",
					type:'post',
					data : {findEmail : findEmail ,findName:findName},
					dataType : "json",
					success : function(data){
						alert(data.msg);
						if(data.result==-1){
							$('#findEmail, #findName').val('');
						}else if(data.result==0){
							location.href="${pageContext.request.contextPath}/";
						}else if(data.result==1){
							$('#findEmail, #findName').val('');
						}
					}, error : function(error,msg){
						alert('실패');
					}
				});
			}
    	});
    </script>
</body>
</html>