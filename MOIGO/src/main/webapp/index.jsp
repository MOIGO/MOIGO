<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
 
<head>
 
</head>


<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	  
	<form action="${pageContext.request.contextPath}/groups/groupsTest.do">
		<button type="submit">그룹 메인으로 이동</button>
	</form>
	
	<form action="${pageContext.request.contextPath}/groups/createGroup.do">
		<button type="submit">그룹 만들기로 이동</button>
	</form>
	
	<form action="${pageContext.request.contextPath}/groups/groupMember.do">
		<button type="submit">그룹 멤버</button>
	</form>
	
	<form action="${pageContext.request.contextPath}/groups/groupSchedule.do">
		<button type="submit">그룹 일정</button>
	</form>

	<a href="${pageContext.request.contextPath}/adminHome.ad">관리자 페이지로 이동</a>
	
	<br>
	<a href="${pageContext.request.contextPath}/mypage/profile.do">마이페이지 이동</a>

</body>


</html>
