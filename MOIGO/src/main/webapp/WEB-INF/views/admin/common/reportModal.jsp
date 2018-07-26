<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<head>
<style type="text/css">
#selectSubAccuse{
	width: inherit;
}
.form-check{
	width: inherit;
}

</style>
</head>

<div class="modal fade" id="acuuseModalTest" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-sm"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">신고</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="/" name="myForm" style="width: 100%">
					<div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios"
							id="exampleRadios1" value="폭력적 또는 혐오스러운 콘텐츠" onClick="updateList(this.value)"> <label
							class="form-check-label" for="exampleRadios1"> 폭력적 또는 혐오스러운 콘텐츠 </label>
					</div>

					<div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios"
							id="exampleRadios2" value="증오 또는 악의적인 콘텐츠" onClick="updateList(this.value)"> <label
							class="form-check-label" for="exampleRadios2"> 증오 또는 악의적인 콘텐츠 </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios"
							id="exampleRadios3" value="스팸 또는 과장된 광고 콘텐츠" onClick="updateList(this.value)"> <label
							class="form-check-label" for="exampleRadios3">스팸 또는 과장된 광고 콘텐츠</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios"
							id="exampleRadios4" value="권리침해" onClick="updateList(this.value)"> <label
							class="form-check-label" for="exampleRadios4">권리침해</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios"
							id="exampleRadios5" value="아동학대" onClick="updateList(this.value)"> <label
							class="form-check-label" for="exampleRadios5">아동학대</label>
					</div>
					<div class="form-check">
						<select name="myList" id="selectSubAccuse">
						<option>-----------</option>
						</select>
					</div>
					<div class="form-check">
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
function Activity(name, list){
    this.name = name;
    this.list = list;
}

var acts = new Array();
	acts[0] = new Activity('폭력적 또는 혐오스러운 콘텐츠', ['세부 신고 항목 선택','청소년 폭력물', '성인 폭력물', '동물 학대','신체적 공격']);
	acts[1] = new Activity('증오 또는 악의적인 콘텐츠', ['세부 신고 항목 선택','증오심 또는 폭력 조장', '사회적 약자 학대', '괴롭힘','악의적인 내용']);
	acts[2] = new Activity('스팸 또는 과장된 광고 콘텐츠', ['세부 신고 항목 선택','대량광고', '의약품 판매', '현혹하는 텍스트','현혹하는 이미지']);
	acts[3] = new Activity('권리침해', ['세부 신고 항목 선택','내 저작권을 침해함', '내 개인정보를 침해함', '기타 법적 문제']);
	acts[4] = new Activity('아동학대', ['--']);

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
}
</script>