<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/myPage_custom.css?ver=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>

<style>
input:DISABLED {
		background-color : #e9ecef;
	}
	.okChk {
	color: limegreen;
	font-size:0.8em;
}

.noChk {
	color: red;
	font-size:0.8em;
}
</style>
</head>
<body>
   <c:import url="/WEB-INF/views/common/header.jsp"></c:import>
        <br><br>



    <div class="container" >
          <div class="col-md-9" style="float:none; margin:0 auto;">
            <h2>마이페이지</h2>
            <ul class="nav nav-tabs nav-justified " >
                <li class="nav-item"><a  class="nav-link  letter_space " href="${pageContext.request.contextPath}/mypage/profile.do">회원정보</a></li>
                <li class="nav-item"><a  class="nav-link letter_space active" href="${pageContext.request.contextPath}/mypage/changePwd.do">비밀번호 변경</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/Group.do?gType=open">주최모임</a></li>
                <li class="nav-item"> <a class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/Group.do?gType=join">참여모임</a></li>
                <li  class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/Group.do?gType=wait">가입 대기 중</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/withdrawal.do">회원탈퇴</a></li>
            </ul>
        </div>
        <br>
            
        <!-- style="float:none; margin:0 auto;"  -->
        <div class="col-md-9 content_box_wrap " style="float:none; margin:0 auto;" >
            <h5><i class="fas fa-lock"></i> 비밀번호 변경</h5>
            <div class="content_box_area" >
              
             <form action="${pageContext.request.contextPath}/member/changePwd.do" method="post" id="changePwdForm">
                <div class="row profile_wrap">
                    <div class="profile_box col-md-12  row no_margin" >
                        <span class="guide_content"> 
                        - 개인정보보호를 위해 최소 3개월 이내에는 정기적으로 비밀번호를 변경해 주시는 게 좋습니다. <br>
                        - 비밀번호는 쉬운번호나 타 사이트와 같을 경우 도용되기 쉽습니다. <br>
                        - 주민번호,전화번호,생일 등 개인정보와 연관된 문자나 숫자는 보안상 위험이 높으므로 사용을 자제해 주세요. 
                        </span>
                    </div>
                </div>

                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-3 col-xs-12"> <span>기존 비밀번호</span></div>
                        <div class="content_profile col-md-9 col-xs-12 ">
                            <input type="password" class="col-xs-12 col-md-8 profile_form_control" id="memberPwd" name="memberPwd"  maxlength="16">
                            <span id="pwdChkMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="row profile_wrap">
                    <div class="profile_box col-md-12  row no_margin">
                        <div class="title_profile col-md-3 col-xs-12">새 비밀번호</div>
                        <div class="content_profile col-md-9 col-xs-12 ">
                            <input type="password" class="col-xs-12 col-md-8 profile_form_control " id="newPwd" maxlength="16"  disabled>
                        	     <span id="pwdChkMsg2"></span>
                        </div>
                    </div>
                </div>

                <div class="row profile_wrap">
                    <div class="profile_box col-md-12  row no_margin">
                        <div class="title_profile col-md-3 col-xs-12">비밀번호 확인</div>
                        <div class="content_profile col-md-9 col-xs-12">
                                <input type="password" class="col-xs-12 col-md-8 profile_form_control " id="newPwd2" maxlength="16" disabled> 
                      			<span id="pwdChkMsg3"></span>
                        </div>
                    </div>
                </div>
               

                <div class="row">
                    <div class="profile_box col-md-12 ">
                        <button class="btn_profileUpdate pull-right col-md-2 col-xs-12" type="button" id="btnChangePwd"> 변경하기</button>
                    </div>
                </div>
             </form>
                <br>
            </div>
        </div>
    </div>

   <br><br><br><br>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
    <script>
    
    
var chk1 =false;
var chk2 =false;
var chk3 =false;

    	$('#memberPwd').on('blur',function(){
    		var pwd = $('#memberPwd').val();
    		
    		$.ajax({
				url :"${pageContext.request.contextPath}/member/checkPwd.do",
				type:'post',
				data : {memberPwd : pwd },
				dataType : "json",
				success : function(data){
					if(data.result==true){
						chk1=true;
						$('#newPwd, #newPwd2').attr('disabled',false);
						$('#pwdChkMsg').html('OK!').addClass('okChk').removeClass('noChk');
					}else{
						chk1=false;
						$('#newPwd, #newPwd2').attr('disabled',true);
						$('#pwdChkMsg').html('비밀번호 확인').addClass('noChk').removeClass('okChk');
					}
				}, error : function(error,msg){
					
				}
			});
    	});
    	
    	
    	 $('#newPwd').on('keyup focus blur',function(){
         	var pwd=$('#newPwd').val();
         	var regexp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,16}$/;
         	
         	if(!regexp.test(pwd)){
				chk2=false;
         		$('#pwdChkMsg2').html('영문자/숫자 포함 8~16자').addClass('noChk').removeClass('okChk');
         	}else{
         		chk2=true;
         		$('#pwdChkMsg2').html('OK!').addClass('okChk').removeClass('noChk');
         	}
         });
    	
    	
    	 $('#newPwd2').on('blur keyup',function(){
         	var pwd=$('#newPwd').val();
         	var pwd2=$('#newPwd2').val();
         	
         	if(pwd==pwd2){
         		chk3=true;
         		$('#pwdChkMsg3').html('OK!').addClass('okChk').removeClass('noChk');
         	}else{
         		chk3=false;
         		$('#pwdChkMsg3').html('비밀번호 확인').addClass('noChk').removeClass('okChk');
         	}
         });
    	
    
    	$('#btnChangePwd').on('click',function(){
    		if(chk1==true && chk2==true && chk3==true){
    			var changepwd = $('#newPwd').val();
        		
        		$.ajax({
    				url :"${pageContext.request.contextPath}/member/changePwd.do",
    				type:'post',
    				data : {memberPwd : changepwd },
    				dataType : "json",
    				success : function(data){ 	
    					if(data.result==true){
    						alert('비밀번호 변경성공!! \n재접속하세요');
    						location.href="${pageContext.request.contextPath}/member/memberLogout.do";
    					}else{
    						alert('실패');
    					}
    				}, error : function(error,msg){
    					alert('실패');
    				}
    			});
    		
    		}else{
    			alert('모두 입력하세요');
	    		return false;
    		}
    		
    	});
    </script>
</body>
</html>