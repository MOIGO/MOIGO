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

<div class="modal fade" id="reportingModal" role="dialog">
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

	


</script>