<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootStrap/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootStrap/bootstrap.min.js"></script>
     --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

<style>
.test {
	border: 1px solid;
}

.vcenter {
	display: inline-block;
	vertical-align: middle;
	float: none;
}

.bandName {
	font-size: 1.5em;
	font-weight: bolder;
}

.writePost {
	
}
</style>

</head>

<body>
	
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>

	<div class="container">

		<div class="row">
			
			<c:import url="/WEB-INF/views/groups/leftAside.jsp"/>

			<div class="col-7">
				<div class="col">
				<form action="/member/memberDetail.do">
					<button class="btn btn-primary btn-block" type="submit">글쓰기</button>
					<input type="hidden" name="memberNo" value="A001" />
				</form>
				</div>
			</div>

			<c:import url="/WEB-INF/views/groups/rightAside.jsp"/>
		
		</div>
	</div>
	<!--container end-->


</body>

<script>
	function submitMemberNo(){
		
		
		$.submit();
	}

	$(document).ready(function() {

		/*  var HelloButton = function (context) {
		   var ui = $.summernote.ui;

		   // create button
		   var button = ui.button({
		     contents: '<i class="fa fa-child"/> Hello',
		     tooltip: 'hello',
		     click: function () {
		       // invoke insertText method with 'hello' on editor module.
		       context.invoke('editor.insertText', 'hello');
		     }
		   });

		   return button.render();   // return button as jquery object
		 }
		 */

		<script>
		$('#summernote').summernote({
			placeholder : 'Hello bootstrap 4',
			tabsize : 2,
			height : 100
		});

	});
</script>

</html>