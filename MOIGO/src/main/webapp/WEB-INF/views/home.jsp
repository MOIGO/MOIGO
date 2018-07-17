<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!   
</h1>

<P>  The time on the server is ${serverTime}. </P>

	<ul>
		<li>${m.memberNo}</li>
		<li>${m.memberEmail}</li>		
		<li>${m.memberPwd}</li>		
		<li>${m.memberAddress}</li>		
		<li>${m.memberBirth}</li>		
		<li>${m.memberGender}</li>		
		<li>${m.enrollDate}</li>
		<li>${m.delflag}</li>					
	</ul>

</body>
</html>
