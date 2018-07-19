<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용안내</title>
<style>
/* 이용안내 */

#footerCategory{
    font-size: 18px;
}

.cursorPo{
	cursor: pointer;
}

.testdiv{
    height: 400px;
}

.guideCate{
    width:33.3%;
    height: 60px;
    text-align: center;
    padding: 20px;
    cursor:pointer;
}

.gage1{
	background-color:lightgray;
	height: 5px;
}
.gage2{
	background-color:lightgray;
	height: 5px;
}
.gage3{
	background-color:lightgray;
	height: 5px;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<!-- // 바디부분 // -->
	<hr>
    <div class="container" id="footerCategory">
        <div class="row">
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center">
            <b class="cursorPo" id="serviceInfo">서비스소개</b></div>
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center">
            <b class="cursorPo" id="personalInfo">개인정보 취급 방침</b></div>
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center">
            <b class="cursorPo" id="useGuide" style="color:skyblue;">이용안내</b></div>
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center">
            <b class="cursorPo" id="maps">연락처 및 지도</b></div>
        </div>
    </div>
    <hr>
    <br>
    <div class="container testdiv">
        <hr>
        <div class="row">
            <div class="guideCate justify-content-center" id="qna">
            <h5>자주묻는 질문</h5>
            <div class="gage1"></div>
            </div>
            <div class="guideCate justify-content-center" id="guide">
            <h5>이용 관련</h5>
            <div class="gage2"></div>
            </div>
            <div class="guideCate justify-content-center" id="declare">
            <h5>신고 관련</h5>
            <div class="gage3"></div>
            </div>
        </div>
        <br>
        <!-- 컬랩스 부분 -->
        <div>
                <div id="accordion" role="tablist">
                        <div class="card">
                          <div class="card-header" role="tab" id="headingOne">
                            <h5 class="mb-0">
                              <a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                01 사이트에 치명적인 오류나 건의사항이 있어요
                              </a>
                            </h5>
                          </div>
                      
                          <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                            <div class="card-body">
                              없어!! 그냥써라
                            </div>
                          </div>
                        </div>
                        <br>
                        <div class="card">
                          <div class="card-header" role="tab" id="headingTwo">
                            <h5 class="mb-0">
                              <a class="collapsed" data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                02 부적절한 게시글을 발견했습니다. 어떻게 해야하나요?
                              </a>
                            </h5>
                          </div>
                          <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion">
                            <div class="card-body">
                                없어!! 그냥써라
                            </div>
                          </div>
                        </div>
                        <br>
                        <div class="card">
                          <div class="card-header" role="tab" id="headingThree">
                            <h5 class="mb-0">
                              <a class="collapsed" data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                03 프로필 변경하고 싶어요
                              </a>
                            </h5>
                          </div>
                          <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
                            <div class="card-body">
                                없어!! 그냥써라
                            </div>
                          </div>
                        </div>
                      </div>
        </div>
    </div>
    

	<!-- // 바디부분 // -->
    <br><br><br>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	$('#qna').on('click',function(){
		$('.gage1').css("background-color","skyblue");
		$('.gage2').css("background-color","lightgray");
		$('.gage3').css("background-color","lightgray");
	});
	$('#guide').on('click',function(){
		$('.gage1').css("background-color","lightgray");
		$('.gage2').css("background-color","skyblue");
		$('.gage3').css("background-color","lightgray");
	});
	$('#declare').on('click',function(){
		$('.gage1').css("background-color","lightgray");
		$('.gage2').css("background-color","lightgray");
		$('.gage3').css("background-color","skyblue");
	});
</script>
</html>