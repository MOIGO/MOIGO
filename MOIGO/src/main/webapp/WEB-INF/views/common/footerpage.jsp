<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=957e8ab378d0238256ca0d11fe001e7a"></script>	
<title>서비스소개</title>
<style>
/* 공통 */
#footerCategory{
    font-size: 18px;
}

.cursorPo{
	cursor: pointer;
}

/* 서비스 소개 */
#si{
    background-color: lightgray;
    height: 200px;
    display: inline-block;
}

.disb{
	display:inline-block;
	border: 1px solid gray;
	border-bottom: none;
	border-top: none;
}

.wit{
	width: 100%;
}

.infocate{
	width: 100%;
	height: 65px;
	text-align: center;
	margin-left: 5px !important;
}

.infocontent{
	position:absolute; 
	text-align: center;
}

/* 개인정보 이용약관 페이지 */
#pi{
    border: 1px solid lightgray;
    padding: 30px;
   
}

.bluecolor{
    color: mediumblue;
}

.picontent{
    color: mediumblue !important;
}
.picontent:hover{
    text-decoration: none !important;
}

.infoFontSize{
    font-size: 13px;
}

.left{
    margin-left: 10px;
}

/* 이용안내 */
/* #usgui{
	display: none;
} */

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
	background-color:skyblue;
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

/* 지도 페이지 */

.textc{
    text-align: center;
}

/* .mapHeight{
	height: 400px;
} */


</style>
</head>
<body onload="test()">
<script>
 function test(){
	
		if('${selected}' == 'ma'){
		$('#map').css("height","400px");
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(37.498960, 127.032940), // 지도의 중심좌표
	        level: 1 // 지도의 확대 레벨
	    };

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(37.498960, 127.032940); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
	  	  position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		}
}
</script>

