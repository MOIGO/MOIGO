package com.kh.moigo.search.model.vo;

public class PageBar {
   
   public static String getPageBar(int listCount, int cPage, int limit, String url ){
      String pageBar = "";
      int pageBarSize = 5;
      cPage = cPage==0?1:cPage;
      
      //총페이지수 구하기
      int totalPage = (int)Math.ceil((double)listCount/limit);
      
      //1.pageBar작성
      //pageBar순회용변수 
      int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1;
      //종료페이지 번호 세팅
      int pageEnd = pageNo+pageBarSize-1;
      System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
      pageBar += "<div class='center-block pageBar-wrap'>";
      pageBar += "<ul class='pagination justify-content-center pagination-sm pageBar'>";
      //[이전]section
      if(pageNo == 1 ){
         pageBar += "<li class='page-item disabled'>";
         pageBar += "<a class='page-link page-Btn' href='#' tabindex='-1'>이전</a>";
         pageBar += "</li>";
      }
      else {
         pageBar += "<li class='page-item'>";
         pageBar += "<a class='page-link page-Btn' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
         pageBar += "</li>";
      }
      
      // pageNo section
      while(!(pageNo>pageEnd || pageNo > totalPage)){
         int i = 1;
         if(cPage == pageNo ){
            pageBar += "<li class='page-item active'>";
            pageBar += "<a class='page-link pageNo page-Btn'>"+pageNo+"</a>";
            pageBar += "</li>";
         } 
         else {
            i++;
            pageBar += "<li class='page-item'>";
            pageBar += "<a class='page-link pageNo page-Btn' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
            pageBar += "</li>";
         }
         pageNo++;
      }
      
      //[다음] section
      if(pageNo > totalPage){
         pageBar += "<li class='page-item disabled'>";
         pageBar += "<a class='page-link page-Btn' href='#'>다음</a>";
         pageBar += "</li>";
         
      } else {
         pageBar += "<li class='page-item'>";
         pageBar += "<a class='page-link next page-Btn' href='javascript:fn_paging("+pageNo+")'>다음</a> ";
         pageBar += "</li>";
      }
      
      pageBar += "</ul></div>";
      
      //2.스크립트 태그 작성
      //fn_paging함수
      pageBar += "<script>";
      pageBar += "function fn_paging(cPage,numPerPage){";
      pageBar += "if($('.regardlessArea:checked').val() == \"지역무관\") {";
	  pageBar += "location.href='"+url+"?cPage='+cPage+'&keyword='+$('#keyword').val()+'&place='+$('#place').val()+'&regardlessArea='+$('.regardlessArea:checked').val()+'&category='+$('#category').val()+'&sort='+$('#sort').val()";
	  pageBar += "} else { location.href='"+url+"?cPage='+cPage+'&keyword='+$('#keyword').val()+'&place='+$('#place').val()+'&category='+$('#category').val()+'&sort='+$('#sort').val() }}";
      pageBar += "</script>";
      
      return pageBar; 
   }

}