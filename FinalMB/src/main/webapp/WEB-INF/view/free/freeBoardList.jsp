<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 1 -->
<title>자유게시판 상세보기</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/css/notice.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->

<script type="text/javascript" src="/resources/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#write").click(function() {
		<c:if test="${ !loginStatus }">
		alert("로그인이 필요한 서비스 입니다. 로그인 창으로 넘어갑니다.");
		location.href="/member/login?url=/menuselect";
		</c:if>
		
		<c:if test="${loginStatus}">
		location.href = "/free/freeBoardWrite";
		</c:if>
	});
	
	$("#searchBtn").click(function() {
        $("#searchForm").attr("method", "post");
        $("#searchForm").attr("action", "<c:url value="/free/freeBoardList" />");
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

			<!-- Header -->
			<header id="header">
				<hr>
				<h1>Free Board</h1>
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
							<tr id="noticeTh" height="50px">
								<th scope="col">글번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>

						<c:if test="${ empty freeList.freeList }">
							<tr>
								<td>게시글이 없습니다.</td>
							</tr>
						</c:if>

						<c:if test="${ not empty freeList.freeList }">
							<c:forEach items="${ freeList.freeList }" var="freeVO">
								<tr height="50px">
									<td>${freeVO.articleId}<br /></td>
									<td style="text-align: left;"><a
										href="/free/freeBoardDetail/${freeVO.articleId}"> ${ freeVO.subject }</a><br /></td>
									<td>${ freeVO.writer }<br /></td>
									<td>${ freeVO.writeDate }<br /></td>
								</tr>
							</c:forEach>
						</c:if>
						<tr id="noticeTh">
							<td colspan="4">${ freeList.paging.getPagingList("pageNo", " [ @ ] " , " Prev ", " Next ")}
							</td>
						</tr>
					</table>
					<table id="noticeBt">
						<tr>
							<td><input type="button" id="write" value="글쓰기"
								style="border: 1 solid red; font-family: monaco; cursor: pointer; font-weight: bold; font-size: 18px; color: white; background-color: blue; width: 100"
								onMouseOver="this.style.backgroundColor='gray'"
								onMouseOut="this.style.backgroundColor='blue'" /></td>
						</tr>
					</table>
					
					 <br>
   
            <form id="searchForm">
               <input type="hidden" name="pageNo" id="pageNo" value="${freeSearchVO.pageNo}" />
               <input type="checkbox" name="searchType" id="searchType" class="check" value="subject" checked="checked"/>제목
               <input type="checkbox" name="searchType" id="searchType" class="check" value="content" />내용
               <input type="text" name="searchKeyword" id="searchKeyword" value="${freeSearchVO.searchKeyword}"
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