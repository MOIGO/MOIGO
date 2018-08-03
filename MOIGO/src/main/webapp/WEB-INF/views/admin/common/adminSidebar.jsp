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

<!-- test 신고 모달  -->
<!--  <span type="button" class="btn btn-primary" id="reportingButton" data-toggle="modal" data-target="#reportingModal" data-reporter="ㄹㄹ" data-mtarget="ㄴㄴ">
			Launch demo modal
</span> -->

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
                <div class="container-fluid text-center">
                    <button type="button" id="sidebarCollapse" class="navbar-btn">
                        <span></span>
                        <span></span>
                        <span></span>
                    </button>
                  <span id="pctime">   </span>
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
        
    
        /***** date() 내장함수 사용시 표기 예제 **********************/
        /* now.toUTCString() =  Thu, 22 Jan 2009 00:57:25 UTC */
        /* now.toGMTString() =  Thu, 22 Jan 2009 00:57:25 UTC */
        /* now.toString() =  Thu Jan 22 09:57:25 UTC+0900 2009 */
        /* now.toDateString() =  Thu Jan 22 2009 */
        /* now.toTimeString() =  09:57:25 UTC+0900 */
        /* now.toLocaleString() =  2009년 1월 22일 목요일 오전 9:57:25 */
        /* now.toLocaleDateString() =  2009년 1월 22일 목요일 */
        /* now.toLocaleTimeString() =  오전 9:57:25  */
        /***** date() 내장함수 사용시 표기 예제 **********************/
         var today = new Date(); // 날자 변수 선언
         var dateNow = today.getDate(); // 로컬 컴퓨터의 일(day)을 구함
         var monthNow = today.getMonth(); // 로컬 컴퓨터의 월(month)을 구함
         var yearNow = today.getYear(); // 로컬 컴퓨터의 년(year)을 구함
         
        var clockActive=1;
        var timerID=0;
        var alternate=0
        var timerID2=0;
         
        function curPcTime(){
            var dataTime = new Date();
            var y = dataTime.getFullYear(); // 년도 가져오기
            var m = dataTime.getMonth()+1; // 월 가져오기 (+1)
            var d = dataTime.getDate(); // 날짜 가져오기
            var h = dataTime.getHours(); // 시간 가져오기
            var i = dataTime.getMinutes(); // 분 가져오기
            var s = dataTime.getSeconds(); // 초 가져오기
         
            if (m < 10) m="0"+m;
            if (d < 10) d="0"+d;
            if (h < 10) h="0"+h;
            if (i < 10) i="0"+i;
            if (s < 10) s="0"+s;
         
            if (alternate==0) {
                document.getElementById("pctime").innerHTML ="TODAY\r<br>"+ y+"."+m+"."+d+" "+h+":"+i+":"+s;
            } else {
                document.getElementById("pctime").innerHTML = "TODAY\r<br>"+y+"."+m+"."+d+" "+h+":"+i+":"+s;
            }
         
            alternate=(alternate==0)? 1 : 0;
            timerID2 = setTimeout("curPcTime()",1000);
        }
        window.onload = function(){ 
          
            curPcTime();
        }
        
        
        $('#reportingButton').on('click',function(){
        	$("#accuseTarget").val($(this).data('mtarget'));
        	$("#accuseReporter").val($(this).data('reporter'));
   
        });
        


		//신고 모달 관련 스크립트

        $('#reportSubmit').on('click',function(){
        	var data =$("input[name=reportRadios]").val() +" | "+$("select[name=myList]").val();
        	var data2 =$("#accuseTarget").val();
        	var data3 =$("#accuseReporter").val();
        	
        	console.log(data+data2+data3);
            $.ajax({
                type: 'post', 
                url: "${pageContext.request.contextPath}/reporting.ad", 
                data : {data : data, data2: data2},
                success : function(data){
        		alert("성공"); 
                }
            });
        });



        function Activity(name, list){
            this.name = name;
            this.list = list;
        }

        var acts = new Array();
        	acts[0] = new Activity('폭력적 또는 혐오스러운 콘텐츠', ['세부 신고 항목 선택','청소년 폭력물', '성인 폭력물', '동물 학대','신체적 공격']);
        	acts[1] = new Activity('증오 또는 악의적인 콘텐츠', ['세부 신고 항목 선택','증오심 또는 폭력 조장', '사회적 약자 학대', '괴롭힘','악의적인 내용']);
        	acts[2] = new Activity('스팸 또는 과장된 광고 콘텐츠', ['세부 신고 항목 선택','대량광고', '의약품 판매', '현혹하는 텍스트','현혹하는 이미지']);
        	acts[3] = new Activity('권리침해', ['세부 신고 항목 선택','내 저작권을 침해함', '내 개인정보를 침해함', '기타 법적 문제']);
        	acts[4] = new Activity('아동학대', ['세부 신고 항목 선택','상해','언어폭력','기타 모욕적인 행위']);
        	acts[5] = new Activity('기타', []);
        function updateList(str){
            var frm = document.myForm;
            var oriLen = frm.myList.length;
            var numActs;
            
            for (var i = 0; i < acts.length; i++){

                if (str == acts[i].name) {
                    numActs = acts[i].list.length;
                    for (var j = 0; j < numActs; j++)
                        frm.myList.options[j] = new Option(acts[i].list[j],
        				acts[i].list[j]);
                    for (var j = numActs; j < oriLen; j++)
        				frm.myList.options[numActs] = null;
                }
            }
            if($(".myList").css("display") == "none"){   
                jQuery('.myList').css("display", "block");   
            }
        }

    </script>
    
    
    
    
</body>

</html>