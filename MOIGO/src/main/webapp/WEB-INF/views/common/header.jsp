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
<script src="${root}/resources/js/common/jquery-3.3.1.min.js"></script>
<script src="${root}/resources/js/common/fontfaceobserver.js"></script>
<link rel="stylesheet" href="${root}/resources/css/bootstrap/bootstrap.min.css"> 
<script src="${root}/resources/js/bootstrap/bootstrap.min.js" ></script>	
<link rel="stylesheet" href="${root}/resources/css/common/fonts.css" media="none" onload="this.media='all';">
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

#header-bar {
	background-color: #00bfff;
	height: 60px;
}

#search-input {
	margin-top: 10px;
}

#category-menu {
	background-color: #a0dbef;
	/* background-color: white; */
	height: 40px;
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
	position: fixed;
	left: 85%;
	width: 130px;
}

#login-slide-link {
	font-size: 18px;
	color: white;
}

 .test {
	border: 1px solid black;
} 

@media(max-width:1000px){
	.search{
		display: none;
	}
}

@media(min-width:767px){
	.navi{
	   width: 960px;
	}
}

.carousel-inner img {
  margin: auto;
}
</style>

</head>
<body>
<c:import url="/WEB-INF/views/member/loginModal.jsp"/>
	<!-- // 헤더부분 // -->
	<div class="container-fluid" id="header-bar">
		<div class="row">
			<!-- 로고 -->
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
				<a href="#" class="navbar-logo">
					<img id="logo" src="../resources/images/smiledog.jpg" width="150" height="50" /> 
				</a>
			</div>
	
			<!-- 검색 -->
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 search">
				<form action="${pageContext.request.contextPath}/search/searchList.do">
					<div class="input-group" id="search-input">
						<input type="text" class="form-control" name="keyword" autocomplete="off" placeholder="모임검색" size="50px">
						<span class="input-group-btn">
							<button class="btn btn-info">검색</button>
						</span>
					</div>
				</form>
			</div>
			 
			<!-- 로그인 -->
			<div class="col-md-6 col-lg-6"></div>
			<div class="col-md-1 col-lg-1" id="login">
				<a href="#" data-toggle="modal" data-target='#Login_Modal' id="login-slide-link">로그인</a>
			</div>
		</div>
	</div>

	<!-- 헤더 카테고리 부분 -->
	<nav class="navbar navbar-expand-lg navbar-light alert alert-primary">
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
		  <ul class="navbar-nav">
			<li class="nav-item active">
			  <a class="nav-link" href="#">전체보기<span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item active">
				<a class="nav-link" href="#">라이프스타일<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link" href="#">영어/외국어<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link" href="#">컴퓨터<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link" href="#">디자인/미술<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link" href="#">취업<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link" href="#">음악/공연<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link" href="#">스포츠<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link" href="#">뷰티/미용<span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
				<a class="nav-link" href="#">게임<span class="sr-only">(current)</span></a>
			  </li>
		  </ul>
		</div>
	</nav>

	<script>
		
		$(function() {
			
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
