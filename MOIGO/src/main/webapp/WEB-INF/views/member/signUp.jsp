<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/signUp_custom.css?ver=0">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
	input:DISABLED {
		background-color : #e9ecef;
	}
    </style>

</head>
<body style="background-color:#eef0f3;">
 <%-- <c:import url="header.jsp"/>  --%>
    <br><br>
    <div class="container " >
        <div class="content_area col-md-5 col-12 " style=" margin:0 auto; float:none"  >
        	<div class="d-flex justify-content-center "> <img style="width:50%;height:100%;" src="${pageContext.request.contextPath}/resources/images/moigo.png"> </div>
				<br>
                <form action="${pageContext.request.contextPath}/member/signUpEnd.do" id="signUpForm" method="post">
                <!-- <h5>필수정보</h5> -->
                    <div class="form-group col-md-12 col-12 row no_margin " >
                        <div class="row col-12 no_margin letter_space_join no_padding" >아이디(이메일)</div>
                        <input type="text" class="col-md-9 col-8 join_form_control"  name="memberEmail" id="userId" placeholder="이메일 주소"  >
                        <button class="col-md-3 col-4 join_form_control btn_sign"  type="button" disabled  id="btnEmail"> 인증</button>
                        <span id="idChkMsg"></span>
                        
                    </div>
                    <div class="form-group col-md-12 col-sm-12 row no_margin">
                        <div class="row  col-12 no_margin letter_space_join no_padding" >이메일인증</div>
                        <input type="text" class="col-md-9 col-8  join_form_control " id="joinCode" placeholder="인증번호" disabled>
                        <button class="col-md-3  col-4  join_form_control btn_sign"  type="button" id="btn_joinCode" disabled>확인</button>
                        <span id="codeChkMsg"></span>
                        <span id="timer"></span>
                    </div>
                    <div class="form-group col-md-12 col-12 row no_margin" >
                        <div class="row no_margin letter_space_join " >비밀번호</div>
                        <input type="password" class="col-md-12  col-12 join_form_control "  name="memberPwd" id="userPwd" placeholder="영문자/숫자 포함 8~16자"  maxlength="16">
                    	<span id="pwdChkMsg"></span>
                    </div>
                    <div class="form-group col-md-12 col-12 row no_margin">
                        <div class="row no_margin letter_space_join" >비밀번호 확인</div>
                        <input type="password" class="col-md-12 col-12 join_form_control " id="userPwd2" placeholder=""  maxlength="16">
                    	<span id="pwdChkMsg2"></span>
                    </div>
                    <div class="form-group col-md-12 col-12 row no_margin">
                        <div class="row no_margin letter_space_join" >이름</div>
                        <input type="text" class="col-md-12 col-12 join_form_control " name="memberName" id="userName" placeholder="" >
                    	<span id="nameChkMsg"></span>
                    </div>
                  
                    
                    <div class="form-group col-md-12 col-12 ">
                            <div class="row no_margin letter_space_join" >생년월일</div>
                            <div class="row no_margin">
                                <select id="userYear" name="userYear" class="col-md-4 col-12 join_form_control " >
                                   <c:forEach var="i" begin="0" end="${2019-1938}">
								       		<c:if test="${i==0}">
								       			 <option  value="" selected>년</option>
								       		</c:if>
								       		<c:if test="${i!=0}">
								       			<option value="${2019-i}">${2019-i}</option>
								       		</c:if>
							       </c:forEach>
                                </select>

                                <select name="userMonth" id="userMonth" class="col-md-4 col-12 join_form_control">
								       <c:forEach var="i" begin='0' end='12'>
								       		<c:if test="${i==0}">
								       			 <option  value="" selected>월</option>
								       		</c:if>
								       		<c:if test="${i!=0}">
								       			<c:if test="${i<10}">
								       				<option value="0${i}">${i}월</option>
								       			</c:if>
								       			<c:if test="${i>=10}">
								       				<option value="${i}">${i}월</option>
								       			</c:if>
								       		</c:if>
								       </c:forEach>
                                </select>   

                                <select name="userDay" id="userDay" class="col-md-4 col-12 join_form_control">
                                       <c:forEach var="i" begin='0' end='31'>
								       		<c:if test="${i==0}">
								       			 <option  value="" selected>일</option>
								       		</c:if>
								       		<c:if test="${i!=0}">
								       			<c:if test="${i<10}">
								       				<option value="0${i}">${i}일</option>
								       			</c:if>
								       			<c:if test="${i>=10}">
								       				<option value="${i}">${i}일</option>
								       			</c:if>
								       		</c:if>
								       </c:forEach>
                                </select>
                            </div>
                            <input type="hidden" name="memberBirth" id="memberBirth" value="">
                           	<span id="birthChkMsg"></span>
                    </div>

                    <div class="form-group col-md-12 col-12 row no_margin">
                            <div class="row  col-12 no_margin letter_space_join no_padding" >성별</div>
	                       <input type="radio" name="memberGender" id="male" class="inp_gender" value="M"><label for="male" id="label_m" class="col-md-6 col-6"> 남자</label>
	                        <input type="radio"name="memberGender" id="femail" class="inp_gender"  value="F"><label for="femail" id="label_w" class="col-md-6 col-6">여자</label>
                    		<span id="genderChkMsg"></span>
                    </div>
    
                        <hr style=" background: #dddfe4;">
                        

                <h6 >추가정보<span style=" font-size:0.8em;"> (개인별 맞춤 정보 제공)</span></h6> 
                    
                
                    <div class="form-group col-md-12 col-12 row no_margin">
                        <button class="collapsed col-md-12 col-12 join_form_control btn_addInfo row no_margin"  data-toggle="collapse" data-target="#interestCategory"  type="button" >관심분야 </button>
                        <div id="interestCategory"  class="row col-md-12 col-12 collapse  no_margin" style="border: 0.5px solid #ccc; padding:10px; font-size:14px;">
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f1" name="interest" value="B001" > <label for="f1">라이프스타일</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f2" name="interest" value="B002"> <label for="f2">영어/외국어</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f3" name="interest" value="B003"> <label for="f3">컴퓨터</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f4" name="interest" value="B004"> <label for="f4">디자인/미술</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f5" name="interest" value="B005"> <label for="f5">취업</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f6" name="interest" value="B006"> <label for="f6">음악/공연</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f7" name="interest" value="B007"> <label for="f7">스포츠</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f8" name="interest" value="B008"> <label for="f8">뷰티/미용</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f9" name="interest" value="B009"> <label for="f9">게임</label></span>
                        </div>
                    </div>
                    
                    <div class="form-group col-md-12 col-12 row no_margin">
                        <button class="  collapsed col-md-12 col-12 join_form_control btn_addInfo row no_margin" data-toggle="collapse" data-target="#activity_area" type="button">활동지역 </button>
                        <div id="activity_area"  class="col-md-12 col-12 collapse row no_margin" style="border: 0.5px solid #ccc; padding:10px;">
                            <select name="cityName" id="cityName" class="col-md-6 col-12 join_form_controla">
                                <option disabled  selected>시, 도 선택</option>
                                <option value="11" class="foreach">서울특별시</option>
                                <option value="26" class="foreach">부산광역시</option>
                                <option value="27" class="foreach">대구광역시</option>
                                <option value="28" class="foreach">인천광역시</option>
                                <option value="29" class="foreach">광주광역시</option>
                                <option value="30" class="foreach">대전광역시</option>
                                <option value="31" class="foreach">울산광역시</option>
                                <option value="36" class="foreach">세종특별자치시</option>
                                <option value="41" class="foreach">경기도</option>
                                <option value="42" class="foreach">강원도</option>
                                <option value="43" class="foreach">충청북도</option>
                                <option value="44" class="foreach">충청남도</option>
                                <option value="45" class="foreach">전라북도</option>
                                <option value="46" class="foreach">전라남도</option>
                                <option value="47" class="foreach">경상북도</option>
                                <option value="48" class="foreach">경상남도</option>
                                <option value="50" class="foreach">제주특별자치도</option>
                                <option value="61">지역무관</option>
                            </select>

                        
                            <select name="districtName" id="districtName" class="col-md-6 col-12 join_form_controla">
                                    <option disabled value="" selected>구, 군 선택</option>
                                    <option value="a" class="foreach">a</option>
                                  	<option value="b" class="foreach">b</option>
                            </select>

							<input type="hidden" id="memberAddress" name="memberAddress" val="">                            
                        </div>
                    </div>


                    
                   <div class="form-group col-md-12 col-12 row no_margin">
                        <button class="col-md-12 col-12 join_form_control btn_sign" type="submit" disabled id="btn_signUp">가입완료 </button>
                    </div>
                   </form>
                    <span style=" font-size:0.9em;">  ※ 추가정보는 입력하지 않아도 회원가입이 가능합니다.</span>

        </div>
    </div>
    <br><br>

    <script>
    
    var chkId= false;
    var chkNum = true;  //false 로 변경 할것 ㅎ 인증 받으려면
    var chkPwd = false;
    var chkPwd2 = false;
    var chkName = false;
    var chkBirth = false;
    var chkGender = false;
    
        // 성별 체크
        $('input[type="radio"][name="memberGender"]').click(function(){
        	
        	 $('#genderChkMsg').html('OK!').addClass('okChk').removeClass('noChk');
        	chkGender=true;
            if($(this).val()=='M'){
                $('#label_m').addClass('label_border');
                $('#label_w').removeClass('label_border');
            }
            else  if($(this).val()=='F'){
                $('#label_w').addClass('label_border');
                $('#label_m').removeClass('label_border');
             }
            

        });

        // 관심분야 개수 확인
        $('input[name="interest"]').click(function(){
            var sum =0;

            $('input[name="interest"]').each(function(i){
                if($('input[name="interest"]').eq(i).prop("checked")){
                    sum++;
                }
            });

            if(sum>3){
                alert('3개까지 선택 가능합니다');
                $(this).prop("checked",false);

            }
        });
        
        
        /* 이메일 확인 */
        $('#userId').on('keyup',function(){
        	var id =$('#userId').val();
        	var regexp =/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        
        	$.ajax({
				url :"${pageContext.request.contextPath}/member/checkIdDup.do",
				data : {memberEmail : id },
				dataType : "json",
				success : function(data){
					if(data.isUsable==true){
						if(regexp.test(id)){
			        		chkId=true;
							$('#btnEmail').attr('disabled',false);
							$('#idChkMsg').html('사용 가능한 아이디').addClass('okChk').removeClass('noChk');
			
			        	}else{
			        		chkId=false;
			        		$('#btnEmail, #joinCode').attr('disabled',true);
			        		$('#idChkMsg').html('이메일 형식 확인').addClass('noChk').removeClass('okChk');
			        	}
						
					}else{
						chkId=false;
		        		$('#btnEmail, #joinCode').attr('disabled',true);
		        		$('#idChkMsg').html('이미 사용 중인 아이디').addClass('noChk').removeClass('okChk');
					}
					
				}, error : function(error,msg){
					
				}
			});
        	
        });
        
        
        
       var joinCode;
       
        $('#btnEmail').on('click',function(){
        	var userEmail = $('#userId').val();
        	$.ajax({
				url :"${pageContext.request.contextPath}/member/sendEmail.do",
				type:'post',
				data : {userEmail : userEmail },
				dataType : "json",
				success : function(data){
						/* alert(data.msg); */
						joinCode=data.joinCode;
						$('#joinCode, #btn_joinCode').attr('disabled',false);
						$('#codeChkMsg').html('인증번호가 발송되었습니다. 메일을 확인해주세요').addClass('okChk').removeClass('noChk');
				}, error : function(error,msg){
					
				}
			});
        });
        
        $('#btn_joinCode').on('click',function(){
        	var cn = $('#joinCode').val();
        	
        	if(cn==joinCode){
        		$('#btn_joinCode, #joinCode').attr('disabled',true);
        		$('#codeChkMsg').html('인증완료').addClass('okChk').removeClass('noChk');
        		chkNum=true;
        	}
        	else{
        		$('#codeChkMsg').html('인증실패').addClass('noChk').removeClass('okChk');
        		chkNum=false;
        	}
        });
        
        
        $('#userPwd').on('keyup focus blur',function(){
        	var pwd=$('#userPwd').val();
        	var regexp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,16}$/;
        	
        	if(!regexp.test(pwd)){
        		chkPwd=false;
        		$('#pwdChkMsg').html('영문자/숫자 포함 8~16자').addClass('noChk').removeClass('okChk');

        	}else{
        		chkPwd=true;
        		$('#pwdChkMsg').html('OK!').addClass('okChk').removeClass('noChk');
        	}
        	
        });
        
        $('#userPwd2').on('blur keyup',function(){
        	var pwd=$('#userPwd').val();
        	var pwd2=$('#userPwd2').val();
        	
        	if(pwd==pwd2 && chkPwd==true){
        		chkPwd2=true;
        		$('#pwdChkMsg2').html('OK!').addClass('okChk').removeClass('noChk');
        		
        	}else{
        		 $('#btn_signUp').attr('disabled',true); 
        		chkPwd2=false;
        		$('#pwdChkMsg2').html('비밀번호 확인').addClass('noChk').removeClass('okChk');

        	}
        });
        
        $('#userName').on('blur keyup',function(){
        	var name = $('#userName').val();
        	var regexp =/^[가-힣]{2,15}|[a-zA-Z]{2,15}\s[a-zA-Z]{2,15}$/;
        	
        	if(regexp.test(name)){
        		chkName=true;
        		$('#nameChkMsg').html('OK!').addClass('okChk').removeClass('noChk');
    
        	}else{
	       		chkName=false;
        		$('#nameChkMsg').html('이름 확인').addClass('noChk').removeClass('okChk');
        	}
        });
       
      $('#userYear, #userMonth, #userDay').on('change',function(){
    	  
    	  var yy=$('#userYear').val();
    	  var mm=$('#userMonth').val();
    	  var dd=$('#userDay').val();
    	
    	  if(yy==""){
    		  	chkBirth=false;
    			$('#birthChkMsg').html('연도 확인').addClass('noChk').removeClass('okChk');
    	  }else if(mm==""){
    		  chkBirth=false;
    		  $('#birthChkMsg').html('월 확인').addClass('noChk').removeClass('okChk');
    	  }else if(dd==""){
    		  chkBirth=false;
    		  $('#birthChkMsg').html('일 확인').addClass('noChk').removeClass('okChk');
    	  }
    	  
    	  if(yy!="" && mm!="" && dd!="" ){
    		  $('#memberBirth').val(yy+"-"+mm+"-"+dd);
    		  console.log($('#memberBirth').val());
    		  chkBirth=true;
    		  $('#birthChkMsg').html('OK!').addClass('okChk').removeClass('noChk');
    	  }
    	  
      });

     
      $('#signUpForm').on('keyup blur change',function(){
    	 /*  console.log(chkId +" / " + chkNum +" / " +chkPwd +" / " +chkPwd2 +" / "+ chkName +" / " +chkBirth +" / " +chkGender +" / "); */
    	 
    	  if(chkId==true && chkNum==true && chkPwd==true && chkPwd2==true && chkName==true && chkBirth==true && chkGender==true){
      		  $('#btn_signUp').attr('disabled',false);
    	  }else{
    		  
     	  		$('#btn_signUp').attr('disabled',true);
     	  }
      });
      
     
      
      /* ㄴㄴㄴ */
 /*   $('#btn_signUp').on('click',function(){
      	var cName = $('#cityName').val();
     	var dName = $('#districtName').val();
     		$('#memberAddress').val(cName + " " + dName);
     		
     		if(chkGender==false){
  			  if(!$('input:radio[name=memberGender]').is(':checked'))
  			  $('#genderChkMsg').html('성별체크').addClass('noChk').removeClass('okChk');
  		  }
     		
     		
     		if(cName !=null && dName==null){
     			alert('구 군선택도 ㄱㄱ');
     			return false;
     		}
      });  */
  

    </script>
</body>
</html>