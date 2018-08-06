<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="jg" value="${joingroup}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <script src="${root}/resources/js/common/jquery-3.3.1.min.js"></script> --%>
<title>모이고 홈페이지</title>
<style>
/* 메인 */
.carousel-inner img {
	margin: auto;
}

.jgroup{
	width: 1110px;
	height: 200px;
}

.maincarou{
	width: 1200px;
	height: 600px;
}
.maincarou:hover{
	cursor: pointer;
}

#joingroups{
	width: 832px;
	height: 200px;
}
.mainGroup {
	display: inline-block;
	width: 200px;
	height: 200px;
}

.groupView_top {
	display: block;
	width: 200px;
	height: 120px;
}

.groupView_bot {
	display: block;
	width: 200px;
	height: 80px;
}

.themeContent {
	position: absolute;
	color: black;
	font-size: 18px;
}

.title{
	white-space: nowrap;
    /* word-break: break-word; */
    overflow: hidden;
    text-overflow: ellipsis;
}
@media all and (max-width: 1200px) { /* #carouselExampleIndicators1 {
		position: absolute;
		width: 1200px;
	}
	.carousel {
		position: absolute;
	}
	.mainGroup test ani {
		position: absolute;
		width: 300px;
	} */
}

.maintagFont{
	position:absolute; 
	left: 300px;
	z-index:1800;
	color: snow;
	font-weight: bold;
}
</style>
</head>
<body onload="start()">
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<!-- // 메인부분 // -->
	
	<br>
	<br>
	<!-- 케러셀 부분(광고 또는 안내배너) -->
	<div class="container">
		<div id="carouselExampleIndicators" class="carousel slide proq"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active maincarou">
				<input type="hidden" value="역사" />
				<h3 class="maintagFont" style="top: 150px;">#역사</h3>
				<h3 class="maintagFont" style="top: 200px;">#한국사</h3>
				<h3 class="maintagFont" style="top: 250px;">#세계사</h3>
				<h3 class="maintagFont" style="top: 300px;">#지리</h3>
				<img class="d-block w-60" src="resources/images/main/history.jpg"
						alt="First slide" style="width: 100%; height: 100%; vertical-align: middle; position: relative; opacity: 1;">
					
					
				</div>
				<div class="carousel-item maincarou">
				<input type="hidden" value="일본" />
				<h3 class="maintagFont" style="top: 150px;">#일본</h3>
				<h3 class="maintagFont" style="top: 200px;">#J-POP</h3>
				<h3 class="maintagFont" style="top: 250px;">#일본드라마</h3>
				<h3 class="maintagFont" style="top: 300px;">#일본어</h3>
					<img class="d-block w-60" src="resources/images/main/japan.jpg"
						alt="Second slide" style="width: 100%; height: 100%; vertical-align: middle; position: relative; opacity: 1;">
					
				</div>
				<div class="carousel-item maincarou">
				<input type="hidden" value="영화" />
				<h3 class="maintagFont" style="top: 150px;">#영화</h3>
				<h3 class="maintagFont" style="top: 200px;">#할리우드</h3>
				<h3 class="maintagFont" style="top: 250px;">#국내영화</h3>
				<h3 class="maintagFont" style="top: 300px;">#해외영화</h3>
					<img class="d-block w-60" src="resources/images/main/movie.jpg"
						alt="Third slide" style="width: 100%; height: 100%; vertical-align: middle; position: relative; opacity: 1;">
					
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<br>
	<br>

	<!-- 내가 가입한 모임 -->
	<div class="d-flex justify-content-center">
		<c:choose>
		<c:when test="${m eq null}"><b>가장 활발한 모입 추천</b>
		</c:when>
		<c:otherwise><b>내가 가입한 모입</b></c:otherwise>
		</c:choose>
	</div>
	<br>
	<br>
	<div class="container">
		<div class="container row jgroup">
			<div
				class="mainGroup test d-flex justify-content-center align-items-center ani plusGroup"
				style="background-color: skyblue; margin-right: 15px;">
				<a href="#" class="plusGroup"><img id="plus"
					src="resources/images/main/plus.png" width="50" height="50" /> </a>
				&nbsp; 모임 만들기
			</div>
				<c:choose>
				<c:when test="${m eq null}">
				 <div id="recommendList">
				</div> 
				 
				</c:when>
				<c:otherwise>
					<div id="carouselExampleIndicators1" class="carousel slide"
					data-ride="carousel">
						<ol class="carousel-indicators" id="carouselNum">
						</ol>
						
						<div class="carousel-inner" id="joingroups"></div>
					</div>
				</c:otherwise>
				</c:choose>
				
		</div>
	</div>
	<script>
		$('.plusGroup').on('click',function() {
		
			if(${m ne null}){
				location.href = '${pageContext.request.contextPath}/groups/createGroup.gp';
			} else {
				alert("로그인 하신 후 이용 가능합니다.");
				$('#Login_Modal').modal('show');
			}
		});
		
		$('.maincarou').on('click',function(){
			var keyword = $(this).find('input').val();
			location.href="${pageContext.request.contextPath}/search/selectList.do?keyword="+keyword+"&place=&regardlessArea=지역무관&category=&sort=newSort";
		});
	</script>
	<br>
	<br>

	<!-- 주제별 테마 -->
	<div class="d-flex justify-content-center">
		<b>주제별 테마</b>
	</div>
	<br>
	<br>
	<div class="container d-flex justify-content-center topic">
		<div class="mainGroup test d-flex justify-content-center align-items-center theme ani">
			<input type="hidden" value="B001" />
			<img src="resources/images/main/lifestyle.jpeg"
				style="width: 100%; height: 100%; vertical-align: middle; position: relative; opacity: 0.7;" />
			<b class="themeContent" style="position: absolute;">#라이프스타일</b>
		</div>
		&nbsp;&nbsp;
		<div
			class="mainGroup test d-flex justify-content-center align-items-center theme ani">
			<input type="hidden" value="B002" />
			<img src="resources/images/main/global.jpeg"
				style="width: 100%; height: 100%; vertical-align: middle; position: relative; opacity: 0.7;" />
			<b class="themeContent" style="position: absolute;">#영어/외국어</b>
		</div>
		&nbsp;&nbsp;
		<div
			class="mainGroup test d-flex justify-content-center align-items-center theme ani">
			<input type="hidden" value="B003" />
			<img src="resources/images/main/computer.jpg"
				style="width: 100%; height: 100%; vertical-align: middle; position: relative; opacity: 0.7;" />
			<b class="themeContent" style="position: absolute;">#컴퓨터</b>
		</div>
		&nbsp;&nbsp;
		<div
			class="mainGroup test d-flex justify-content-center align-items-center theme ani">
			<input type="hidden" value="B004" />
			<img src="resources/images/main/culture.jpeg"
				style="width: 100%; height: 100%; vertical-align: middle; position: relative; opacity: 0.7;" />
			<b class="themeContent" style="position: absolute;">#디자인/미술</b>
		</div>
		&nbsp;&nbsp;
		<div
			class="mainGroup test d-flex justify-content-center align-items-center theme ani">
			<input type="hidden" value="B005" />
			<img src="resources/images/main/company.jpeg"
				style="width: 100%; height: 100%; vertical-align: middle; position: relative; opacity: 0.7;" />
			<b class="themeContent" style="position: absolute;">#취업</b>
		</div>
		&nbsp;&nbsp;
	</div>
	<br>
	<div class="container d-flex justify-content-center topic">
		<div
			class="mainGroup test d-flex justify-content-center align-items-center theme ani">
			<input type="hidden" value="B006" />
			<img src="resources/images/main/play.jpg"
				style="width: 100%; height: 100%; vertical-align: middle; position: relative; opacity: 0.7;" />
			<b class="themeContent" style="position: absolute;">#음악/공연</b>
		</div>
		&nbsp;&nbsp;
		<div
			class="mainGroup test d-flex justify-content-center align-items-center theme ani">
			<input type="hidden" value="B007" />
			<img src="resources/images/main/sports.jpg"
				style="width: 100%; height: 100%; vertical-align: middle; position: relative; opacity: 0.7;" />
			<b class="themeContent" style="position: absolute;">#스포츠</b>
		</div>
		&nbsp;&nbsp;
		<div
			class="mainGroup test d-flex justify-content-center align-items-center theme ani">
			<input type="hidden" value="B008" />
			<img src="resources/images/main/buty.jpg"
				style="width: 100%; height: 100%; vertical-align: middle; position: relative; opacity: 0.7;" />
			<b class="themeContent" style="position: absolute;">#뷰티/미용</b>
		</div>
		&nbsp;&nbsp;
		<div
			class="mainGroup test d-flex justify-content-center align-items-center theme ani">
			<input type="hidden" value="B009" />
			<img src="resources/images/main/game.jpeg"
				style="width: 100%; height: 100%; vertical-align: middle; position: relative; opacity: 0.7;" />
			<b class="themeContent" style="position: absolute;">#게임</b>
		</div>
		&nbsp;&nbsp;
		<div
			class="mainGroup test d-flex justify-content-center align-items-center theme ani">
			<input type="hidden" value="go" />
			<img src="resources/images/main/go.jpg"
				style="width: 100%; height: 100%; vertical-align: middle; position: relative; opacity: 0.7;" />
			<b class="themeContent">검색 바로가기</b>
		</div>
		&nbsp;&nbsp;
	</div>
	
	<br>
	<br>
	<br>
	<!-- // 메인부분 // -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
