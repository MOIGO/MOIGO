<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script src="${root}/resources/js/common/jquery-3.3.1.min.js"></script>
<html>
<head>


</head>


<script>
$(function(){
	alert("가입에 성공하셨습니다.");
	location.href="${pageContext.request.contextPath}/groups/groupMain.gp?groupNo="+'${groupNo}'; 
});
</script>

</html>

