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
<body>
   <c:import url="/WEB-INF/views/common/header.jsp"></c:import>
        <br><br>

 

    <div class="container" >
        <div class="col-md-9" style="float:none; margin:0 auto;">
            <h2>마이페이지</h2>
            <ul class="nav nav-tabs nav-justified" >
                <li class="nav-item"><a  class="nav-link  letter_space " href="${pageContext.request.contextPath}/mypage/profile.do">회원정보</a></li>
                <li class="nav-item"><a  class="nav-link letter_space active" href="${pageContext.request.contextPath}/mypage/changePwd.do"">비밀번호 변경</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/openGroup.do">주최모임</a></li>
                <li class="nav-item"> <a class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/joinGroup.do">참여모임</a></li>
                <li  class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/waitGroup.do">가입 대기 중</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/withdrawal.do">회원탈퇴</a></li>
            </ul>
        </div>
        <br>
            
        <!-- style="float:none; margin:0 auto;"  -->
        <div class="col-md-9 content_box_wrap " style="float:none; margin:0 auto;" >
            <h5><i class="fas fa-lock"></i> 비밀번호 변경</h5>
            <div class="content_box_area" >
              
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
                            <input type="text" class="col-xs-12 col-md-8 profile_form_control" id="loginId"   >
                        </div>
                    </div>
                </div>
                <div class="row profile_wrap">
                    <div class="profile_box col-md-12  row no_margin">
                        <div class="title_profile col-md-3 col-xs-12">새 비밀번호</div>
                        <div class="content_profile col-md-9 col-xs-12 ">
                            <input type="text" class="col-xs-12 col-md-8 profile_form_control " id="loginId">
                        </div>
                    </div>
                </div>

                <div class="row profile_wrap">
                    <div class="profile_box col-md-12  row no_margin">
                        <div class="title_profile col-md-3 col-xs-12">비밀번호 확인</div>
                        <div class="content_profile col-md-9 col-xs-12">
                                <input type="text" class="col-xs-12 col-md-8 profile_form_control " id="loginId" > 
                        </div>
                    </div>
                </div>
               

                <div class="row">
                    <div class="profile_box col-md-12 ">
                        <button class="btn_profileUpdate pull-right col-md-2 col-xs-12"> 변경하기</button>
                    </div>
                </div>
                <br>
            </div>
        </div>
    </div>

    <br><br><br><br><br><br>
</body>
</html>