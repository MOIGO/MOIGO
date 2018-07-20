<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/myPage_custom.css?ver=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
select:DISABLED {
	background-color : #e9ecef;}
</style>
</head>
<body >
   <c:import url="/WEB-INF/views/common/header.jsp"></c:import>
        <br><br>
    


    <div class="container" >
        <div class="col-md-9" style="float:none; margin:0 auto;">
            <h2>마이페이지</h2>
            <ul class="nav nav-tabs nav-justified " >
                <li class="nav-item"><a  class="nav-link  letter_space active" href="${pageContext.request.contextPath}/mypage/profile.do">회원정보</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/changePwd.do">비밀번호 변경</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/openGroup.do">주최모임</a></li>
                <li class="nav-item"> <a class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/joinGroup.do">참여모임</a></li>
                <li  class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/waitGroup.do">가입 대기 중</a></li>
                <li class="nav-item"><a  class="nav-link letter_space " href="${pageContext.request.contextPath}/mypage/withdrawal.do">회원탈퇴</a></li>
            </ul>
        </div>
        <br>

        <!-- style="float:none; margin:0 auto;"  -->
        <div class="col-md-9 content_box_wrap " style="float:none; margin:0 auto;" >
            <h5><i class="fas fa-user"></i> 회원정보</h5>
            <div class="content_box_area" >
              
        <form action="${pageContext.request.contextPath}/member/memberUpdate.do" id="updateForm" method="post">
                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-2 col-xs-3">아이디</div>
                        <div class="content_profile col-md-10 col-xs-9 ">
                            <div class="profile_text_control"  >${m.memberEmail }</div>
                        </div>
                    </div>
                </div>
                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-2 col-xs-3">이름</div>
                        <div class="content_profile col-md-8 col-xs-9 " style="padding-left:0px;">
                            <input type="text" class="col-12 profile_form_control "  name="memberName" id="userName"   value="${m.memberName }">
                        </div>
                    </div>
                </div>

                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-2 col-xs-3">성별</div>
                        <div class="content_profile col-md-10 col-xs-9 ">
                        <div class="profile_text_control"  >${m.memberGender=='M'?'남자':'여자' }</div>
                               <%--  <input type="text" class="col-xs-12 profile_form_control "  name="memberGender"id="loginId"   style="border:none;" value="${m.memberGender=='M'?'남자':'여자' }" readonly> --%> 
                        </div>
                    </div>
                </div>
                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-2 col-xs-4">생년월일 </div>
                        <div class="content_profile col-md-10 col-xs-12 row no_margin">
                            <select id="userYear" name="birthday_year" class="col-md-3 col-xs-12 profile_form_controla" style="margin-left:1%;">
                                 <c:forEach var="i" begin="0" end="${2019-1938}">
                                 		<c:set var="userYear" value="${userYear }" />
                                 			<c:if test="${i==0}">
								       			 <option  value="" disabled>년</option>
								       		</c:if>
								       		<c:if test="${i!=0}">
						       					<option value="${2019-i}" <c:if test="${(2019-i) eq userYear}">selected</c:if>>${2019-i}</option>
							      			</c:if>
							       </c:forEach>
                            </select>

                            <select name="" id="userMonth" class="col-md-3 col-xs-12 profile_form_controla" style="margin-left:1%;">
                                <c:forEach var="i" begin='0' end='12'>
                               			<c:set var="userMonth" value="${userMonth }" />
								       		<c:if test="${i==0}">
								       			 <option  value="" disabled>월</option>
								       		</c:if>
								       		<c:if test="${i!=0}">
								       			<c:if test="${i<10}">
								       				<option value="0${i}"<c:if test="${i eq userMonth}">selected</c:if> >${i}월</option>
								       			</c:if>
								       			<c:if test="${i>=10}">
								       				<option value="${i}" <c:if test="${i eq userMonth}">selected</c:if>>${i}월</option>
								       			</c:if>
								       		</c:if>
								</c:forEach>
                            </select>   

                            <select name="" id="userDay" class="col-md-3 col-xs-12 profile_form_controla" style="margin-left:1%;">
                                   <c:forEach var="i" begin='0' end='31'>
							       		<c:set var="userDay" value="${userDay}" />
								       		<c:if test="${i==0}">
								       			 <option  value="" disabled>일</option>
								       		</c:if>
								       		<c:if test="${i!=0}">
								       			<c:if test="${i<10}">
								       				<option value="0${i}"<c:if test="${i eq userDay}">selected</c:if> >${i}일</option>
								       			</c:if>
								       			<c:if test="${i>=10}">
								       				<option value="${i}" <c:if test="${i eq userDay}">selected</c:if>>${i}일</option>
								       			</c:if>
								       		</c:if>
							       </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-2 col-xs-12">관심지역</div>
                        <div class="content_profile col-md-10 col-xs-12 "   >
                       			 <div class="profile_text_control"  >
	                  				<c:if test="${empty m.memberAddress}">
	                  					선택안함
	                  				</c:if>
	                  				<c:if test="${ !empty m.memberAddress}">
	                  					${m.memberAddress}	
	                  				</c:if>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  				<a href="" class="collapsed" data-toggle="collapse" data-target="#activity_area"> 수정하기</a> </div>
                  				<div id="activity_area" class=" col-12 collapse ">
                  					<div class="row">
				                  		<select class="col-3 join_form_controla condition_region profile_form_control" id="conditionRegionLarge">
			                                 <option value="regionNone">- 시도 -</option>
			                           </select>
			                            
			                            <select class="col-3 join_form_controla condition_region profile_form_control" id="conditionRegionMedium">
				                             <option value="regionNone">- 시군구 -</option>
				                             <option value="">전체</option>
			                          	</select>
			                            
			                          	<select class="col-3 join_form_controla condition_region profile_form_control" id="conditionRegionSmall">
				                             <option value="regionNone">- 읍면동 -</option>
				                             <option value="">전체</option>
			                          	</select>
			                          	
			
										<div class="col-3 profile_text_control">
				                             <input class="" type="checkbox" id="regionNone">
				                             <label class="" for="regionNone">지역 무관</label>
										</div>
			                          	
                                    </div>
                                    
                        	</div>
                        </div>
                    </div>
                </div>
                <div class="row profile_wrap">
                    <div class="profile_box col-md-12 row no_margin">
                        <div class="title_profile col-md-2 col-xs-12">관심분야</div>
                        <div class="content_profile col-md-10 col-xs-12 "  style="line-height: 40px;">
	                       	<div class="profile_text_control"  >
	                  				<c:if test="${empty interestList}">
	                  					선택안함	
	                  				</c:if>
	                  				<c:if test="${ !empty interestList}">
	                  					<c:forEach items="${interestList }" var="inter">
	                  						<c:choose>
											    <c:when test="${inter == 'B001'}">라이프스타일</c:when>
											    <c:when test="${inter == 'B002'}">영어/외국어</c:when>
											    <c:when test="${inter == 'B003'}">컴퓨터</c:when>
											    <c:when test="${inter == 'B004'}">디자인/미술</c:when>
											    <c:when test="${inter == 'B005'}">취업</c:when>
											    <c:when test="${inter == 'B006'}">음악/공연</c:when>
											    <c:when test="${inter == 'B007'}">스포츠</c:when>
											    <c:when test="${inter == 'B008'}">뷰티/미용</c:when>
											    <c:when test="${inter == 'B009'}">게임</c:when>
											   </c:choose>
											   
	                  					</c:forEach>	
	                  				</c:if>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  					<a href="" class="collapsed" data-toggle="collapse" data-target="#activity_area2"> 수정하기</a>
                  				 </div>
	                				 <div id="activity_area2"  class=" col-md-12 col-12 collapse  no_margin" style="border: 0.5px solid #ccc; padding:10px; font-size:14px;">
			                           	<div class="row">
				                            <span class="ff col-md-3 col-6"><input type="checkbox"id="f1" name="interest" value="B001"<c:if test="${interestList.contains('B001') }"> checked</c:if>> <label for="f1">라이프스타일</label></span>
				                            <span class="ff col-md-3 col-6"><input type="checkbox"id="f2" name="interest" value="B002"<c:if test="${interestList.contains('B002') }"> checked</c:if>> <label for="f2">영어/외국어</label></span>
				                            <span class="ff col-md-3 col-6"><input type="checkbox"id="f3" name="interest" value="B003"<c:if test="${interestList.contains('B003') }"> checked</c:if>> <label for="f3">컴퓨터</label></span>
				                            <span class="ff col-md-3 col-6"><input type="checkbox"id="f4" name="interest" value="B004"<c:if test="${interestList.contains('B004') }"> checked</c:if>> <label for="f4">디자인/미술</label></span>
				                            <span class="ff col-md-3 col-6"><input type="checkbox"id="f5" name="interest" value="B005"<c:if test="${interestList.contains('B005') }"> checked</c:if>> <label for="f5">취업</label></span>
				                            <span class="ff col-md-3 col-6"><input type="checkbox"id="f6" name="interest" value="B006"<c:if test="${interestList.contains('B006') }"> checked</c:if>> <label for="f6">음악/공연</label></span>
				                            <span class="ff col-md-3 col-6"><input type="checkbox"id="f7" name="interest" value="B007"<c:if test="${interestList.contains('B007') }"> checked</c:if>> <label for="f7">스포츠</label></span>
				                            <span class="ff col-md-3 col-6"><input type="checkbox"id="f8" name="interest" value="B008"<c:if test="${interestList.contains('B008') }"> checked</c:if>> <label for="f8">뷰티/미용</label></span>
				                            <span class="ff col-md-3 col-6"><input type="checkbox"id="f9" name="interest" value="B009"<c:if test="${interestList.contains('B009') }"> checked</c:if>> <label for="f9">게임</label></span>
			                        	</div>
	                				</div>
                			</div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="profile_box col-md-12 ">
                     	<input type="hidden" name="memberBirth" id="memberBirth" value="${m.memberBirth }">
                     	<input type="hidden" id="memberAddress" name="memberAddress" value="${m.memberAddress }">
                        <button class="btn_profileUpdate pull-right col-md-2 col-xs-12" id="btnUpdate"> 저장하기</button>
                    </div>
                </div>
       	 </form>
                
                <br>
            </div>
        </div>

    <br><br><br><br><br><br>
    
    
    
    
    <script>
    
    $('#btnUpdate').on('click',function(){
    	$('#updateForm').submit();
    });
    
    $('#activity_area').on('click',function(){
	  	var L = $('#conditionRegionLarge').val();
	    var M = $('#conditionRegionMedium').val();
	    var S = $('#conditionRegionSmall').val();
	 
	   	var str="";
	   	
	      if($('#regionNone').is(":checked")){
	    	  str="지역무관";
	      }
	      else{
	    	   str = L+" "+M+" "+S;
	      }
   	   	 $('#memberAddress').val(str.replace(/regionNone/gi," ").trim()); 
	   
   	   	 console.log($('#memberAddress').val() );
	});
    
$(function(){
         
 
	
	// 행정구역 list를 가져오기 위한 ajax 부분
      $.ajax({
         url:'http://api.vworld.kr/req/data?service=data&request=GetFeature&data=LT_C_ADSIDO_INFO&key=D2A9AD49-5624-3245-BB98-EEBB6C10B050'
               +'&domain=http://127.0.0.1:8080&attrFilter=ctprvn_cd:between:11,50&size=17',
           type:'GET',
           dataType:'jsonp',
           async: false,
           success:function(data){
           
       	   var features =  data.response.result.featureCollection.features;
            var regionLarges = [];
           
            for(var i=0 ; i < features.length; i++){
               regionLarges[i] = features[i].properties.ctp_kor_nm;
               $("#conditionRegionLarge").append("<option value="+regionLarges[i]+">"+regionLarges[i]+"</option>");
            }
              
              },error:function(data){
                 console.log("에러입니다"); 
           }
        });
   
		var lRegion = "";
		$("#conditionRegionLarge").change(function() {
			lRegion = $(this).val();
			$("#conditionRegionMedium").children().not(":lt(2)").remove();
			$("#conditionRegionSmall").children().not(":lt(2)").remove();
			if(lRegion != 'regionNone'){
				$("#conditionRegionMedium").prop("disabled", false)
				$.ajax({
			         url:'http://api.vworld.kr/req/data?service=data&request=GetFeature&data=LT_C_ADSIGG_INFO&key=D2A9AD49-5624-3245-BB98-EEBB6C10B050'
			               +'&domain=http://127.0.0.1:8080&attrFilter=full_nm:like:'+ lRegion +'&size=100',
			           type:'GET',
			           dataType:'jsonp',
			           async: false,
			           success:function(data){
			           
			            var features =  data.response.result.featureCollection.features;
			            var regionMediums = [];
			           
			            for(var i=0 ; i < features.length; i++){
			               regionMediums[i] = features[i].properties.sig_kor_nm;
			               $("#conditionRegionMedium").append("<option value="+regionMediums[i]+">"+regionMediums[i]+"</option>");
			            }
			              
			        },error:function(data){
			             console.log("에러입니다"); 
			        }
			   });
			}else if(lRegion == 'regionNone'){
				$("#conditionRegionMedium").prop("disabled", true);  
				$("#conditionRegionSmall").prop("disabled", true);  
			}
		});
		
		$("#conditionRegionMedium").change(function() {
			
			var mRegion = $(this).val();
			$("#conditionRegionSmall").children().not(":lt(2)").remove();
			if(mRegion == ''){
				$("#conditionRegionSmall").prop("disabled", true);  
				$("#conditionRegionSmall").val("regionNone").prop("selected", true);			
			}
			else if(mRegion != 'regionNone'){
				$("#conditionRegionSmall").prop("disabled", false);  
				$.ajax({
			         url:'http://api.vworld.kr/req/data?service=data&request=GetFeature&data=LT_C_ADEMD_INFO&key=D2A9AD49-5624-3245-BB98-EEBB6C10B050'
			               +'&domain=http://127.0.0.1:8080&attrFilter=full_nm:like:'+ lRegion + " " + mRegion +'&size=100',
			           type:'GET',
			           dataType:'jsonp',
			           async: false,
			           success:function(data){
	
			            var features =  data.response.result.featureCollection.features;
			            var regionSmalls = [];
			           
			            for(var i=0 ; i < features.length; i++){
			               regionSmalls[i] = features[i].properties.emd_kor_nm;
			               $("#conditionRegionSmall").append("<option value="+regionSmalls[i]+">"+regionSmalls[i]+"</option>");
			            }
			              
			        },error:function(data){
			             console.log("에러입니다"); 
			        }
			   });
			}
			else
				$("#conditionRegionSmall").prop("disabled", true);  
			
		});
		
		
   
	   // 지역무관을 선택했을 경우 발생하는 이벤트
	   $("#regionNone").change(function() {
	      if($(this).is(":checked")){
	         $(".condition_region").prop("disabled", true);         
	         $(".condition_region").val("regionNone").prop("selected", true);
	      }
	      else{
	         $(".condition_region").prop("disabled", false);
	      }
	   });
	    
    
});
    
    
$('input[name="interest"]').click(function(){
    var sum =0;
	
    $('input[name="interest"]').each(function(i){
        if($('input[name="interest"]').eq(i).prop("checked")){
            sum++;
        }
    });

    if(sum>3){
        alert('3개까지 선택 가능합니다');
        $(this).prop("checked",false);

    }
});

$('#userYear, #userMonth, #userDay').on('change',function(){
	  
	  var yy=$('#userYear').val();
	  var mm=$('#userMonth').val();
	  var dd=$('#userDay').val();
	
	  if(yy==""){
		  	chkBirth=false;
			$('#birthChkMsg').html('연도 확인').addClass('noChk').removeClass('okChk');
	  }else if(mm==""){
		  chkBirth=false;
		  $('#birthChkMsg').html('월 확인').addClass('noChk').removeClass('okChk');
	  }else if(dd==""){
		  chkBirth=false;
		  $('#birthChkMsg').html('일 확인').addClass('noChk').removeClass('okChk');
	  }
	  
	  if(yy!="" && mm!="" && dd!="" ){
		  $('#memberBirth').val(yy+"-"+mm+"-"+dd);
		  console.log($('#memberBirth').val());
		  chkBirth=true;
		  $('#birthChkMsg').html('OK!').addClass('okChk').removeClass('noChk');
	  }
	  
});
    
    </script>
</body>
</html>