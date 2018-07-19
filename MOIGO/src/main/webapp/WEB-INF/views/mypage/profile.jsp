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
            <ul class="nav nav-tabs nav-justified " >
                <li class="nav-item"><a  class="nav-link  letter_space active" href="${pageContext.request.contextPath}/mypage/profile.do">회원정보</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/changePwd.do">비밀번호 변경</a></li>
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
                            <input type="text" class="col-12 profile_form_control "  name="memberEmail" id="loginId" readonly style="border:none;" value="${m.memberEmail }" >
                        </div>
                    </div>
                </div>
                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-2 col-xs-3">이름</div>
                        <div class="content_profile col-md-10 col-xs-9 ">
                            <input type="text" class="col-12 profile_form_control "   name="memberName" id="userName" readonly style="border:none;" value="${m.memberName }">
                        </div>
                    </div>
                </div>

                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-2 col-xs-3">성별</div>
                        <div class="content_profile col-md-10 col-xs-9 ">
                                <input type="text" class="col-xs-12 profile_form_control "  name="memberGender"id="loginId"   style="border:none;" value="${m.memberGender=='M'?'남자':'여자' }" readonly> 
                        </div>
                    </div>
                </div>
                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-2 col-xs-4">생년월일 </div>
                        <div class="content_profile col-md-10 col-xs-12 row no_margin">
                            <select id="birthday_year" name="birthday_year" class="col-md-2 col-xs-12 profile_form_controla" style="margin-left:1%;">
                                 <c:forEach var="i" begin="0" end="${2019-1938}">
                                 		<c:set var="userYear" value="${userYear }" />
                                 			<c:if test="${i==0}">
								       			 <option  value="" disabled>년</option>
								       		</c:if>
								       		<c:if test="${i!=0}">
						       					<option value="${2019-i}" <c:if test="${(2019-i) eq userYear}">selected</c:if>>${2019-i}</option>
							      			</c:if>
							       </c:forEach>
                            </select>

                            <select name="" id="" class="col-md-2 col-xs-12 profile_form_controla" style="margin-left:1%;">
                                <c:forEach var="i" begin='0' end='12'>
                               			<c:set var="userMonth" value="${userMonth }" />
								       		<c:if test="${i==0}">
								       			 <option  value="" disabled>월</option>
								       		</c:if>
								       		<c:if test="${i!=0}">
								       			<c:if test="${i<10}">
								       				<option value="0${i}"<c:if test="${i eq userMonth}">selected</c:if> >${i}월</option>
								       			</c:if>
								       			<c:if test="${i>=10}">
								       				<option value="${i}" <c:if test="${i eq userMonth}">selected</c:if>>${i}월</option>
								       			</c:if>
								       		</c:if>
								</c:forEach>
                            </select>   

                            <select name="" id="" class="col-md-2 col-xs-12 profile_form_controla" style="margin-left:1%;">
                                   <c:forEach var="i" begin='0' end='31'>
							       		<c:set var="userDay" value="${userDay}" />
								       		<c:if test="${i==0}">
								       			 <option  value="" disabled>일</option>
								       		</c:if>
								       		<c:if test="${i!=0}">
								       			<c:if test="${i<10}">
								       				<option value="0${i}"<c:if test="${i eq userDay}">selected</c:if> >${i}일</option>
								       			</c:if>
								       			<c:if test="${i>=10}">
								       				<option value="${i}" <c:if test="${i eq userDay}">selected</c:if>>${i}일</option>
								       			</c:if>
								       		</c:if>
							       </c:forEach>
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