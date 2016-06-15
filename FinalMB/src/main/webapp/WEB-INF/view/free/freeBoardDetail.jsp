<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 1 -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/css/notice.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<title>자유게시판 상세보기</title>
<script type="text/javascript" src="/resources/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#delete").click(function() {
			
			if (confirm("삭제하시겠습니까?")) {
				
				$("#articleId").val("${article.articleId}");
				$("#deleteForm").attr("method", "post");
				$("#deleteForm").attr("action", "/free/delete");
				$("#deleteForm").submit();
			}
		});

		$("#update").click(function() {
			location.href = "/free/freeBoardUpdate/${article.articleId}"
		});
		
		$("#cancel").click(function() {
			location.href="/free/freeBoardList"
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
	background-color: rgba(60, 130, 255, 0.6);
	width: 50%;
}

#noticeTh {
	z-index: 0;
	background-color: rgba(34, 120, 255, 0.8);
	margin: auto;
	text-align: left;
	width: 50%;
}

#noticeBt {
	z-index: 0;
	/* background-color: rgba( 36, 120, 255, 0.8 ); */
	margin: auto;
	width: 49%;
	color: black;
	text-align: right;
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
			<h2>FreeBoard</h2>
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
				<tr>
					<td height="10px"></td>
				</tr>
			</table>


			<table style="border: 4px solid #5ad2ff" id="noticeTable">
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
				<tr>
					<td height="10px"></td>
				</tr>
			</table>


			<table id="noticeBt">
				<tr>
					<td colspan="2"><c:if
							test="${ article.writer  eq loginMemberVO.memberId }">


							<input type="button" id="update" value="수정"
								style="border: 1 solid red; font-family: monaco; cursor: pointer; font-weight: bold; font-size: 18px; color: white; background-color: blue; width: 100"
								onMouseOver="this.style.backgroundColor='gray'"
								onMouseOut="this.style.backgroundColor='blue'" />

							<input type="button" id="delete" value="삭제"
								style="border: 1 solid red; font-family: monaco; cursor: pointer; font-weight: bold; font-size: 18px; color: white; background-color: blue; width: 100"
								onMouseOver="this.style.backgroundColor='gray'"
								onMouseOut="this.style.backgroundColor='blue'" />


						</c:if> <input type="button" id="cancel" value="목록보기"
						style="border: 1 solid red; font-family: monaco; cursor: pointer; font-weight: bold; font-size: 18px; color: white; background-color: blue; width: 100"
						onMouseOver="this.style.backgroundColor='gray'"
						onMouseOut="this.style.backgroundColor='blue'" />
				</tr>
			</table>


			<form id="deleteForm">
				<input type="hidden" id="articleId" name="articleId" />
			</form>

			</nav> </header>

			<footer id="footer"> <span class="copyright">&copy;
				201003011_김형근.</span> </footer>
		</div>
	</div>
</body>
</html>