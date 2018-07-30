<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
                     <div class="btn_facebook" onclick="fbLoginAction();" >   <i class="fab fa-facebook-f" style="margin-right:20px;" ></i>페이스북으로 시작하기</div>  
					 <!-- <div class="fb-login-button" data-width="338" data-max-rows="1" data-size="large" data-button-type="login_with" 
					data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false" ></div> --> 
   					<div id="result">
					</div>
					
					
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
     


<!-- 페이스북 로그인 스크립트  -->
<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8&appId=APPID";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	window.fbAsyncInit = function() {
		FB.init({
			appId : '527787834342986',
			cookie : true,
			xfbml : true,
			version : 'v3.0'
		});


		FB.getLoginStatus(function(response) {
			console.log('statusChangeCallback');
			console.log(response);
			/* statusChangeCallback(response); */
		}); 
		
		
	};

	
	
	

	function fbLoginAction() {

		FB.getLoginStatus(function(response) {
			console.log('statusChangeCallback');
			console.log(response);
			/* statusChangeCallback(response); */
			
			if (response.status === 'connected') {	
				FB.logout(function(response) { // 사용자 로그 아웃 이후 콜백처리 
					alert('다시 시도해주세요');
					/* location.href="${pageContext.request.contextPath}/"; */
				});	
			
			} else if (response.status === 'not_authorized') {
				fbLogin();
			} else {
				fbLogin(); 
			}
		});
		
		
		
	}

	
	function fbLogin(){
		FB.login(function(response) {
			var femail;
			var fname;
			var fbirthday;
			var fgender;
			
			/* var fbname; */
			/* var accessToken = response.authResponse.accessToken; */
			FB.api('/me?fields=id,name,age_range,birthday,gender,email',function(response) {
						var fb_data = jQuery.parseJSON(JSON.stringify(response));
						console.log(fb_data );
							femail=response.email;
							fname=response.name;
							fbirthday=response.birthday;
							fgender=response.gender;
							
							$.ajax({
								url:"${pageContext.request.contextPath}/member/fbLogin.do",
								data : {
									email : femail,
									name : fname,
									birthday : fbirthday,
									gender :fgender
								},
								type:"get",
								success : function(data){
									/* if(data.result == -1){
										alert('페이스북 회원 추가');
										location.href="${pageContext.request.contextPath}/";
									}else if (data.result==0){
										alert('페이스북 로그인');
										location.href="${pageContext.request.contextPath}/";
									}else if (data.result==1){
										
									} */
									alert(data.msg);
									location.href="${pageContext.request.contextPath}/";
								},
								error : function(data){
									console.log("실패");
								}
							});
			}); 
		}, {scope : 'public_profile, email, user_birthday,user_gender'});  
	}
	/* 
	function statusChangeCallback(response) {
		if (response.status === 'connected') {	
			console.log('연결 ㅎ'+this.femail+ this.fname+ this.fbirthday+ this.fgender);		
			//
		} else if (response.status === 'not_authorized') {
			console.log('페이스북에는 로그인 되어있으나, 앱에는 로그인 되어있지 않다.')	;				
		} else {
			console.log('페이스북에 로그인이 되어있지 않아서, 앱에 로그인 되어있는지 불명확하다.');
		}
	}
	 */

</script>











<!-- 일반로그인 스크립트  -->
    
    <script>
    
    $('#loginPwd').keypress(function(event){
        if ( event.which == 13 ) {
            $('#btn_login').click();
            return false;
        }
   });
    	
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