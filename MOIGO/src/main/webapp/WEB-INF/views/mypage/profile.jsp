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
</head>
<body >
   <c:import url="/WEB-INF/views/common/header.jsp"></c:import>
        <br><br>
    


    <div class="container" >
         <div class="col-md-9" style="float:none; margin:0 auto;">
            <h2>마이페이지</h2>
            <ul class="nav nav-tabs nav-justified" >
                <li class="nav-item"><a  class="nav-link  letter_space active" href="${pageContext.request.contextPath}/mypage/profile.do">회원정보</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/changePwd.do"">비밀번호 변경</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/openGroup.do">주최모임</a></li>
                <li class="nav-item"> <a class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/joinGroup.do">참여모임</a></li>
                <li  class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/waitGroup.do">가입 대기 중</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/withdrawal.do">회원탈퇴</a></li>
            </ul>
        </div>
        <br>



        <!-- style="float:none; margin:0 auto;"  -->
        <div class="col-md-9 content_box_wrap " style="float:none; margin:0 auto;" >
            <h5><i class="fas fa-user"></i> 회원정보</h5>
            <div class="content_box_area" >
              
                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-2 col-xs-3">아이디</div>
                        <div class="content_profile col-md-10 col-xs-9 ">
                            <input type="text" class="col-12 profile_form_control "  name="memberEmail" id="loginId" readonly style="border:none;" value="wonjune0309@naver.com" >
                        </div>
                    </div>
                </div>
                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-2 col-xs-3">이름</div>
                        <div class="content_profile col-md-10 col-xs-9 ">
                            <input type="text" class="col-12 profile_form_control "   name="memberName" id="loginId" readonly style="border:none;" value="홍길동">
                        </div>
                    </div>
                </div>

                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-2 col-xs-3">성별</div>
                        <div class="content_profile col-md-10 col-xs-9 ">
                                <input type="text" class="col-xs-12 profile_form_control "  name="memberGender"id="loginId" value="남자" readonly style="border:none;" value="남자" > 
                        </div>
                    </div>
                </div>
                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-2 col-xs-4">생년월일</div>
                        <div class="content_profile col-md-10 col-xs-12 row no_margin">
                            <select id="birthday_year" name="birthday_year" class="col-md-2 col-xs-12 profile_form_controla" style="margin-left:1%;">
                                <option disabled value="" selected>년</option>
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

                            <select name="" id="" class="col-md-2 col-xs-12 profile_form_controla" style="margin-left:1%;">
                                <option disabled="" value="" selected>월</option>
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

                            <select name="" id="" class="col-md-2 col-xs-12 profile_form_controla" style="margin-left:1%;">
                                    <option disabled="" value="" selected>일</option>
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
                    </div>
                </div>

                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-2 col-xs-12">활동지역</div>
                        <div class="content_profile col-md-10 col-xs-12 row no_margin">
                            
                                    <select name="" id="" class="col-md-4 col-xs-12 profile_form_controla"style="margin-left:1%;">
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
                                    <select name="" id="" class="col-md-4  col-xs-12 profile_form_controla" style="margin-left:1%;">
                                            <option disabled value="" selected>구, 군 선택</option>
                                    </select>
                        </div>
                    </div>
                </div>
                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-2 col-xs-12">관심분야</div>
                        <div class="content_profile col-md-10 col-xs-12 row no_margin">
                            <div id="interest_category"  class="col-md-12 col-xs-12  row" style="border: 0.5px solid #dddfe4; padding:10px; margin-left:1%; font-size: 14px;">
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
                    </div>
                </div>

                <div class="row">
                    <div class="profile_box col-md-12 ">
                        <button class="btn_profileUpdate pull-right col-md-2 col-xs-12"> 저장하기</button>
                    </div>
                </div>
                <br>
            </div>
        </div>
    </div>

    <br><br><br><br><br><br>
</body>
</html>