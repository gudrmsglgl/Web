<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
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

$(document).ready(function() {
	$("#delete").click(function() {
		
		if( confirm("정말 삭제하겠습니까?")) {
			$("#articleId").val("${ article.articleId }");
			
			$("#deleteForm").attr("method", "post");
			$("#deleteForm").attr("action", "/notice/delete");
			$("#deleteForm").submit();
		}
	});
	
	$("#update").click(function() {
		// 브라우저의 페이지를 변경한다.
		location.href ="/notice/update/${article.articleId}"
	});
	
	$("#list").click(function() {
		// 브라우저의 페이지를 변경한다.
		location.href ="/notice/list"
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
		text-align: left;
		background-color: rgba( 60, 130, 255, 0.6 );
		width: 50%;
		}
		
#noticeTh {
		z-index: 0;
		background-color: rgba( 34, 120, 255, 0.8 );
		margin: auto;
		text-align: left;
		width: 50%;	
}

#noticeBt {
		z-index: 0;
		margin: auto;
		text-align: right;
		width: 50%;	
		color: black;
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
				<h2>Notice</h2>
				<hr>
		<nav>
		
		
		<table style="border: 3px solid #5ad2ff" id="noticeTh">
		
		<tr height="50px">
			<!-- <th>제목</th> -->
			<td>제목 : ${ article.subject }</td>
		</tr>
		
		</table>
		
		<table style="border: 1px solid #5ad2ff" id="noticeTh">
			<tr height="50px">	
				<td>작성자 : ${ article.writer }</td>
			</tr>
		</table>
		
		
		<table style="border: 3px solid #5ad2ff" id="noticeTh">
			<tr height="50px">	
				<!-- <th>등록일</th> -->
				<td>작성 날짜 : ${ article.writeDate }</td>
			</tr>
		</table>
		
		<table>
			<tr height="10px">	<td height="10px"></td></tr> 
		</table>
		
		
		<table style="border: 4px solid #5ad2ff" id="noticeTable" >
			<tr>
				<!-- <th>내용</th> -->
				<td>내용 : </td>
			</tr>
			
			<tr>
				<td>
				${ article.content }
				</td>	
			</tr>
		</table>
	
		<table>
		<tr><td height="10px"></td></tr> 
		</table>
	
	
	
	<!-- 버튼 부분에 공지사항 으로 넘어가는 글리스트 버튼 추가  by kangpro-->
	
	<table id="noticeBt">
	<tr>
	
	
	<td colspan="2">
	
	<c:if test="${loginMemberVO.memberId eq 'admin'}">
	
	<input type="button" id="delete" value="Delete" 
	style="border:1 solid red ; font-family:monaco; cursor:pointer;
	font-size:21px; color:white ; background-color:blue ; 
	width:100" onMouseOver="this.style.backgroundColor='gray'" 
	onMouseOut="this.style.backgroundColor='blue'"/>
	
	
	<input type="button" id="update" value="Update" 
	style="border:1 solid red ; font-family:monaco; cursor:pointer;
	font-size:21px; color:white ; background-color:blue ; 
	width:100" onMouseOver="this.style.backgroundColor='gray'" 
	onMouseOut="this.style.backgroundColor='blue'"/>
	
	</c:if>
	
	<input type="button" id="cancel" value="목록보기"
						style="border: 1 solid red; font-family: monaco; cursor: pointer; font-weight: bold; font-size: 18px; color: white; background-color: blue; width: 100"
						onMouseOver="this.style.backgroundColor='gray'"
						onMouseOut="this.style.backgroundColor='blue'" />
	</td>
	
	</tr>
	</table>
	
		<form id="deleteForm">
			<input type="hidden" id="articleId" name="articleId" />
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