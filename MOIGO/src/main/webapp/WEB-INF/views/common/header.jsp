<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모이고</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> 
<script src="${root}/resources/js/common/jquery-3.3.1.min.js"></script>
<script src="${root}/resources/js/common/fontfaceobserver.js"></script>
<link rel="stylesheet" href="${root}/resources/css/bootstrap/bootstrap.min.css"> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="${root}/resources/js/bootstrap/bootstrap.min.js" ></script>	
<link rel="stylesheet" href="${root}/resources/css/common/fonts.css" media="none" onload="this.media='all';">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
<style>
	
body {
	font-family:'nanum-barun-gothic-regular', sans-serif;
	letter-spacing: -1px; 
}

.fonts_loaded {
  body {
    font-family : 'nanum-barun-gothic-regular', sans-serif;
	letter-spacing: -1px; 
  }
}

.testContainer{
	background-color: blue;
}
/* 헤더 */
#headerBar {
	background-color: #00bfff;
	height: 60px;
}

#search-input {
	margin-top: 10px;
}

#menu-slider {
	text-align: center;
}

.navbar-nav.navbar-center {
	position: absolute;
	left: 55%;
	transform: translatex(-50%);
}

#login {
	margin-top: 15px;
	position: inherit;
	left: 85%;
	width: 80px;
}

#login-slide-link {
	font-size: 18px;
	color: white;
	margin-top: 8px;
}

 .test {
	border: 1px solid black;
} 

@media(max-width:1000px){
	.search{
		visibility: hidden;
	}
}

@media(max-width:992px){
	.navsize{
	   height: 66px;
	}
}

@media(max-width:770px){
	#login{
	  display: none;
	}
}


@media(max-width:748px){
	.navsize{
		width: 748px;
	   height: 66px;
	}
}

.navic:hover{
	cursor: pointer;
	transform: translateY(-5px);
	font-size: 18px;
}

.usercon{
	color: white;
}

.usercon:hover{
	cursor: pointer;
	color: skyblue;
}

#dropDown{
	margin-bottom:50%;
}

#myMenu{
	/* background-color: rgba( 255, 255, 255, 0.1 ); */
	background-color: #00bfff;
	border: 1px solid #00bfff;
}

#dropdown-Menu{
	color: white;
}

#memName{
	margin-top: 10px;
	color: white;
}
</style>

</head>
<body>
<c:import url="/WEB-INF/views/member/loginModal.jsp"/>

		<!-- // 헤더부분 // -->
	<div class="container-fluid" id="headerBar">
		<div class="row">
		<!-- 로고 -->
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2"></div>
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
			<a href="${pageContext.request.contextPath}" class="navbar-logo"><img id="logo"
				src="${pageContext.request.contextPath}/resources/images/main/moigo.png"
				width="150" height="50" /> </a>
		</div>

		<!-- 검색 -->
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 search">
		<form action="${pageContext.request.contextPath}/search/searchList.do">
			<div class="input-group" id="search-input">
				<input type="text" class="form-control" autocomplete="off" name="keyword" placeholder="모임검색" size="50px">
				<span class="input-group-btn">
					<button class="btn btn-info" type="button" onclick="submit()">검색</button>
				</span>
			</div>
		</form>
		</div>
		<!-- 로그인 -->
		<div class="col-md-2 col-lg-2"></div>
		<div class="col-md-3 col-lg-3" id="login">
			<div class="row">
			<c:choose>
			<c:when test="${m eq null}" >
				<a href="#" data-toggle="modal" data-target='#Login_Modal'
					id="login-slide-link">로그인</a>
					&nbsp;&nbsp;
			</c:when>
			<c:otherwise>
				<p id="memName">[${m.memberName}]님이 접속하셨습니다.</p>
			</c:otherwise>
			</c:choose>
			<c:if test ="${m ne null}">
			<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button" id="myMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-user usercon" style="font-size: 4ex;"></i>
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					  <a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/profile.do">마이페이지</a>
					  <a class="dropdown-item" href="${pageContext.request.contextPath}/groups/groupsTest.do">모임 메인</a>
					  <a class="dropdown-item" href="${pageContext.request.contextPath}/adminHome.ad">관리자페이지</a>
					  <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberLogout.do">로그아웃</a>
					</div>
				  </div>
			</c:if>	  
		</div>
		</div>
		
		</div>
	</div>
	 <script>
		$('#loginIcon').on('click',function(){
			$('.usercon').css('color','skyblue');	
		});
	</script>

	<!-- 헤더 카테고리 부분 -->
	<nav class="navbar navbar-expand-lg navbar-light alert alert-primary navsize navbar-expand">
		<div class="collapse navbar-collapse d-flex justify-content-center" id="navbarNavDropdown">
		  <ul class="navbar-nav">
			<li class="nav-item active">
			  <a class="nav-link navic" href="${pageContext.request.contextPath}/search/searchList.do">
			  전체보기<span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item active">
				<a class="nav-link navic" href="#">라이프스타일<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link navic" href="#">영어/외국어<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link navic" href="#">컴퓨터<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link navic" href="#">디자인/미술<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link navic" href="#">취업<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link navic" href="#">음악/공연<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link navic" href="#">스포츠<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link navic" href="#">뷰티/미용<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link navic" href="#">게임<span class="sr-only">(current)</span></a>
			  </li>
		  </ul>
		</div>
	</nav>
	
	<!-- 테스트 -->
	<c:set var="m" value="${sessionScope.m}"></c:set>
	<!-- 테스트 -->
	

	<script>
		$('#logo').on( 'click',function() {
					location.href = "#"
					});
	</script>

	<!-- // 헤더부분 // -->

	<script>
		
		$(function() {
			
			console.log("${m}");
			
			/* 
				폰트 로드시 FOIT을 방지하기 위해서 FOUT처럼 동작하도록 하는 메소드 
			   	스크롤 이벤트가 발생할 때마다 폰트로드를 확인함
			*/
			var font = new FontFaceObserver('nanum-barun-gothic-regular');

			font.load().then(function () {
			  document.documentElement.className += " fonts_loaded";
			}); 
			
		});
		
	
		$('#logo').on( 'click', function() {
			location.href = "#"
		});
		
	</script>
</body>
</html>
