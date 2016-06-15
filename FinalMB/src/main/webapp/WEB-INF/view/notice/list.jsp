<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>



<!-- 공지사항 css 적용 요망 11/17 강프로    main.css -> notice.css -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/css/notice.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->



<script type="text/javascript" src="/resources/jquery-1.11.3.js"></script>
<script type="text/javascript">
   
</script>


<script type="text/javascript">
   $(document).ready(function() {
   
      $("#searchBtn").click(function() {
         $("#searchForm").attr("method", "post");
         $("#searchForm").attr("action", "<c:url value="/notice/list" />");
         $("#searchForm").submit();
         
      });
      
   });
</script>



<style>
body {
   font-size: 22px;
}

#noticeTable {
      /* margin-left: 600px; */
      margin: auto;
      z-index: 0;
      background-color: rgba( 40, 120, 255, 0.3 );
      }
      
#noticeTh {
      z-index: 0;
      background-color: rgba( 36, 120, 255, 0.8 );
      
}

#searchForm {
color: black;
}


.check { 
width:18pt; 
height:18pt; 
} 


</style>

</head>

<body class="loading">


   <div id="wrapper">
      <div id="bg"></div>
      <div id="overlay"></div>
      <div id="main">


         <header id="header">
               <hr>
               <h1>Notice</h1>
               <hr>
               <nav>

            <table id="noticeTable" style="border: 3px solid #5ad2ff">
               <colgroup>
                  <col width="20%" />
                  <col width="*" />
                  <col width="9%" />
                  <col width="20%" />
               </colgroup>


               <thead>
                  <tr id="noticeTh" height="50px" style="font-size: 18pt">
                     <th scope="col">글번호</th>
                     <th scope="col">제목</th>
                     <th scope="col">작성자</th>
                     <th scope="col">등록일</th>
                  </tr>
               </thead>



               <c:if test="${ empty noticeList.noticeList }">
                  <tr>
                     <td>공지글이 없습니다.</td>
                  </tr>
               </c:if>




               <c:if test="${ not empty noticeList.noticeList }">
                  <c:forEach items="${ noticeList.noticeList }" var="noticeVO">

                     <tr height="50px" style="font-size: 18pt">
                        <td>${noticeVO.articleId} <br /></td>
                        <td style="text-align:left;">&nbsp;&nbsp;&nbsp;<a href="/notice/detail/${noticeVO.articleId}"> ${ noticeVO.subject }
                        </a><br /></td>
                        <td>${ noticeVO.writer } <br /></td>
                        <td>${ noticeVO.writeDate } <br /></td>
                     </tr>


                  </c:forEach>
               </c:if>



               <tr id="noticeTh">
                  <td colspan="4">${ noticeList.paging.getPagingList("pageNo", " [ @ ] " , " Prev ", " Next ")}
                  </td>
               </tr>


            </table>
            
            
      <!-- 조성범 11.18 검색기능 추가------------------------->
   			
   <br>
   
            <form id="searchForm">
               <input type="hidden" name="pageNo" id="pageNo" value="${noticeSearchVO.pageNo}" />
               <input type="checkbox" name="searchType" id="searchType" class="check" value="subject" checked="checked"/>제목
               <input type="checkbox" name="searchType" id="searchType" class="check" value="content" />내용
               <input type="text" name="searchKeyword" id="searchKeyword" value="${noticeSearchVO.searchKeyword}"
                     style="color:black;"/>
               <input type="button" id="searchBtn" value="검색" style="color:black; cursor:pointer;"/>      
            </form>
            
            

         </nav>

         </header>

         <footer id="footer">
            <span class="copyright">&copy; 201003011_김형근.</span>
         </footer>




      </div>
   </div>


</body>
</html>