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
<body  >
   
   <c:import url="/WEB-INF/views/common/header.jsp"></c:import>
        <br><br>



    <div class="container" >
         <div class="col-md-9" style="float:none; margin:0 auto;">
            <h2>마이페이지</h2>
            <ul class="nav nav-tabs nav-justified" >
                <li class="nav-item"><a  class="nav-link  letter_space " href="${pageContext.request.contextPath}/mypage/profile.do">회원정보</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/changePwd.do"">비밀번호 변경</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/openGroup.do">주최모임</a></li>
                <li class="nav-item"> <a class="nav-link letter_space active" href="${pageContext.request.contextPath}/mypage/joinGroup.do">참여모임</a></li>
                <li  class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/waitGroup.do">가입 대기 중</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/withdrawal.do">회원탈퇴</a></li>
            </ul>
        </div>
        <br>
            
        <!-- style="float:none; margin:0 auto;"  -->
        <div class="col-md-9 content_box_wrap " style="float:none; margin:0 auto;" >
            <h5><i class="fas fa-user-friends"></i> 참여모임</h5> 
            <div class="groupList_box col-md-12 row">
                    
                    <div class="groupList_item col-xl-3 col-sm-6 col-12 " >
                        <div class="item_content">
                            <div class="header_bg" style="background-image:url(11.jpg)"></div>
                            <div class="body_text_container">
                                <div class="body_text">
                                    <div class="body_title">나만의 마리오네트</div>
                                    <div class="body_member">멤버 : 00 명</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="groupList_item col-xl-3 col-sm-6 col-12 " >
                        <div class="item_content">
                            <div class="header_bg" style="background-image:url(1.jpg)"></div>
                            <div class="body_text_container">
                                <div class="body_text">
                                    <div class="body_title">나만의 마리오네트</div>
                                    <div class="body_member">멤버 : 00 명</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="groupList_item col-xl-3 col-sm-6 col-12 " >
                            <div class="item_content">
                                <div class="header_bg" style="background-image:url(1.jpg)"></div>
                                <div class="body_text_container">
                                    <div class="body_text">
                                        <div class="body_title">나만의 마리오네트</div>
                                        <div class="body_member">멤버 : 00 명</div>
                                    </div>
                                </div>
                            </div>
                        </div>
    
                        <div class="groupList_item col-xl-3 col-sm-6 col-12 " >
                            <div class="item_content">
                                <div class="header_bg" style="background-image:url(1.jpg)"></div>
                                <div class="body_text_container">
                                    <div class="body_text">
                                        <div class="body_title">나만의 마리오네트</div>
                                        <div class="body_member">멤버 : 00 명</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="groupList_item col-xl-3 col-sm-6 col-12 " >
                            <div class="item_content">
                                <div class="header_bg" style="background-image:url(1.jpg)"></div>
                                <div class="body_text_container">
                                    <div class="body_text">
                                        <div class="body_title">나만의 마리오네트</div>
                                        <div class="body_member">멤버 : 00 명</div>
                                    </div>
                                </div>
                            </div>
                        </div>
    
                        <div class="groupList_item col-xl-3 col-sm-6 col-12 " >
                            <div class="item_content">
                                <div class="header_bg" style="background-image:url(1.jpg)"></div>
                                <div class="body_text_container">
                                    <div class="body_text">
                                        <div class="body_title">나만의 마리오네트</div>
                                        <div class="body_member">멤버 : 00 명</div>
                                    </div>
                                </div>
                            </div>
                        </div>
            </div>

            
        </div>
    </div>

    <br><br><br><br><br><br>
</body>
</html>