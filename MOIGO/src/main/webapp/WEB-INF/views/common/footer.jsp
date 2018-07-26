<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* 풋터 */
#footerBar {
	background-color: #303233;
	height: 200px;
}

.footerMenu { 
	color: white;
	display: inline-block;
	margin-top: 15px;
}
  
.footerMenu:hover {
	cursor: pointer;
}

.footerInfo{
	color: white;
	margin-top: 10px;
}

.ani:hover{
	cursor: pointer;
	transform: translateY(-10px);
	box-shadow: 5px 5px 5px black;
}

</style>
</head>
<body>
<!-- // 풋터부분 // -->

	<div class="container-fluid" id="footerBar">
		<div class="cotainer d-flex justify-content-center">
			<div class="col-sm-2 col-md-2 col-lg-2"></div>
			<div class="d-flex justify-content-center align-items-center footerMenu
						col-sm-2 col-md-2 col-lg-2 footcate" id="serviceInfo">서비스소개
						<input type="hidden" value="ser"/></div> &nbsp;&nbsp;
			<div class="d-flex justify-content-center align-items-center footerMenu
						col-sm-2 col-md-2 col-lg-2 footcate" id="personalInfo">개인정보 취급방침
						<input type="hidden" value="per"/></div> &nbsp;&nbsp;
			<div class="d-flex justify-content-center align-items-center footerMenu
						col-sm-2 col-md-2 col-lg-2 footcate" id="useGuide">이용안내
						<input type="hidden" value="guid"/></div> &nbsp;&nbsp;
			<div class="d-flex justify-content-center align-items-center footerMenu
						col-sm-2 col-md-2 col-lg-2 footcate" id="maps">연락처 및 지도
						<input type="hidden" value="ma"/></div> &nbsp;&nbsp;
			<div class="col-sm-2 col-md-2 col-lg-2"></div>
		</div>
		<hr>
		<div class="cotainer d-flex justify-content-center">
			<div class="footerInfo">
				<div class="col-sm-12 col-md-12 col-lg-12">
					<p class="col-lg-12">법인명 : 모이고  | 대표이사 :  박태영  | 사업장 소재지 :  서울시 강남구 역삼동 KH정보교육원  | 사업자등록번호 : 132-78-56215 | 사업자정보확인 </p>
		
					<p class="col-lg-12">통신판매업신고 : 제2013-서울강남-0521호  | 개인정보보호책임자 :  이원제 | 고객센터 :  02-2222-2222
											| 팩스 : 02-2222-2222| E-mail : moigo@moigo.com</p>
					<p class="col-lg-12">Hosting by (주)코리아센터닷컴</p>
				</div>
				
				<div class="col-sm-3 col-md-3 col-lg-2"></div>
			</div>
		</div>
	</div>


	<!-- // 풋터부분 // -->
	<br><br><br>
</body>
<script>
	$('.footerMenu').on('click',function(){
		var select = $(this).find('input').val();
		location.href="${pageContext.request.contextPath}/common/footpage.ft?selected="+select; 
		
	});
	
	
</script>
</html>