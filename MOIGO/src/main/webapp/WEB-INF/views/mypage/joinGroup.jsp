<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/myPage_custom.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body  >
   
   <c:import url="/WEB-INF/views/common/header.jsp"></c:import>
        <br><br>



    <div class="container" >
         <div class="col-md-9" style="float:none; margin:0 auto;">
            <h2>마이페이지</h2>
            <ul class="nav nav-tabs nav-justified" >
                <li class="nav-item"><a  class="nav-link  letter_space " href="${pageContext.request.contextPath}/mypage/profile.do">회원정보</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/changePwd.do">비밀번호 변경</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/Group.do?gType=open">주최모임</a></li>
                <li class="nav-item"> <a class="nav-link letter_space active" href="${pageContext.request.contextPath}/mypage/Group.do?gType=join">참여모임</a></li>
                <li  class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/Group.do?gType=wait">가입 대기 중</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/withdrawal.do">회원탈퇴</a></li>
            </ul>
        </div>
        <br>
            
         <!-- style="float:none; margin:0 auto;"  -->
        <div class="col-md-9 content_box_wrap " style="float:none; margin:0 auto;" >
            <h5><i class="fas fa-user-friends"></i> 참여모임</h5> 
            <div class="groupList_box col-md-12 row">
                <c:if test="${empty list}">
                	<div class="jumbotron col-12" style="text-align:center; ">
         				<h3>모임정보가 없습니다.</h3> 
         				<button class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/search/selectList.do?keyword=&place=&category=&sort=newSort'">모임 찾기</button>
         			</div>
                </c:if>
                <c:if test="${! empty list}">
	                <c:forEach items="${list }" var="group">
	                  <div class="groupList_item col-xl-3 col-sm-6 col-12 " >
	                      <div class="item_content" id="${group.groupNo }">
	                      <%-- <input type="hidden" value="${group.groupNo }" name="groupNo"> --%>
	                          <div class="header_bg" >
	                         		<img alt="" src="${group.groupPicture }" style="width:100%; height:100%;">
	                          		<%-- <span style="position:absolute; right:20px; top:2px;color:yellow"><c:out value="${group.groupGrade }"/></span> --%>
	                          </div>
	                          
	                           <div class="body_text_container">
	                             <div class="body_text">
	                                 <div class="body_title"><c:out value="${group.groupName }"/> </div>
	                                 	<div class="body_member" >멤버 : <c:out value="${group.memberNum }"/> 명   &nbsp;&nbsp;&nbsp; 게시글 : <c:out value="${group.postNum }"/> 개</div> 
	                                 	<%-- <span class="icon-container float-right" style="position:absolute; right:20px; bottom:2px;"> 
			                               <span class="memberIcon"><c:out value="${group.memberNum }"/> <img alt="memberIcon" src="${pageContext.request.contextPath }/resources/images/search/memberCountIcon.png"></span> 
			                              <span class="commentIcon"><c:out value="${group.postNum }"/> <img alt="commentIcon" src="${pageContext.request.contextPath }/resources/images/search/commentIcon.png"></span>
			                           </span> --%>
	                             </div>
	                         </div>
	                      </div>
	                  </div>
	                 </c:forEach>
                </c:if>
            
            </div>
        </div>
    </div>

    <br><br><br><br>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
    <script >
    $(function(){
    	   $(".item_content").on("click",function(){
    	      var groupNo = $(this).attr("id");
    	       location.href = "${pageContext.request.contextPath}/groups/groupMain.gp?groupNo="+groupNo; 
    	   });
    	});
    </script>
</body>
</html>