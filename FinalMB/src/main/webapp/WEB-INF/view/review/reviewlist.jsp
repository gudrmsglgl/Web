<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 게시판</title>

<!-- 공지사항 css 적용 요망 11/17 강프로    main.css -> notice.css -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/notice.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->

<script type="text/javascript">
$(document).ready(function() {
	$("#rvwrite").click(function() {
		
	<c:if test="${ !loginStatus }">
	alert("로그인이 필요한 서비스 입니다. 로그인 창으로 넘어갑니다.");
	location.href="/member/login?url=/menuselect";
	</c:if>
		
	<c:if test="${loginStatus}">	
	location.href="/review/reviewwrite";
	</c:if>
		
	});
	
	$("#searchBtn").click(function() {
        $("#searchForm").attr("method", "post");
        $("#searchForm").attr("action", "<c:url value="/review/reviewlist" />");
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
	background-color: rgba(40, 120, 255, 0.3);
}

#noticeTh {
	z-index: 0;
	background-color: rgba(36, 120, 255, 0.8);
}

#noticeBt {
	z-index: 0;
	/* background-color: rgba( 36, 120, 255, 0.8 ); */
	margin: auto;
	width: 49%;
	color: black;
	text-align: right;
}
#searchForm {
	color: black;
}
.check {
	width: 18pt;
	height: 18pt;
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
			<h1>Review & Comments</h1>
			<hr>
			<nav>
			<table id="noticeTable" style="border: 3px solid #5ad2ff; font-size: 18pt;">
				<colgroup>
					<col width="20%" />
					<col width="*" />
					<col width="9%" />
					<col width="20%" />
				</colgroup>

				<thead>
					<tr height="50px">
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>

				<c:if test="${ empty reviewList.reviewList }">
					<tr>
						<td>후기글이 없습니다.</td>
					</tr>
				</c:if>

				<c:if test="${ not empty reviewList.reviewList }">
					<c:forEach items="${ reviewList.reviewList }" var="reviewVO">
						<tr height="50px">
							<td>${reviewVO.articleId}<br></td>
							<td style="text-align: left;">&nbsp;&nbsp;&nbsp;<a
								href="/review/reviewdetail/${reviewVO.articleId}"> ${ reviewVO.subject }</a><br></td>
							<td>${ reviewVO.writer }<br></td>
							<td>${ reviewVO.writeDate }<br></td>
						</tr>
					</c:forEach>
				</c:if>

				<tr id="noticeTh">
					<td colspan="4">${ reviewList.paging.getPagingList("pageNo", " [ @ ] " , " Prev ", " Next ") }
					</td>
				</tr>
			</table>
			<table id="noticeBt">
				<tr>
					<td><input type="button" id=rvwrite value="글쓰기"
						style="border: 1 solid red; font-family: monaco; cursor: pointer; font-weight: bold; font-size: 18px; color: white; background-color: blue; width: 100"
						onMouseOver="this.style.backgroundColor='gray'"
						onMouseOut="this.style.backgroundColor='blue'" /></td>
				</tr>
			</table>
			 <br>
   
            <form id="searchForm">
               <input type="hidden" name="pageNo" id="pageNo" value="${reviewSearchVO.pageNo}" />
               <input type="checkbox" name="searchType" id="searchType" class="check" value="subject" checked="checked"/>제목
               <input type="checkbox" name="searchType" id="searchType" class="check" value="content" />내용
               <input type="text" name="searchKeyword" id="searchKeyword" value="${reviewSearchVO.searchKeyword}"
                     style="color:black;"/>
               <input type="button" id="searchBtn" value="검색" style="color:black; cursor:pointer;"/>      
            </form>
			</nav> </header>
			<footer id="footer"> <span class="copyright">&copy;
				201003011_김형근.</span></footer>
		</div>
	</div>
</body>
</html>