<c:import url="/WEB-INF/views/common/header.jsp"/>
<!-- // 바디부분 // -->
	<hr>
    <div class="container" id="footerCategory">
        <div class="row">
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center">
            <b class="cursorPo" id="serviceInfo">서비스소개</b>
            </div>
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center">
            <b class="cursorPo" id="personalInfo">개인정보 취급 방침</b>
            </div>
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center">
            <b class="cursorPo" id="useGuide">이용안내</b>
            </div>
            <div class="col-md-3 col-lg-3 d-flex justify-content-center align-items-center">
            <b class="cursorPo" id="maps">연락처 및 지도</b>
            </div>
        </div>
    </div>
    <hr>
    <br>
    
    <!-- 서비스 소개 --> 
    <c:choose>
		<c:when test="${selected ne 'ser'}">
			<div id="servinfo" style="display:none;">
		</c:when>
		<c:otherwise>
			<script>
				$('#serviceInfo').css('color','skyblue');
			</script>
			<div id="servinfo">
		</c:otherwise>
	</c:choose> 
	
    <!-- <div id="servinfo"> -->
    <div class="container-fluid" id="si">
        <div class="row" style="height: 100%;">
            <div class="col-md-3 col-lg-3 disb">
					<div class="infocate d-flex justify-content-center align-items-center">
						<i class="fas fa-exclamation-triangle" style="font-size: 5ex;"></i></div>
					<div class="row infocate d-flex justify-content-center align-items-center">
						<h4 class="wit">새로운 서비스</h4>
						<pre class="wit">모임을 한곳에 모아 누구나 편리하고 <br>쉽게 찾을 수 있습니다.</pre>
					</div>
			</div>
            <div class="col-md-3 col-lg-3 disb">
				<div class="infocate d-flex justify-content-center align-items-center">
					<i class="fas fa-won-sign" style="font-size: 5ex;"></i></div>
				<div class="row infocate d-flex justify-content-center align-items-center">	
					<h4 class="wit">저렴한 가격</h4>
					<pre class="wit">더 이상 모임을 찾느라 돈을 <br>사용하실 필요가 없습니다.</pre>
				</div>
			</div>
            <div class="col-md-3 col-lg-3 disb">
				<div class="infocate d-flex justify-content-center align-items-center">
					<i class="fas fa-users" style="font-size: 5ex;"></i></div>
				<div class="row infocate d-flex justify-content-center align-items-center">	
					<h4 class="wit">다양한 모임</h4>
					<pre class="wit">스터디,핸드메이드,취미생활,<br>스포츠 원하는 모든 모임</pre>
				</div>
			</div>
            <div class="col-md-3 col-lg-3 disb">
				<div class="infocate d-flex justify-content-center align-items-center">
					<i class="fas fa-map-marker-alt" style="font-size: 5ex;"></i></div>
				<div class="row infocate d-flex justify-content-center align-items-center">
					<h4 class="wit">위치기반 검색</h4>
					<pre class="wit">상세 검색 기능과 목적에 <br>맞는 인원 혹은 장소를 <br>지도로 쉽게 볼 수 있도록 지원 </pre>
				</div>
			</div>
        </div>
    </div>
	
	<br><br>

	<div class="container d-flex justify-content-center align-items-center" style="width:1200px; height:600px;">
			<img src="../resources/images/main/running.jpg" 
				style="width: 100%; height:100%; vertical-align: middle; position:relative; opacity: 0.7;"/>
			<div class="infocontent">
			<h2>모임 커넥팅 서비스</h2> <br>
			<p>
				모든 모임들을 한 곳에 모아서 찾아볼 수 있습니다. <br>
				취미,스포츠,외국어 어떤 모임이든 모이고와 함께하세요.
			</p>
			</div>
	</div>
    </div>
    
    <!-- 개인정보 취급방침 -->
    <c:choose>
		<c:when test="${selected ne 'per'}">
			<div class="container" id="pi" style="display:none;">
		</c:when>
		<c:otherwise>
			<script>
				$('#personalInfo').css('color','skyblue');
			</script>
			<div class="container" id="pi">
		</c:otherwise>
	</c:choose>   
    
        <br>
        <h3>개인정보 취급방침</h3>
        <br>
        <b>MOIGO의 개인정보보호정책은 관계법령 규정을 반영하여 다음과 같은 내용을 담고 있습니다.</b>
        <hr>
        <p class="bluecolor">총칙</p> <br>   
        <p class="infoFontSize">MOIGO는 회원님의 개인정보를 중요시하며, 개인정보의 보호와 관련하여 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 및 개인정보 보호법 등 관련법 상의 개인정보 보호 규정을 준수하고 있습니다.
        <br>회사는 개인정보처리방침을 통하여 회원님의 개인정보가 남용되거나 유출되지 않도록 최선을 다할 것이며, 회원님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있고, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.
        <br>회사는 개인정보 처리방침을 홈페이지 첫 화면에 공개함으로써 회원님이 언제나 용이하게 보실 수 있도록 조치하고 있습니다.
        <br>단, 본 개인정보 처리방침은 정부의 법령 및 지침의 변경, 또는 보다 나은 서비스의 제공을 위하여 그 내용이 변경될 수 있으니, 회원님들께서는 홈페이지 방문 시 수시로 그 내용을 확인하여 주시기 바라며, 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.
        </p>
        <br><p class="infoFontSize">[목차]</p> <br>&nbsp;&nbsp;
        0. <a class="picontent" href="#zero">개인정보 수집에 대한 동의</a><br>&nbsp;&nbsp;
        1. <a class="picontent" href="#one">개인정보의 수집 및 이용 목적</a><br>&nbsp;&nbsp;
        2. <a class="picontent" href="#two">개인정보의 보유 및 이용기간</a><br>&nbsp;&nbsp;
        3. <a class="picontent" href="#three">개인정보의 파기절차 및 방법</a><br>&nbsp;&nbsp;
        4. <a class="picontent" href="#four">개인정보의 제3자 제공 및 공유</a><br>&nbsp;&nbsp;
        5. <a class="picontent" href="#five">개인정보의 처리 위탁</a><br>&nbsp;&nbsp;
        6. <a class="picontent" href="#six">회원의 권리와 그 행사방법</a><br>&nbsp;&nbsp;
        7. <a class="picontent" href="#seven">회원의 의무</a><br>&nbsp;&nbsp;
        8. <a class="picontent" href="#eight">링크사이트</a><br>&nbsp;&nbsp;
        9. <a class="picontent" href="#nine">개인정보 자동수집 장치(쿠키 등)의 설치, 운영 및 그 거부에 관한 사항</a><br>
        10. <a class="picontent" href="#ten">개인정보의 기술적/관리적 보호 대책</a><br>
        11. <a class="picontent" href="#eleven">개인정보보호책임자</a><br>
        12. <a class="picontent" href="#twelve">개인정보처리방침의 개정과 그 공지</a><br><hr>
        
        <p class="bluecolor" id="zero">0. 개인정보 수집에 대한 동의</p>
            <p class="infoFontSize left">회사는 이용자들이 회사의 개인정보 취급방침 또는 이용약관의 내용에 대하여 「<b>동의</b>」버튼 또는 「<b>취소</b>」버튼을 클릭할 수 있는 절차를 마련하여, 「<b>동의</b>」버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.</p>
        <p class="bluecolor" id="one">1. 개인정보의 수집 및 이용 목적</p>
            <p class="infoFontSize left">"<b>개인정보</b>"라 함은 생존하는 개인에 관한 정보로, 성명, 이메일 주소, 전화번호 등 개인을 식별할 수 있는 정보를 말합니다<br>
                    대부분의 MOIGO 서비스는 별도의 사용자 등록이 없이 언제든지 볼 수 있습니다.<br>                    
                    그러나 회사는 회원서비스(이벤트 생성과 같이 현재 제공 중이거나 향후 제공될 로그인 기반의 서비스)등을 통하여 이용자들에게 맞춤 식 서비스를 비롯한 보다 더 향상된 양질의 서비스를 제공하기 위하여 이용자 개인의 정보를 수집하고 있습니다. <br>                   
                    회사는 이용자의 사전 동의 없이는 이용자의 개인 정보를 공개하지 않으며, 수집된 정보는 아래와 같이 이용하고 있습니다.
                    <br><br>
                    <b>첫째,</b> 이용자들의 개인정보를 기반으로 보다 더 유용한 서비스를 개발할 수 있습니다. 회사는 신규 서비스개발이나 콘텐츠의 확충 시에 기존 이용자들이 회사에 제공한 개인정보를 바탕으로 개발해야 할 서비스의 우선 순위를 보다 더 효율적으로 정하고, 회사는 이용자들이 필요로 할 콘텐츠를 합리적으로 선택하여 제공할 수 있습니다.
                    <br><br>
                    <b>둘째,</b> 회사가 제공하는 각종 정보 및 서비스 등은 대부분 무료입니다. 회사는 이러한 무료 서비스를 제공하기 위해 광고를 유치할 수 있으며 이때 이용자들에 대한 정확한 개인정보를 바탕으로 각 서비스나 메뉴 등에 적절하게 광고와 내용들을 전달할 수 있습니다. 회사는 광고주들로부터 광고를 받아 광고주들이 대상으로 하려는 이용자의 유형에 맞게 광고를 보여줄 뿐, 광고주들에게는 절대로 이용자들의 개인정보를 보여주거나 제공하지 않습니다.
                    <br><br>
                    <b>셋째,</b> 회사가 제공하는 서비스의 원활한 이용을 위하여 회원은 적법한 동의절차를 거쳐 SNS 업체가 연결을 위한 정보를 회사에 제공하도록 할 수 있습니다. 회사는 연결된 SNS 를 원활한 서비스 제공을 위해 이용자에게서 권한이 허락된 범위 안에서 이를 활용할 수 있으며, 허락되지 않은 범위에 대해서는 절대 활용하지 않습니다. 서비스 이용을 위하여 회원으로부터 추가적인 권한의 요청을 필요로 할 경우, 각 SNS의 인증서비스를 통하여 이에 대한 사전 동의를 반드시 구할 것 입니다.                    
                    <br> <br>               
                    <b>넷째,</b> 회원구분에 따라서 다음의 목적을 위해서 회원정보를 수집, 이용하고 있습니다.
                    <br>                    
                    가. 모든 회원공통
                    필수 : 성명, E-MAIL, 비밀번호, 휴대전화번호, 마이페이지주소<br>
                    선택 : 이용정보 - 성별, 나이, 관심지역, 관심분야, 관심직군, 관심카테고리, 홈페이지, SNS 정보 ( 페이스북, 트위터, 카카오, 구글, 네이버, 다음 )
                    <br>
                    나. 개설자회원 (개인)
                    필수 : 정산정보 - 신분증 사본, 결제 정산용 통장사본
                    <br>
                    다. 개설자회원 (법인)
                    필수 : 기업정보 - 회사명, 회사주소, 회사전화번호, 회사 FAX, 대표자명, 사업자등록번호, 업태, 종목, 담당자 이름, 담당자 E-MAIL, 담당자 휴대전화
                    <br>
                    라. 참석자회원
                    기타 모임개설자가 추가로 요구하는 정보                    
                    <br><br>
                    <b>다섯째,</b> 기타 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다. 
                    <br>    -서비스 이용기록, 접속 로그, 쿠키, 접속IP 정보, 결제기록: 부정 이용 방지, 비인가 사용 방지 등                    
                    <br><br>
                    <b>여섯째,</b> 회원님의 기본적 인권 침해의 우려가 있는 민감정보 (범죄경력, 유전정보 등)를 수집하지 않습니다.                    
                    <br><br>
                    <b>일곱째,</b> 회원님이 제공하신 모든 정보는 상기 목적에 필요한 용도 이외로는 사용되지 않으며, 수집정보의 범위나 사용목적, 용도가 변경될 시에는 반드시 회원님들께 사전동의를 구할 것 입니다.                    
                    <br><br>
                    위 정보는 가입 당시 정보만 아니라 정보수정으로 변경된 정보를 포함 합니다.</p>
        <p class="bluecolor" id="two">2. 개인정보의 보유 및 이용기간</p>
            <p class="infoFontSize left">
                    회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 개인정보를 지체 없이 파기합니다.
                    <br><br>
                    단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존 합니다.<br>
                    - 보존 항목 : 쿠키,세션<br>
                    - 보존 근거 : 회사의 서비스이용약관 및 개인정보취급방침에 동의<br>
                    - 보존 기간 : 로그아웃 시 삭제<br>
                    <br>
                    그리고 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.<br>
                    - 보존 항목 : 이름, E-MAIL, 휴대전화번호, 비밀번호, 이용정보, 정산정보, 기업정보<br>
                    - 보존 근거 : 회사의 서비스이용약관 및 개인정보취급방침에 동의<br>
                    - 보존 기간 : 회원으로서의 자격을 유지하는 동안<br>
                    <br>
                    [기타]
                    <br><br>
                    1) 계약 또는 청약철회 등에 관한 기록<br>
                    - 보존근거: 전자상거래 등에서의 소비자보호에 관한 법률<br>
                    - 보존기간: 5년 <br>
                    ( 모임/행사 참가신청 정보는 계약 정보에 해당 합니다. )<br>
                    <br>
                    2) 대금결제 및 재화 등의 공급에 관한 기록<br>
                    - 보존근거: 전자상거래 등에서의 소비자보호에 관한 법률<br>
                    - 보존기간: 5년
                    <br>
                    3) 소비자의 불만 또는 분쟁처리에 관한 기록<br>
                    - 보존근거: 전자상거래등에서의 소비자보호에 관한 법률<br>
                    - 보존기간: 3년<br>
                    <br>
                    4) 웹사이트 방문기록<br>
                    -보존근거: 통신비밀보호법<br>
                    -보존기간: 3개월<br><br>
            </p>
        <p class="bluecolor" id="three">3. 개인정보의 파기절차 및 방법</p>
            <p class="infoFontSize left">
                    회원님의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.<br>
                    <br>
                    가. 파기절차<br>
                    - 회원님이 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한<br> 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기됩니다.<br>
                    - 별도DB로 옮겨진 개인정보는 법률에 의한 경우를 제외하고는 다른 목적으로 이용되지 않습니다.<br>
                    <br>
                    나. 파기방법<br>
                    - 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.<br>
                    - 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.<br><br>
            </p>
        <p class="bluecolor" id="four">4. 개인정보의 제3자 제공 및 공유</p>
            <p class="infoFontSize left">
                    가. 회사는 회원님의 개인정보를 제1조에서 고지한 범위 내에서 사용하며, 회원님의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 제3자에게 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
                    <br>
                    - 이용자들이 제3자 제공에 동의한 경우<br>
                    - 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우<br>
                    <br>
                    나. 회사가 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 상담 등 거래 당사자간 원활한 의사소통과 배송 및 모임 등 거래이행을 위하여 관련된 정보를 필요한 범위 내에서 거래 당사자에게 제공합니다.
                <br><br>
            </p>
        <p class="bluecolor" id="five">5. 개인정보의 처리 위탁</p>
            <p class="infoFontSize left">
                회사는 서비스 향상을 위해서 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.</p>
        <p class="bluecolor" id="six">6. 회원의 권리와 그 행사방법</p>
            <p class="infoFontSize left">
                    가. 회원님은 언제든지 등록되어 있는 본인의 개인정보를 조회하거나 수정할 수 있으며 회원 탈퇴 절차를 통하여 개인정보 이용에 대한 동의 등을 철회할 수 있습니다.
                    <br><br>
                    나. 개인정보의 조회/수정을 위해서는 사이트의[마이페이지]내의[회원정보수정] 항목에서 확인 가능하며, 가입 해지(동의철회)는[마이페이지] 상단 메뉴 '탈퇴하기'를 통하여 탈퇴하실 수 있습니다. 이 외에도 회사의 개인정보 보호책임자에게 서면, 전화 또는 이메일로 연락하여 열람/수정/탈퇴를 요청하실 수 있습니다.
                    <br> <br>   
                    다. 회원님이 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 회사는 회원님의 요청에 의해 해지 또는 삭제된 개인정보는 제2조에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.
                    <br><br>
            </p>
        <p class="bluecolor" id="seven">7. 회원의 의무</p>
            <p class="infoFontSize left">
                    가. 회원님은 자신의 개인정보를 보호할 의무가 있으며, 회사의 책임 없는 사유로 발생한 문제에 대하여 회사는 일체의 책임을 지지 않습니다.
                    <br><br>
                    나. 회원님의 개인정보를 최신의 상태로 정확하게 입력하시기 바랍니다. 회원님의 부정확한 정보입력으로 발생하는 문제의 책임은 회원님 자신에게 있으며, 타인의 주민등록번호 등 개인정보를 도용하여 서비스 이용 시 회원자격 상실과 함께 주민등록법에 의거하여 처벌될 수 있습니다.
                    <br><br>    
                    다. 회원님은 개인정보를 보호받을 권리와 함께 스스로를 보호하고 타인의 정보를 침해하지 않을 의무도 가지고 있습니다. 아이디, 비밀번호를 포함한 회원님의 개인정보가 유출되지 않도록 조심하시고 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 유의해 주십시오.
                    <br><br>
                    라. 회원님은 『정보통신망이용촉진및정보보호등에관한법률』, 개인정보보호법, 주민등록법 등 기타 개인정보에 관한 법률을 준수하여야 합니다.
                    <br><br>
            </p>
        <p class="bluecolor" id="eight">8. 링크사이트</p>
            <p class="infoFontSize left">
                회사는 회원님께 다른 회사의 웹사이트 또는 자료에 대한 링크를 제공할 수 있습니다. 이 경우 회사는 외부웹사이트 및 자료에 대한 아무런 통제권이 없으므로 그로부터 제공받는 서비스나 자료의 유용성에 대해 책임질 수 없으며 보증할 수 없습니다. 회사가 포함하고 있는 링크를 통하여 타 웹사이트의 페이지로 옮겨갈 경우 해당 웹사이트의 개인정보처리방침은 회사와 무관하므로 새로 방문한 웹사이트의 정책을 검토해보시기 바랍니다.
            </p>
        <p class="bluecolor" id="nine">9. 개인정보 자동수집 장치(쿠키 등)의 설치, 운영 및 그 거부에 관한 사항</p>
            <p class="infoFontSize left">
                    가. 회사는 회원님들에게 보다 적절하고 유용한 서비스를 제공하기 위하여 회원님의 정보를 수시로 저장하고 불러오는 ‘쿠키(cookie)’를 사용합니다. 쿠키란 회사의 웹사이트를 운영하는데 이용되는 서버가 회원님의 컴퓨터로 전송하는 아주 작은 텍스트 파일로서 회원님의 컴퓨터 하드디스크에 저장됩니다. 회원님께서는 쿠키의 사용여부에 대하여 선택하실 수 있습니다. 단, 쿠키를 사용하지 않아 생기는 서비스 사용의 문제및 제한은 회사가 책임 지지 않습니다.
                    <br><br>
                    나. 쿠키 설정 거부 방법<br>
                    - 회원님은 사용하시는 웹 브라우저의 옵션을 설정함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 단, 쿠키의 저장을 거부할 경우 로그인이 필요한 일부 서비스의 이용에 제한이 생길 수 있음을 양지하시기 바랍니다.<br>
                    - 쿠키 설치 허용 여부를 지정하는 방법(Internet Explorer의 경우)<br>
                    <br>
                    1) [도구] 메뉴에서[인터넷 옵션]을 선택><br><br>
                    2) [개인정보]를 클릭><br><br>
                    3) [고급]을 클릭<br><br>
                    4) 쿠키 허용여부를 선택
                    <br><br>
            </p>
        <p class="bluecolor" id="ten">10. 개인정보의 기술적/관리적 보호 대책</p>
            <p class="infoFontSize left">
                    회사는 회원님의 개인정보를 보호하기 위하여 다음과 같은 보호 대책을 시행하고 있습니다.<br><br>
                    <b>가. 비밀번호의 암호화</b><br>
                    회원님의 비밀번호는 암호화되어 저장 및 관리되고 있습니다. 비밀번호는 오직 회원 본인만이 알 수 있으며 개인정보를 확인 및 변경할 경우에도 비밀번호를 알고 있는 본인에 의해서만 가능합니다. 따라서 회원님의 비밀번호가 타인에게 알려지지 않도록 각별히 주의하시기 바랍니다.
                    <br><br>
                    <b>나. 해킹 및 컴퓨터 바이러스 등에 대비</b><br>
                    회사는 해킹이나 컴퓨터 바이러스에 의하여 회원님들의 개인정보가 유출되거나 훼손되는 것을 막기 위하여 필요한 보안조치를 이용하고 있으며, 더욱 향상된 보안조치를 확보할 수 있도록 가능한 모든 기술적 방법을 구비하기 위하여 노력하고 있습니다.
                    <br><br>
                    <b>다. 개인정보 처리자의 제한 및 교육</b><br>
                    회사는 개인정보를 처리하는 직원을 최소한으로 제한하고 있으며, 관련 직원들에 대한 교육을 수시로 실시하여 본 방침의 이행 및 준수여부를 확인하고 있습니다
                    <br><br>
            </p>
        <p class="bluecolor" id="eleven">11. 개인정보보호책임자</p>
            <p class="infoFontSize left">
                    회원님의 개인정보를 보호하고 개인정보와 관련된 불만 등을 처리하기 위하여 회사는 고객서비스담당 부서 및 개인정보보호책임자를 두고 있습니다.<br>
                    회원님의 개인정보와 관련한 문의사항은 아래의 고객서비스담당 부서 또는 개인정보보호책임자에게 연락하여 주시기 바랍니다.<br>
                    <br>
                    □고객서비스담당 부서: 운영팀<br>
                    전화번호: 02-2222-2222<br>
                    이메일: moigo@moigo.com
                    <br><br>
                    □개인정보보호책임자 성명: 이원제<br>
                    소속/직위: 일개사원<br>
                    전화번호: 070-2222-2222<br>
                    이메일: sawon@moigo.com
                    <br><br>
                    기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.<br>
                    1. 개인분쟁조정위원회(www.1336.or.kr/1336)<br>
                    2. 정보보호마크인증위원회(www.eprivacy.or.kr/02-580-0533~4)<br>
                    3. 대검찰청 인터넷범죄수사센터(icic.sppo.go.kr/02-3480-3600)<br>
                    4. 경찰청 사이버테러대응센터(www.ctrc.go.kr/02-392-0330)<br><br>
            </p>
        <p class="bluecolor"  id="twelve">12. 개인정보처리방침의 개정과 그 공지</p>
            <p class="infoFontSize left">본 방침은 2018년 01월 29일 부터 시행됩니다. 현 개인정보취급방침 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일전부터 홈페이지의 공지사항을 통해 고지할 것입니다.<br>
                 다만, 개인정보의 수집 및 활용, 제3자 제공 등과 같이 이용자 권리의 중요한 변경이 있을 경우에는 최소 30일 전에 고지합니다.</p>

    </div>
    
    <!-- 이용안내 -->
    <c:choose>
		<c:when test="${selected ne 'guid'}">
			<div class="container testdiv" id="usgui" style="display:none;">
		</c:when>
		<c:otherwise>
			<script>
				$('#useGuide').css('color','skyblue');
			</script>
			<div class="container testdiv" id="usgui">
		</c:otherwise>
	</c:choose>
    
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
    
    <!-- 연락처 및 지도 -->
    <c:choose>
		<c:when test="${selected ne 'ma'}">
			<div class="container" id="mapdiv" style="display:none;">
		</c:when>
		<c:otherwise>
			<script>
				$('#maps').css('color','skyblue');
				
			</script>
			<div class="container" id="mapdiv">
		</c:otherwise>
	</c:choose>
    
        <div class=" justify-content-center textc">
            <br>
            <h3><i class="fas fa-phone-volume" style="font-size: 3ex;"></i>고객센터</h3><br>
            <h4>02-2222-2222</h4>
		</div>
		<br><hr><br>
        <div class="textc"><h3>Location</h3></div><br>
        <div class="textc"><i class="fas fa-map-signs" style="font-size: 7ex;"></i></div><br>
        <div class="textc"><h4>서울특별시 강남구 테헤란로 14길 6 남도빌딩 3F</h4></div>
    </div>
    <br>
    <div class="container mapHeight" id="map"></div>
	

		<br><br><br>
	<!-- // 바디부분 // -->
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	/* $('.cursorPo').on('click',function(){
	
		var select = $(this).siblings('input').val();
		alert(select);
		$.ajax({
		url : "${pageContext.request.contextPath}/common/ajax.ft",
		data : {selected: }
		
		});
	}); */
	

	
	$('#serviceInfo').on('click',function(){
		$('#servinfo').css("display","inherit");
		$('#pi').css("display","none");
		$('#usgui').css("display","none");
		$('#mapdiv').css("display","none");
		$('#map').css("display","none");
		
		$('#serviceInfo').css("color","skyblue");
		$('#personalInfo').css("color","black");
		$('#useGuide').css("color","black");
		$('#maps').css("color","black");
		
	});
	$('#personalInfo').on('click',function(){
		$('#servinfo').css("display","none");
		$('#pi').css("display","inherit");
		$('#usgui').css("display","none");
		$('#mapdiv').css("display","none");
		$('#map').css("display","none");
		
		$('#serviceInfo').css("color","black");
		$('#personalInfo').css("color","skyblue");
		$('#useGuide').css("color","black");
		$('#maps').css("color","black");
	});
	$('#useGuide').on('click',function(){
		$('#servinfo').css("display","none");
		$('#pi').css("display","none");
		$('#usgui').css("display","inherit");
		$('#mapdiv').css("display","none");
		$('#map').css("display","none");
		
		$('#serviceInfo').css("color","black");
		$('#personalInfo').css("color","black");
		$('#useGuide').css("color","skyblue");
		$('#maps').css("color","black");
	});
	
	$('#maps').on('click',function(){
		$('#map').css("height","400px");
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(37.498960, 127.032940), // 지도의 중심좌표
	        level: 1 // 지도의 확대 레벨
	    };

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(37.498960, 127.032940); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
	  	  position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
		
		$('#servinfo').css("display","none");
		$('#pi').css("display","none");
		$('#usgui').css("display","none");
		$('#mapdiv').css("display","inherit");
		$('#map').css("display","inherit");
		
		$('#serviceInfo').css("color","black");
		$('#personalInfo').css("color","black");
		$('#useGuide').css("color","black");
		$('#maps').css("color","skyblue");
		
	});
	
	
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