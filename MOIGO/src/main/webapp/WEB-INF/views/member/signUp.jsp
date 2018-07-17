<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
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

    </style>

</head>
<body style="background-color:#eef0f3;">
 <%-- <c:import url="header.jsp"/>  --%>
    <br><br>
    <div class="container " >
        <div class="content_area col-md-5 col-12 " style=" margin:0 auto; float:none"  >
        	<div class="d-flex justify-content-center "> <img style="width:50%;height:100%;" src="${pageContext.request.contextPath}/resources/images/moigo.png"> </div>
				<br>
                <form action="" id="signUpForm">
                <!-- <h5>필수정보</h5> -->
                    <div class="form-group col-md-12 col-12 row no_margin " >
                        <div class="row col-12 no_margin letter_space_join no_padding" >아이디(이메일)</div>
                        <input type="text" class="col-md-9 col-8 join_form_control"  name="memberEmail" id="userId" placeholder="이메일 주소"  >
                        <button class="col-md-3 col-4 join_form_control btn_sign"  type="button" disabled  id="btn_userId"> 인증</button>
                        <span id="idChkMsg"></span>
                        
                    </div>
                    <div class="form-group col-md-12 col-sm-12 row no_margin">
                        <div class="row  col-12 no_margin letter_space_join no_padding" >이메일인증</div>
                        <input type="text" class="col-md-9 col-8  join_form_control " id="certificationNum" placeholder="인증번호" >
                        <button class="col-md-3  col-4  join_form_control btn_sign"  type="button" id="btn_certificationNum" disabled>확인</button>
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
                        <input type="text" class="col-md-12 col-12 join_form_control " id="userName" placeholder="" >
                    	<span id="nameChkMsg"></span>
                    </div>
                  
                    
                    <div class="form-group col-md-12 col-12 ">
                            <div class="row no_margin letter_space_join" >생년월일</div>
                            <div class="row no_margin">
                                <select id="userYear" name="" class="col-md-4 col-12 join_form_control " >
                                    <option value=""  selected>년</option>
                                    <option value="2018">2018</option>
                                    <option value="2017">2017</option>
                                    <option value="2016">2016</option>
                                    <option value="2015">2015</option>
                                    <option value="2014">2014</option>
                                    <option value="2013">2013</option>
                                    <option value="2012">2012</option>
                                    <option value="2011">2011</option>
                                    <option value="2010">2010</option>
                                    <option value="2009">2009</option>
                                    <option value="2008">2008</option>
                                    <option value="2007">2007</option>
                                    <option value="2006">2006</option>
                                    <option value="2005">2005</option>
                                    <option value="2004">2004</option>
                                    <option value="2003">2003</option>
                                    <option value="2002">2002</option>
                                    <option value="2001">2001</option>
                                    <option value="2000">2000</option>
                                    <option value="1999">1999</option>
                                    <option value="1998">1998</option>
                                    <option value="1997">1997</option>
                                    <option value="1996">1996</option>
                                    <option value="1995">1995</option>
                                    <option value="1994">1994</option>
                                    <option value="1993">1993</option>
                                    <option value="1992">1992</option>
                                    <option value="1991">1991</option>
                                    <option value="1990">1990</option>
                                    <option value="1989">1989</option>
                                    <option value="1988">1988</option>
                                    <option value="1987">1987</option>
                                    <option value="1986">1986</option>
                                    <option value="1985">1985</option>
                                    <option value="1984">1984</option>
                                    <option value="1983">1983</option>
                                    <option value="1982">1982</option>
                                    <option value="1981">1981</option>
                                    <option value="1980">1980</option>
                                    <option value="1979">1979</option>
                                    <option value="1978">1978</option>
                                    <option value="1977">1977</option>
                                    <option value="1976">1976</option>
                                    <option value="1975">1975</option>
                                    <option value="1974">1974</option>
                                    <option value="1973">1973</option>
                                    <option value="1972">1972</option>
                                    <option value="1971">1971</option>
                                    <option value="1970">1970</option>
                                    <option value="1969">1969</option>
                                    <option value="1968">1968</option>
                                    <option value="1967">1967</option>
                                    <option value="1966">1966</option>
                                    <option value="1965">1965</option>
                                    <option value="1964">1964</option>
                                    <option value="1963">1963</option>
                                    <option value="1962">1962</option>
                                    <option value="1961">1961</option>
                                    <option value="1960">1960</option>
                                    <option value="1959">1959</option>
                                    <option value="1958">1958</option>
                                    <option value="1957">1957</option>
                                    <option value="1956">1956</option>
                                    <option value="1955">1955</option>
                                    <option value="1954">1954</option>
                                    <option value="1953">1953</option>
                                    <option value="1952">1952</option>
                                    <option value="1951">1951</option>
                                    <option value="1950">1950</option>
                                    <option value="1949">1949</option>
                                    <option value="1948">1948</option>
                                    <option value="1947">1947</option>
                                    <option value="1946">1946</option>
                                    <option value="1945">1945</option>
                                    <option value="1944">1944</option>
                                    <option value="1943">1943</option>
                                    <option value="1942">1942</option>
                                    <option value="1941">1941</option>
                                    <option value="1940">1940</option>
                                    <option value="1939">1939</option>
                                    <option value="1938">1938</option>
                                </select>

                                <select name="" id="userMonth" class="col-md-4 col-12 join_form_control">
                                    <option  value="" selected>월</option>
                                    <option value="1">1월</option>
                                    <option value="2">2월</option>
                                    <option value="3">3월</option>
                                    <option value="4">4월</option>
                                    <option value="5">5월</option>
                                    <option value="6">6월</option>
                                    <option value="7">7월</option>
                                    <option value="8">8월</option>
                                    <option value="9">9월</option>
                                    <option value="10">10월</option>
                                    <option value="11">11월</option>
                                    <option value="12">12월</option>
                                </select>   

                                <select name="" id="userDay" class="col-md-4 col-12 join_form_control">
                                        <option  value="" selected>일</option>
                                        <option value="1">1일</option>
                                        <option value="2">2일</option>
                                        <option value="3">3일</option>
                                        <option value="4">4일</option>
                                        <option value="5">5일</option>
                                        <option value="6">6일</option>
                                        <option value="7">7일</option>
                                        <option value="8">8일</option>
                                        <option value="9">9일</option>
                                        <option value="10">10일</option>
                                        <option value="12">12일</option>
                                        <option value="13">13일</option>
                                        <option value="14">14일</option>
                                        <option value="15">15일</option>
                                        <option value="16">16일</option>
                                        <option value="17">17일</option>
                                        <option value="18">18일</option>
                                        <option value="19">19일</option>
                                        <option value="20">20일</option>
                                        <option value="21">21일</option>
                                        <option value="22">22일</option>
                                        <option value="23">23일</option>
                                        <option value="24">24일</option>
                                        <option value="25">25일</option>
                                        <option value="26">26일</option>
                                        <option value="27">27일</option>
                                        <option value="28">28일</option>
                                        <option value="29">29일</option>
                                        <option value="30">30일</option>
                                        <option value="31">31일</option>
                                </select>
                            </div>
                           	<span id="birthChkMsg"></span>
                    </div>

                    <div class="form-group col-md-12 col-12 row no_margin">
                            <div class="row  col-12 no_margin letter_space_join no_padding" >성별</div>
                       <input type="radio" name="memberGender" id="male" class="inp_gender" value="M"><label for="male" id="label_m" class="col-md-6 col-6"> 남자</label>
                        <input type="radio"name="memberGender" id="femail" class="inp_gender"  value="W"><label for="femail" id="label_w" class="col-md-6 col-6">여자</label>
                    </div>
    
                        <hr style=" background: #dddfe4;">
                        

                <h6 >추가정보<span style=" font-size:0.8em;"> (개인별 맞춤 정보 제공)</span></h6> 
                    
                
                    <div class="form-group col-md-12 col-12 row no_margin">
                        <button class="collapsed col-md-12 col-12 join_form_control btn_addInfo row no_margin"  data-toggle="collapse" data-target="#interestCategory"  type="button" >관심분야 </button>
                        <div id="interestCategory"  class="row col-md-12 col-12 collapse  no_margin" style="border: 0.5px solid #ccc; padding:10px; font-size:14px;">
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f1" name="interest"  > <label for="f1">라이프스타일</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f2" name="interest" > <label for="f2">영어/외국어</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f3" name="interest" > <label for="f3">컴퓨터</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f4" name="interest" > <label for="f4">디자인/미술</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f5" name="interest" > <label for="f5">취업</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f6" name="interest" > <label for="f6">음악/공연</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f7" name="interest" > <label for="f7">스포츠</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f8" name="interest" > <label for="f8">뷰티/미용</label></span>
                            <span class="ff col-md-4 col-6"><input type="checkbox"id="f9" name="interest" > <label for="f9">게임</label></span>
                        </div>
                    </div>
                    
                    <div class="form-group col-md-12 col-12 row no_margin">
                        <button class="  collapsed col-md-12 col-12 join_form_control btn_addInfo row no_margin" data-toggle="collapse" data-target="#activity_area" type="button">활동지역 </button>
                        <div id="activity_area"  class="col-md-12 col-12 collapse row no_margin" style="border: 0.5px solid #ccc; padding:10px;">
                            <select name="aa" id="aa" class="col-md-6 col-12 join_form_controla">
                                <option disabled value="" selected>시, 도 선택</option>
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
                                <option value="">지역무관</option>
                            </select>

                        
                            <select name="bb" id="bb" class="col-md-6 col-12 join_form_controla">
                                    <option disabled value="" selected>구, 군 선택</option>
                            </select>
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
    var chkNum = false;
    var chkPwd = false;
    var chkPwd2 = false;
    var chkName = false;
    var chkBirth = false;
    var chkGender = false;
    
        // 라디오버튼 체크
        $('input[type="radio"][name="memberGender"]').click(function(){
        	chkGender=true;
            if($(this).val()=='M'){
                $('#label_m').addClass('label_border');
                $('#label_w').removeClass('label_border');
            }
            else  if($(this).val()=='W'){
                $('#label_w').addClass('label_border');
                $('#label_m').removeClass('label_border');
             }
            

        });

        // 관심분야 개수제한
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
        
        
        // 유효성검사
        
        // 이메일
        // /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        // 비밀번호
        // /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,16}$/
        //이름
        //  /^[가-힣]{2,15}|[a-zA-Z]{2,15}\s[a-zA-Z]{2,15}|[a-zA-Z]{2,15}{4,15}$/


        
        $('#userId').on('keyup',function(){
        	var id =$('#userId').val();
        	var regexp =/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        
        	if(regexp.test(id)){
        		chkId=true;
				$('#btn_userId').attr('disabled',false);
				$('#idChkMsg').html('OK!').addClass('okChk').removeClass('noChk');

        	}else{
        		chkId=false;
        		$('#btn_userId').attr('disabled',true);
        		$('#idChkMsg').html('이메일 형식 확인').addClass('noChk').removeClass('okChk');
        	}
        });
        
        $('#certificationNum').on('keyup',function(){
        	var cn = $('#certificationNum').val();
        	
        	chkNum=true;
        	$('#btn_certificationNum').attr('disabled',false);
        	
        	if(cn==""){
        		chkNum=false;
        		$('#btn_certificationNum').attr('disabled',true);
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
      
  

    </script>
</body>
</html>