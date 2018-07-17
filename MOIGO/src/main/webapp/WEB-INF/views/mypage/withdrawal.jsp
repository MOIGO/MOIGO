<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/myPage_custom.css">
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
                 <li class="nav-item"><a  class="nav-link  letter_space " href="${pageContext.request.contextPath}/mypage/profile.do">회원정보</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/changePwd.do"">비밀번호 변경</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/openGroup.do">주최모임</a></li>
                <li class="nav-item"> <a class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/joinGroup.do">참여모임</a></li>
                <li  class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/waitGroup.do">가입 대기 중</a></li>
                <li class="nav-item"><a  class="nav-link letter_space active" href="${pageContext.request.contextPath}/mypage/withdrawal.do">회원탈퇴</a></li>
            </ul>
        </div>
        <br>
            
        <!-- style="float:none; margin:0 auto;"  -->
        <div class="col-md-9 content_box_wrap " style="float:none; margin:0 auto;" >
            <h5><i class="fas fa-check-square"></i> 회원탈퇴</h5> 
            <div class="content_box_area ">
                <div class="row no_margin">
                    <div class="col-md-8">
                        <div class="row profile_wrap">
                            <div class="profile_box col-md-12 ">
                                <h6 style="font-weight: bold;">  모이고를 떠나려는 이유를 선택해주세요 (필수)</h6>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="optradio">원하는 모임이 없어요.
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="optradio">개인정보에 대한 우려가 있어서요.
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="optradio">이용방법을 잘 모르겠어요.
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="optradio">자주 방문하지 않아서요.
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input type="radio" class="form-check-input" name="optradio">기타
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="row profile_wrap">
                            <div class="profile_box col-md-12 ">
                                <h6 style="font-weight: bold;">더 자세한 이유가 있다면 우리에게 말해주세요 (선택)</h6>
                                <div class="form-group">
                                    <textarea class="form-control" rows="3" id="comment" style="resize: none;"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4 profile_wrap " style="border:none;">
                        <div class="profile_box col-md-12 ">
                            <h6 style="font-weight: bold;">회원탈퇴 대안</h6>
                                <div>
                                    <i class="far fa-lightbulb "></i> <a href="" >  클래스 비공개 하기</a> <br>
                                    <p class="guide_content">  클래스를 비공개하면 더 이상 다른 회원에게 회원님의 연락처가 노출되지 않습니다.</p>
                                </div>

                                <div>
                                    <i class="far fa-lightbulb"></i>  <a href=""> 모꼬지 이용방법</a> <br>
                                    <p class="guide_content">혹시 이용방법이 어려워서 탈퇴하려 하진 않으셨나요? 이용방법을 확인해보세요</p>
                                </div>
                        </div>
                    </div>
                </div>

                <div class="row no_margin col-md-12" >
                    <div class="profile_box col-md-12 ">
                        <button class="btn_profileUpdate col-md-2 col-xs-12"> 탈퇴하기</button>
                    </div>
                </div>
                <br>
                
            </div>
        </div>
    </div>

    <br><br><br><br><br><br>
</body>
</html>