<script>

	$('.theme').on('click',function(){
		var sel = $(this).find('input').val();
		if(sel=="go"){
			location.href="${pageContext.request.contextPath}/search/searchList.do?keyword=";	
		} else {
			location.href="${pageContext.request.contextPath}/search/selectList.do?keyword=&place=&category="+sel+"&sort=newSort";	
		}
		
		
	});
	
	function start(){
		
			if(${m ne null}){
				
				var mno = '${m.memberNo}';
				//location.href = "${pageContext.request.contextPath}/common/joingroups.mi?mno="+mno;
				$.ajax({
					url : "${pageContext.request.contextPath}/common/joingroups.mi",
					data : {mno : mno},
					type : "get",
					success : function(data){
						var list = data.list;
						var leng = list.length;
						console.log(leng);
						
						var cnt =0;
						for(var i=0; i<list.length; i++){
							if(i == 0){
								var $li = $('<li data-target="#carouselExampleIndicators" data-slide-to="'+cnt+'" class="active">');
								$('#carouselNum').append($li);
								cnt++;
							}else if(4%i == 1){
								var $li = $('<li data-target="#carouselExampleIndicators" data-slide-to="'+cnt+'">');
								$('#carouselNum').append($li);
								cnt++;
							}
						}
						
						
						for(l in list){
							
							if(l == 0){
								var $div_carsel = $('<div class="carousel-item active">');
								$('#joingroups').append($div_carsel);
							} else if(4%l == 1){
								var $div_carsel = $('<div class="carousel-item">');	
								$('#joingroups').append($div_carsel);
							}
							
							var $div = $('<div class="mainGroup test ani clickme" style="margin-right: 8px;">');
							$div.append('<input type="hidden" value="'+list[l].groupNo+'" />');
							
							
							var $div_top = $('<div class="groupView_top test">');
							var $div_bot = $('<div class="groupView_bot test">');
							$div_top.append($('<img id="logo4" src="moigo/'+list[l].groupImage+'" width="100%" height="100%" />'));
							
							$div_bot.append($('<div class="title">'+list[l].groupName+'</div>'));
							$div_bot.append($('<div class="location">'+list[l].groupAddress+'</div>'));
							var $span = $('<span class="icon-container float-right">');
							$span.append($('<span class="icon-container float-right"> <span class="memberIcon">'+list[l].memberNum+'<img alt="memberIcon" src="${pageContext.request.contextPath }/resources/images/search/memberCountIcon.png"></span>'));
							$span.append($('<span class="commentIcon"> '+list[l].postNum+'<img alt="commentIcon" src="${pageContext.request.contextPath }/resources/images/search/commentIcon.png"></span>'));
							$div_bot.append($span);
							
							$div.append($div_top);
							$div.append($div_bot);
							
							$('#joingroups').append($div);
							
							if(leng > 5){
								var $a_pre = $('<a class="carousel-control-prev" href="#carouselExampleIndicators1" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span></a>');
								var $a_next = $('<a class="carousel-control-next" href="#carouselExampleIndicators1"	role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span></a>');
								$('#carouselExampleIndicators1').append($a_pre);
								$('#carouselExampleIndicators1').append($a_next);
							}
							
							
							$('.clickme').on("click",function(){
								var sel = $(this).children('input').val();
								console.log(sel);
								location.href = "${pageContext.request.contextPath}/groups/groupMain.gp?groupNo="+sel
							});
							
							
						}
						
						
					},
					error : function(data){
						console.log("에러 발생!!");
					}
				});
				
			} else {
				
				$.ajax({
					url : "${pageContext.request.contextPath}/common/recommendgroups.mi",
					type : "get",
					success : function(data){
						var list = data.list;
						
						for(l in list){
							
							var $div = $('<div class="mainGroup test ani clickme" style="margin-right: 8px;">');
							$div.append('<input type="hidden" value="'+list[l].groupNo+'" />');
							
							var $div_top = $('<div class="groupView_top test">');
							var $div_bot = $('<div class="groupView_bot test">');
							$div_top.append($('<img id="logo4" src="moigo/'+list[l].groupImage+'" width="100%" height="100%" />'));
							
							$div_bot.append($('<div class="title">'+list[l].groupName+'</div>'));
							$div_bot.append($('<div class="location">'+list[l].groupAddress+'</div>'));
							var $span = $('<span class="icon-container float-right">');
							$span.append($('<span class="icon-container float-right"> <span class="memberIcon">'+list[l].memberNum+'<img alt="memberIcon" src="${pageContext.request.contextPath }/resources/images/search/memberCountIcon.png"></span>'));
							$span.append($('<span class="commentIcon"> '+list[l].postNum+'<img alt="commentIcon" src="${pageContext.request.contextPath }/resources/images/search/commentIcon.png"></span>'));
							$div_bot.append($span);
							
							$div.append($div_top);
							$div.append($div_bot);
						
							$('#recommendList').append($div);
							
							
							$('.clickme').on("click",function(){
								var sel = $(this).children('input').val();
								console.log(sel);
								location.href = "${pageContext.request.contextPath}/groups/groupMain.gp?groupNo="+sel
							});
							
							
						}
						
						
					},
					error : function(data){
						console.log("에러 발생!!");
					}
				});
			}
		
	}
	
	
</script>
</html>