<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${root}/resources/js/common/jquery-3.3.1.min.js"></script>
<title>이용안내</title>
<style>
/* 이용안내 */

#footerCategory{
    font-size: 18px;
}

.testdiv{
    height: 400px;
}

.guideCate{
    width:33.3%;
    height: 60px;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<!-- // 바디부분 // -->
	<hr>
    <div class="container" id="footerCategory">
        <div class="row">
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center"><b>서비스소개</b></div>
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center"><b>개인정보 취급방침</b></div>
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center"><b>이용안내</b></div>
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center"><b>연락처 및 지도</b></div>
        </div>
    </div>
    <hr>
    <br>
    <div class="container test testdiv">
        <hr>
        <div class="row">
            <div class="guideCate test d-flex justify-content-center align-items-center"><h5>자주묻는 질문</h5></div>
            <div class="guideCate test d-flex justify-content-center align-items-center"><h5>이용 관련</h5></div>
            <div class="guideCate test d-flex justify-content-center align-items-center"><h5>신고 관련</h5></div>
        </div>
        <br>
        <div class="test">
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
</html>