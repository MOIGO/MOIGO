<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
<html>
<head>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootStrap/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootStrap/bootstrap.min.js"></script>
     --%>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
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

	<c:import url="/WEB-INF/views/groups/mapModal.jsp" />

	<div class="container">

		<div class="row">


			<c:import url="/WEB-INF/views/groups/leftAside.jsp">
            	<c:param name="groupNo" value="G007"/>
         	</c:import>

			<div class="col-7">
				<div class="col">
					<button class="btn btn-primary btn-block" type="button" data-toggle="modal" data-target="#postEdit" onclick="createSummerNote();">글쓰기</button>
					<input type="hidden" name="memberNo" value="A001" />
				</div>
				<div class="col">
					
				</div>
			</div>

			<c:import url="/WEB-INF/views/groups/rightAside.jsp" />

		</div>
	</div>
	<!--container end-->


	<!--post edit modals  -->
	<div class="modal fade" id="postEdit" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">글쓰기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" onclick="destroySummerNote();">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div id="summernote"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" onclick="destroySummerNote();">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	

</body>

<script>

function destroySummerNote(){
	
	if($('#summernote').length>0){
		
		$('#summernote').summernote('reset');
		$('#summernote').summernote('destroy');
	}
	
}

function createSummerNote(){
	
	var insertMap = function (context) {
		  var ui = $.summernote.ui;

		  // create button
		  var button = ui.button({
		    contents: '<i class="fas fa-map-marked-alt"></i>',
		    container:false,
		    tooltip: '지도 삽입',
		    click: function () {
		      toggleMapModal();
		    }
		  });

		  return button.render();   // return button as jquery object
		}
	
	$('#summernote').summernote({
		  toolbar: [
		  	['style', ['bold', 'italic', 'underline', 'clear']],
		   	['font', ['strikethrough', 'superscript', 'subscript']],
		    ['fontsize', ['fontsize']],
		    ['color', ['color']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['mybutton', ['insertmap']]
		  ],

		  buttons: {
		     insertmap: insertMap
		  }
	});
}

function toggleMapModal(editObj){
	 $('#insertMap').modal("toggle");
     $('#insertMap').on("shown.bs.modal",makeMap());
}
	
</script>

</html>