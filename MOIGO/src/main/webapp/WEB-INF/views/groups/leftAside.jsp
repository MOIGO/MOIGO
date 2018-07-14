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

</head>

<body>
	
<div class="col-3">
 	<div class="card">
		<img class="card-img-top" src="http://via.placeholder.com/300x300"
			alt="Card image cap">
		<div class="card-body">
			<h5 class="card-title groupName">Moigo Official</h5>
			<p class="card-text groupDesc">테스트 그룹입니다.</p>
			<div class="test row">
				<div class="col-4 mr-auto">
					<span class="memNumWrap col-2 test">멤버:</span><span class="memberNum col-2 offset-8" >2</span>
				</div>
				<button class="btn btn-primary btn-sm col-2">가입신청</button>
			</div>
		</div>
	</div>
 </div>
</body>

<script>

</script>

</html>

