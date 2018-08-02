<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" >
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<style>

   body{
      background: #EDEFF2;
   }
   
   .card, .card-header{
   		background:white;
   }
   
	.group_tit {
		float : left;
		margin-bottom: 0px;
		font-family: 'nanum-barun-gothic-bold', sans-serif;
		font-size: 1.3em;
	}

	.group_tit:hover {
	cursor: default;
	}
	
</style>
<title>사진첩</title>
</head>
<body>
<div class="container">
   <div class="row">
     
     <c:import url="/WEB-INF/views/groups/leftAside.jsp"/>
     
     <div class="col-7">
        <div class="card">
           <div class="card-header" >           
              <p class="group_tit">사진첩</p>
           </div>
            <div class="card-body" >
           </div>
        </div>
     </div>
     
     <c:import url="/WEB-INF/views/groups/rightAside.jsp"/>
    
   </div>
</div>

<script>

   $(function() {
    
      
		
   });
   
</script>
</body>
</html>