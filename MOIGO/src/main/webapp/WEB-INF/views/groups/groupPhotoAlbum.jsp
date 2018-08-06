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
	
	.btn:focus, .btn:active:focus, .btn.active:focus {
   		box-shadow: none !important;
   		outline: none !important;
	}
	
	/* 사진첩 부분 */
	.gpa_btn_wrap {
		float : right;
	}
	
</style>
<title>사진첩</title>
</head>
<body>
<div class="container">
   <div class="row">
     
     <c:import url="/WEB-INF/views/groups/leftAside.jsp"/>
     <c:import url="/WEB-INF/views/groups/mapModal.jsp" />
     <c:import url="/WEB-INF/views/groups/scheduleModal.jsp" >
			<c:param name="groupNo" value="${groupNo }" />
			<c:param name="memberNo" value="${gm.memberNo}" />
			<c:param name="memberGrade" value="${memberGrade}" />
		</c:import>
     
     <div class="col-7">
        <div class="card">
           <div class="card-header" >           
              <p class="group_tit">사진첩</p>
              <div class="gpa_btn_wrap">
	              <button type="button" class="btn btn-primary btn-sm">사진올리기</button>
	              <button type="button" class="btn btn-danger btn-sm">삭제</button>
              </div>
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
   
   /*밀리세컨드를 data 객체로 가져오기  */
	function milisecToDate(milisecondData){
		
		if(milisecondData==null)
			return null;
		
		var date = new Date(milisecondData);
		
		return date;
	}  
   
</script>
</body>
</html>