<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<%-- 
<script src="${root}/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${root}/resources/css/bootstrap/bootstrap.min.css"> 
<script src="${root}/resources/js/bootstrap/bootstrap.min.js" ></script>	
<link rel="stylesheet" href="${root}/resources/css/common/fonts.css" > 
--%>
<style>
	.bolder_text{
		font-weight: bolder;
	}
</style>
</head>

<body>
	
<div class="col-3">
 	<div class="card">
		<img class="card-img-top" src="http://via.placeholder.com/300x300"
			alt="Card image cap">
		<div class="card-body">
			<div class="row">
				<h3 class="card-title groupName bolder_text lead">Moigo Official</h3>
			</div>
			<div class="row">
				<button class="btn btn-block">가입하기</button>
			</div>
			<div class="row mt-3">
				<p class="card-text groupDesc">테스트 그룹입니다.</p>
			</div>
			<div class="row mt-3 justify-content-start">
				<div class="col-4 ">
					멤버: <span class="group_memNum">6명</span>
				</div>
				<div class="col-5">
					리더 : <span class="group_leader ">홍길동</span>
				</div>
			</div>
			
			<div class="row mt-3 justify-content-start">
				<div class="col-4 ">
					멤버: <span class="group_memNum">6명</span>
				</div>
				<div class="col-5">
					<i class="fas fa-plus-circle"></i> 그룹 초대
				</div>
			</div>
			
			<div class="row">
				
			</div>
			
		</div>
	</div>
	<br />
	<div>
		<ul class="list-group">
			<li class="list-group-item"><i class="fas fa-book mr-2"></i><span>전체글</span></li>
			<li class="list-group-item"><i class="far fa-images mr-2"></i><span>사진첩</span></li>
			<li class="list-group-item"><i class="far fa-calendar-alt mr-2"></i><span>일정</span></li>
			<li class="list-group-item"><i class="fas fa-users mr-2"></i><span>멤버</span></li>		
		</ul>
	</div>
	<hr />
	<div class="d-flex justify-content-end">
		<i class="fas fa-cog"></i><span>그룹 설정</span>
	</div>
 </div>
</body>

<script>

</script>

</html>

