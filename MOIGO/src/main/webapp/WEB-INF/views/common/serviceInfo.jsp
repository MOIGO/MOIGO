<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스소개</title>
<style>
#footerCategory{
    font-size: 18px;
}

.cursorPo{
	cursor: pointer;
}

#si{
    background-color: lightgray;
    height: 200px;
}

.disb{
	display:inline-block;
	border: 1px solid gray;
	border-bottom: none;
	border-top: none;
}

.wit{
	width: 100%;
}

.infocate{
	width: 100%;
	height: 65px;
	text-align: center;
	margin-left: 5px;
}

.infocontent{
	position:absolute; 
	text-align: center;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<!-- // 바디부분 // -->
	<hr>
    <div class="container" id="footerCategory">
        <div class="row">
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center">
            <b class="cursorPo" id="serviceInfo2" style="color:skyblue;">서비스소개</b></div>
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center">
            <b class="cursorPo" id="personalInfo2">개인정보 취급 방침</b></div>
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center">
            <b class="cursorPo" id="useGuide2">이용안내</b></div>
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center">
            <b class="cursorPo" id="maps2">연락처 및 지도</b></div>
        </div>
    </div>
    <hr>
    <br>
    <div class="container-fluid" id="si">
        <div class="row" style="height: 100%;">
            <div class="col-md-3 col-lg-3 disb">
					<div class="infocate d-flex justify-content-center align-items-center">
						<i class="fas fa-exclamation-triangle" style="font-size: 5ex;"></i></div>
					<div class="row infocate d-flex justify-content-center align-items-center">
						<h4 class="wit">새로운 서비스</h4>
						<pre class="wit">모임을 한곳에 모아 누구나 편리하고 <br>쉽게 찾을 수 있습니다.</pre>
					</div>
			</div>
            <div class="col-md-3 col-lg-3 disb">
				<div class="infocate d-flex justify-content-center align-items-center">
					<i class="fas fa-won-sign" style="font-size: 5ex;"></i></div>
				<div class="row infocate d-flex justify-content-center align-items-center">	
					<h4 class="wit">저렴한 가격</h4>
					<pre class="wit">더 이상 모임을 찾느라 돈을 <br>사용하실 필요가 없습니다.</pre>
				</div>
			</div>
            <div class="col-md-3 col-lg-3 disb">
				<div class="infocate d-flex justify-content-center align-items-center">
					<i class="fas fa-users" style="font-size: 5ex;"></i></div>
				<div class="row infocate d-flex justify-content-center align-items-center">	
					<h4 class="wit">다양한 모임</h4>
					<pre class="wit">스터디,핸드메이드,취미생활,<br>스포츠 원하는 모든 모임</pre>
				</div>
			</div>
            <div class="col-md-3 col-lg-3 disb">
				<div class="infocate d-flex justify-content-center align-items-center">
					<i class="fas fa-map-marker-alt" style="font-size: 5ex;"></i></div>
				<div class="row infocate d-flex justify-content-center align-items-center">
					<h4 class="wit">위치기반 검색</h4>
					<pre class="wit">상세 검색 기능과 목적에 <br>맞는 인원 혹은 장소를 <br>지도로 쉽게 볼 수 있도록 지원 </pre>
				</div>
			</div>
        </div>
    </div>
	
	<br><br>

	<div class="container d-flex justify-content-center align-items-center" style="width:1200px; height:600px;">
			<img src="../resources/images/main/running.jpg" 
				style="width: 100%; height:100%; vertical-align: middle; position:relative; opacity: 0.7;"/>
			<div class="infocontent">
			<h2>모임 커넥팅 서비스</h2> <br>
			<p>
				모든 모임들을 한 곳에 모아서 찾아볼 수 있습니다. <br>
				취미,스포츠,외국어 어떤 모임이든 모이고와 함께하세요.
			</p>
			</div>
	</div>

		<br><br><br>
	<!-- // 바디부분 // -->
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>