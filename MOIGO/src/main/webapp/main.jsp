<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${root}/resources/js/common/jquery-3.3.1.min.js"></script>
<title>모이고 홈페이지</title>
<style>
/* 메인 */ 
.carousel-inner img { 
  margin: auto;
}

.mainGroup{
	display: inline-block;
	width: 200px;
  height: 200px;
}

.groupView_top{
	display: block;
	width: 200px;
  height: 120px;
}
.groupView_bot{
	display: block;
	width: 200px;
 	height: 80px;
}

.themeContent{
	position:absolute;
	color: black;
	font-size: 18px;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<!-- // 메인부분 // -->
	<br>
	<br>
	<!-- 케러셀 부분(광고 또는 안내배너) -->
	<div class="container">
	<div id="carouselExampleIndicators" class="carousel slide test" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-60" src="resources/images/main/snow.jpg" alt="First slide">
				<div class="carousel-caption d-none d-md-block">
						<h5>삿포로 눈</h5>
						<p>눈꽃 축제 어떠세요??</p>
					  </div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-60" src="resources/images/main/house.jpg" alt="Second slide">
				<div class="carousel-caption d-none d-md-block">
						<h5>삿포로 호수</h5>
						<p>호수에서 하룻밤 어떠세요??</p>
					  </div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-60" src="resources/images/main/wind.jpg" alt="Third slide">
				<div class="carousel-caption d-none d-md-block">
						<h5>바람이 부는 언덕</h5>
						<p>편안~~</p>
					  </div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</div>

<br><br>

	<!-- 내가 가입한 모임 -->
	<div class="d-flex justify-content-center"><b>내가 가입한 모입</b></div>
<br><br>
	<div class="container">
			<div class="container d-flex justify-content-center">
				<div class="mainGroup test d-flex justify-content-center align-items-center ani plusGroup" style="background-color:skyblue;">
							<a href="#" class="plusGroup"><img id="plus"
										src="resources/images/main/plus.png"
										width="50" height="50" /> </a>  &nbsp;
							모임 만들기
						</div> &nbsp;&nbsp;&nbsp;
				<div id="carouselExampleIndicators1" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">				
						<div class="mainGroup test ani">
								<div class="groupView_top test">
									<img id="logo4" src="resources/images/main/culture.jpeg"
													width="100%" height="100%"/></div>
								<div class="groupView_bot test">가입한 모임 정보1</div>
							</div> &nbsp;&nbsp;
					
							<div class="mainGroup test ani">
								<div class="groupView_top test">
									<img id="logo4" src="resources/images/main/culture.jpeg"
													width="100%" height="100%"/></div>
								<div class="groupView_bot test">가입한 모임 정보2</div>
							</div> &nbsp;&nbsp;
					
						<div class="mainGroup test ani">
								<div class="groupView_top test">
									<img id="logo4" src="resources/images/main/culture.jpeg"
													width="100%" height="100%"/></div>
								<div class="groupView_bot test">가입한 모임 정보3</div>
						</div> &nbsp;&nbsp;
					
						<div class="mainGroup test ani">
								<div class="groupView_top test">
									<img id="logo4" src="resources/images/main/culture.jpeg"
													width="100%" height="100%"/></div>
								<div class="groupView_bot test">추천 모임 정보1</div>
						</div> &nbsp;&nbsp;	
					</div>
				
				<div class="carousel-item">
						<div class="mainGroup test ani">
							<div class="groupView_top test">
									<img id="logo4" src="resources/images/main/play.jpg"
													width="100%" height="100%"/></div>
							<div class="groupView_bot test">가입한 모임 정보4</div>
						</div> &nbsp;&nbsp;
						<div class="mainGroup test ani">
								<div class="groupView_top test">
										<img id="logo4" src="resources/images/main/play.jpg"
														width="100%" height="100%"/></div>
								<div class="groupView_bot test">가입한 모임 정보5</div>
						</div> &nbsp;&nbsp;
						<div class="mainGroup test ani">
								<div class="groupView_top test">
										<img id="logo4" src="resources/images/main/play.jpg"
														width="100%" height="100%"/></div>
								<div class="groupView_bot test">가입한 모임 정보6</div>
						</div> &nbsp;&nbsp;
						<div class="mainGroup test ani">
								<div class="groupView_top test">
										<img id="logo4" src="resources/images/main/play.jpg"
														width="100%" height="100%"/></div>
								<div class="groupView_bot test">가입한 모임 정보7</div>
						</div> &nbsp;&nbsp;
				</div>
				<div class="carousel-item">
						<div class="mainGroup test ani">
								<div class="groupView_top test">
										<img id="logo4" src="resources/images/main/global.jpeg"
														width="100%" height="100%"/></div>
								<div class="groupView_bot test">가입한 모임 정보8</div>
						</div> &nbsp;&nbsp;
						<div class="mainGroup test ani">
								<div class="groupView_top test">
										<img id="logo4" src="resources/images/main/global.jpeg"
														width="100%" height="100%"/></div>
								<div class="groupView_bot test">가입한 모임 정보9</div>
						</div> &nbsp;&nbsp;
						<div class="mainGroup test ani">
								<div class="groupView_top test">
										<img id="logo4" src="resources/images/main/global.jpeg"
														width="100%" height="100%"/></div>
								<div class="groupView_bot test">가입한 모임 정보10</div>
						</div> &nbsp;&nbsp;
						<div class="mainGroup test ani">
								<div class="groupView_top test">
										<img id="logo4" src="resources/images/main/global.jpeg"
														width="100%" height="100%"/></div>
								<div class="groupView_bot test">가입한 모임 정보11</div>
						</div> &nbsp;&nbsp;
				</div>
			</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators1" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators1" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
	<script>
		$('.plusGroup').on('click',function(){
			location.href='${pageContext.request.contextPath}/groups/createGroup.do';
		});
	</script>
	<br><br>
	
		<!-- 주제별 테마 -->
		<div class="d-flex justify-content-center"><b>주제별 테마</b></div>
	<br><br>
		<div class="container d-flex justify-content-center">
			<div class="mainGroup test d-flex justify-content-center align-items-center theme ani">
				<img src="resources/images/main/lifestyle.jpeg" 
					style="width: 100%; height:100%; vertical-align: middle; position:relative; opacity: 0.7;"/>
				<b class="themeContent" style="position:absolute;">#라이프스타일</b> 
			</div>&nbsp;&nbsp;
			<div class="mainGroup test d-flex justify-content-center align-items-center theme ani">
				<img src="resources/images/main/global.jpeg" 
					style="width: 100%; height:100%; vertical-align: middle; position:relative; opacity: 0.7;"/>
				<b class="themeContent" style="position:absolute;">#영어/외국어</b>
			</div>&nbsp;&nbsp;
			<div class="mainGroup test d-flex justify-content-center align-items-center theme ani">
				<img src="resources/images/main/computer.jpg" 
					style="width: 100%; height:100%; vertical-align: middle; position:relative; opacity: 0.7;"/>
				<b class="themeContent" style="position:absolute;">#컴퓨터</b>
			</div>&nbsp;&nbsp;
			<div class="mainGroup test d-flex justify-content-center align-items-center theme ani">
				<img src="resources/images/main/culture.jpeg" 
					style="width: 100%; height:100%; vertical-align: middle; position:relative; opacity: 0.7;"/>
				<b class="themeContent" style="position:absolute;">#디자인/미술</b>
			</div>&nbsp;&nbsp;
			<div class="mainGroup test d-flex justify-content-center align-items-center theme ani">
				<img src="resources/images/main/company.jpeg" 
					style="width: 100%; height:100%; vertical-align: middle; position:relative; opacity: 0.7;"/>
				<b class="themeContent" style="position:absolute;">#취업</b>
			</div>&nbsp;&nbsp;
		</div>
	<br>
		<div class="container d-flex justify-content-center">
			<div class="mainGroup test d-flex justify-content-center align-items-center theme ani">
				<img src="resources/images/main/play.jpg" 
					style="width: 100%; height:100%; vertical-align: middle; position:relative; opacity: 0.7;"/>
				<b class="themeContent" style="position:absolute;">#음악/공연</b>
			</div>&nbsp;&nbsp;
			<div class="mainGroup test d-flex justify-content-center align-items-center theme ani">
				<img src="resources/images/main/sports.jpg" 
					style="width: 100%; height:100%; vertical-align: middle; position:relative; opacity: 0.7;"/>
				<b class="themeContent" style="position:absolute;">#스포츠</b>
			</div>&nbsp;&nbsp;
			<div class="mainGroup test d-flex justify-content-center align-items-center theme ani">
				<img src="resources/images/main/buty.jpg" 
					style="width: 100%; height:100%; vertical-align: middle; position:relative; opacity: 0.7;"/>
				<b class="themeContent" style="position:absolute;">#뷰티/미용</b>
			</div>&nbsp;&nbsp;
			<div class="mainGroup test d-flex justify-content-center align-items-center theme ani">
				<img src="resources/images/main/game.jpeg" 
					style="width: 100%; height:100%; vertical-align: middle; position:relative; opacity: 0.7;"/>
				<b class="themeContent" style="position:absolute;">#게임</b>
			</div>&nbsp;&nbsp;
			<div class="mainGroup test d-flex justify-content-center align-items-center theme ani">
				<img src="resources/images/main/go.jpg" 
					style="width: 100%; height:100%; vertical-align: middle; position:relative; opacity: 0.7;"/>
				<b class="themeContent">검색 바로가기</b>
				</div>&nbsp;&nbsp;
		</div>

		<br><br><br>
	<!-- // 메인부분 // -->
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>