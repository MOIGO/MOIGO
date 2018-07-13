<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
</head>
<body>
<c:import url="common/adminSidebar.jsp"></c:import>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav hidden-xs">
	  <br>
      <h2 style="text-align: center;">${pageName}</h2>
      <div>
	      
		      <span class="navbar-toggler-icon">   
			      <button type="button" class="btn btn-default">
			    	  <i class="fa fa-navicon" style="font-size: 30px;"></i>
			      </button>
		      </span>
	      
      </div>
      <br>
      <br>
      <hr class="admin_hr"><br>
    

      
      <ul class="nav nav-pills nav-stacked blue adim_navbar">
        <li ><a href="${pageContext.request.contextPath}/adminHome.ad" class="btn btn-default">Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/adminAnalytics.ad" class="btn btn-default">Analytics</a></li>
        <li><a href="${pageContext.request.contextPath}/adminGroup.ad" class="btn btn-default">Group</a></li>
        <li><a href="${pageContext.request.contextPath}/adminReport.ad" class="btn btn-default">Report</a></li>
      </ul><br>
    </div>
    <br>
</div>
</div>
</body>
</html>