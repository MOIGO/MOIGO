<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> 
<script src="${root}/resources/js/common/jquery-3.3.1.min.js"></script>
<script src="${root}/resources/js/common/fontfaceobserver.js"></script>
<link rel="stylesheet" href="${root}/resources/css/bootstrap/bootstrap.min.css"> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="${root}/resources/js/bootstrap/bootstrap.min.js" ></script>	




<link rel="stylesheet" href="${root}/resources/css/admin/sidNav.css" type="text/css">


<style type="text/css">

</style>
 
</head>
<div class="wrapper">
        <!-- Sidebar Holder -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h2>${pageName}</h2>
               
            </div>
			<hr>
            <ul class="list-unstyled components">
                
                <li >
                    <a href="${pageContext.request.contextPath}/adminHome.ad">DashBoard</a>
                </li>
                <li class="#">
                    <a href="${pageContext.request.contextPath}/adminAnalytics.ad">Analytics</a>
                </li>
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Managing</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="${pageContext.request.contextPath}/adminGroup.ad">Groups</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/adminMember.ad">Members</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/adminReport.ad">Report</a>
                </li>

            </ul>
			<hr>
           
        </nav>

        <!-- Page Content Holder -->
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button type="button" id="sidebarCollapse" class="navbar-btn">
                        <span></span>
                        <span></span>
                        <span></span>
                    </button>
                   <!--  <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button> -->

                    <div class="admin_name" id="adminName">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">Logout</a>
                            </li>
                          
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="row">
            
            
            </div>
   

    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
                $(this).toggleClass('active');
            });
        });
    </script>
</body>

</html>