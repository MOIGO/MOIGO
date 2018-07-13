<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login_modal_custom.css?ver=0">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<title>Insert title here</title>
	<style>
		
	</style>
</head>
<body> 

    <!-- 로그인 모달 -->
    <!-- Modal -->
    <div class="modal fade login_modal" id="Login_Modal" role="dialog" style="display:none;">
        <div class="modal-dialog login_modal_dialog">
      
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header login_modal_header">
                    <h4 class="modal-title"></h4>
                </div>

                <div class="modal-body login_modal_body">
                    <!-- <div class="login_check_msg" style="display: none"></div> -->
                    <div class="btn_facebook">   <i class="fab fa-facebook-f" style="margin-right:20px;"></i>페이스북으로 시작하기</div>
                    <hr style="margin-top:8px; margin-bottom:15px;">
                    <div></div>	
                    <div class="form-group">
                        <span class="letter_space_modal">아이디</span> 
                        <input type="text" class="form-control login_form_control" name="memberEmail" id="loginId " placeholder="이메일을 입력해주세요">
                    </div>
                    <div  class="form-group" >
                        <span class="letter_space_modal">비밀번호</span> 
                        <input type="text" class="form-control login_form_control" name="memberPwd" id="loginPwd" placeholder="비밀번호를 입력해주세요" >
                    </div>
                    <div>
                        <a href="" id="findPwd" class="link_forgotPwd"  data-toggle="modal" data-target="#findPwd_Modal" data-dismiss="modal">비밀번호를 잊으셨나요?</a>
                    </div>
                    <div>
                        <button type="submit" class="btn_login">로그인</button>
                    </div>
                    <hr style="margin-top:15px; margin-bottom:10px;">
                </div>
                <div class="modal-footer login_modal_footer">
                    <div style="width: 100%;">
                        <span style="color:#aaa; font-size:0.9em; float:left;"> 모이고 계정이 없으신가요? </span>
                        <button  class="btn_join btn" onclick="location.href='${pageContext.request.contextPath}/member/signUp.do'"> 이메일 회원가입</button>
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
                    <!-- button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    <h4 class="modal-title1" style="text-align: center;"></h4>
                </div>
                
              	<div class="d-flex justify-content-center "> <img style="width:50%;height:10%;" src="${pageContext.request.contextPath}/resources/images/moigo.png"> </div>	
                <div class="modal-body login_modal_body">
                    <!-- <div style="font-size:18px;">비밀번호 재설정</div> -->
                        <!-- <hr style="margin-top:15px; margin-bottom:15px;"> -->
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
                        <button type="submit" class="btn_login" style="height:40px;">비밀번호 재설정</button>
                    </div>
                </div>
                <div class="modal-footer login_modal_footer">
                </div>
            </div>
          
        </div>
    </div>
    <!-- 비밀번호 찾기 모달 끝 -->
  


    
    <script>
    
    </script>
</body>
</html>