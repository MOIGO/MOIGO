<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> 
<script src="${root}/resources/js/common/jquery-3.3.1.min.js"></script>
<script src="${root}/resources/js/common/fontfaceobserver.js"></script>
<link rel="stylesheet" href="${root}/resources/css/bootstrap/bootstrap.min.css"> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="${root}/resources/js/bootstrap/bootstrap.min.js" ></script>	
<style type="text/css">
#selectSubAccuse{
	width: inherit;
}
.form-check{
	width: inherit;
}
.btn_report {
	width: 90%;
	height: 51px;
	border-radius: 2px;
	font-size: 14px;
	margin-top: 10px;

}
#selectSubAccuse{
	width: 90%;
	height: 30px;
	border-radius: 2px;
	background-color: #fff4f5;
	color: black;
	border: 0;
	letter-spacing: 0;
	margin-top: 10px;
	font-size: 15px;
	cursor: pointer;
}

</style>
</head>

<div class="modal fade" id="acuuseModalTest" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-sm"
		role="document">
		<div class="modal-content ">
			<div class="modal-header bg-danger">
				<h5 class="modal-title text-white" id="exampleModalLongTitle">REPORT</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="/" name="myForm" id="myForm" style="width: 100%">
					<div class="form-check">
						<input class="form-check-input" id="accuseReporter" type="hidden"> 
						<input class="form-check-input" id="accuseTarget" type="hidden"> 						
					</div>				
					<div class="form-check">
						<input class="form-check-input" type="radio" name="reportRadios" id="exampleRadios1" value="폭력적 또는 혐오스러운 콘텐츠" onClick="updateList(this.value)"> 
						<label class="form-check-label" for="exampleRadios1">폭력적 또는 혐오스러운 콘텐츠 </label>
					</div>

					<div class="form-check">
						<input class="form-check-input" type="radio" name="reportRadios"
							id="exampleRadios2" value="증오 또는 악의적인 콘텐츠"
							onClick="updateList(this.value)"> <label
							class="form-check-label" for="exampleRadios2"> 증오 또는 악의적인
							콘텐츠 </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="reportRadios"
							id="exampleRadios3" value="스팸 또는 과장된 광고 콘텐츠"
							onClick="updateList(this.value)"> <label
							class="form-check-label" for="exampleRadios3">스팸 또는 과장된
							광고 콘텐츠</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="reportRadios"
							id="exampleRadios4" value="권리침해" onClick="updateList(this.value)">
						<label class="form-check-label" for="exampleRadios4">권리침해</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="reportRadios"
							id="exampleRadios5" value="아동학대" onClick="updateList(this.value)">
						<label class="form-check-label" for="exampleRadios5">아동학대</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="reportRadios"
							id="exampleRadios6" value="기타" onClick="updateList(this.value)">
						<label class="form-check-label" for="exampleRadios6">기타</label>
					</div>
					<div class="form-check myList" style="display: none;">
						<select name="myList" id="selectSubAccuse">
							<option>-----------</option>
						</select>
					</div>

					<div class="form-check text-left">
						<button type="button" id="reportSubmit" class="btn btn-outline-danger btn_report">Submit</button>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">




$('#reportSubmit').on('click',function(){
	var data =$("input[name=reportRadios]").val();
	var data2 =$("select[name=myList]").val();
	var data3 =$("#accuseTarget").val();
	var data4 =$("#accuseReporter").val();
	
	console.log(data+data2+data3+data4);
    $.ajax({
        type: 'post', // method attribute of form
        url: "${pageContext.request.contextPath}/reporting.ad",  // action attribute of form
        data : {data : data, data2: data2},
        success : function(data){
		 alert(data); 
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