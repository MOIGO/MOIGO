<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>

 <style type="text/css">

    tr:hover {background-color: #f5f5f5;}

  </style>
</head>
<body>

	<c:import url="common/adminSidebar.jsp"></c:import>

  <div class="row">
 
  <br>
  <input class="form-control admin_group_search col-5" id="myInput" type="text" placeholder="Search..">
  </div>
  <br>

  <div class="row">
    <div class="admin_group_table col-10">
    <table class="table table-bordered ">
      <thead>
        <tr>
          <th>Group</th>
          <th>Group</th>
          <th>Group</th>
          <th>Group</th>
          <th>Group</th> 
          <td>Group</td>
          <td>Group</td>
          <td>Group</td>
        </tr>
      </thead>
      <tbody id="myTable">
        <tr>
          <td>Group</td>
          <td>Group</td>
          <td>Group@example.com</td>
          <td>Group1</td>
          <td>Group</td>
          <td>Group</td>
          <td>Group</td>
          <td><button>확인</button></td>
        </tr>
        <tr>
           <td>Group</td>
          <td>Group</td>
          <td>Group@example.com</td>
          <td>Group</td>
          <td>Group</td>
           <td>Group</td>
            <td>Group</td>
          <td><button>확인</button></td>
        </tr>
        <tr>
          <td>Group</td>
          <td>Group</td>
          <td>Group@example.com</td>
          <td>Group</td>
           <td>Group</td>
            <td>Group</td>
          <td>Group1</td>
          <td><button>확인</button></td>
        </tr>
        <tr>
          <td>Group</td>
          <td>Group</td>
          <td>Group@example.com</td>
          <td>Group</td>
           <td>Group</td>
            <td>Group</td>
          <td>Group</td>
          <td><button>확인</button></td>
        </tr>
         <tr>
         <td>Group</td>
          <td>Group</td>
          <td>Group@example.com</td>
          <td>Group</td>
          <td>Group</td>
           <td>Group</td>
            <td>Group</td>
          <td><button>확인</button></td>
        </tr>
         <tr>
         <td>Group</td>
          <td>Grou1p</td>
          <td>Group@example.com</td>
          <td>Group</td>
          <td>Group</td>
           <td>Group</td>
            <td>Group</td>
          <td><button>확인</button></td>
        </tr>

      </tbody>
    </table>
    <ul class="pagination justify-content-center">
      <li class="page-item"><a class="page-link" href="#">Previous</a></li>
      <li class="page-item"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item"><a class="page-link" href="#">4</a></li>
      <li class="page-item"><a class="page-link" href="#">5</a></li>
      <li class="page-item"><a class="page-link" href="#">Next</a></li>
    </ul>
    </div>

  </div>


</div><!-- container end-->



<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});



/*  function adminSideClick(e){
    $('.sidenav').toggle('slow');
    $('.body_background').toggleClass('extended-panel');

  }*/
</script>

</body>
</html>