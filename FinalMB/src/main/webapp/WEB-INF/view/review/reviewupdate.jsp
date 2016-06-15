<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 게시판</title>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/css/notice.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->

<script type="text/javascript" src="/resources/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#write").click(
								function() {

									var subject = $("#subject").val();
									if (subject == "") {
										alert("제목을 입력하세요.");
										return;
									}
									var content = $("#content").val();
									if (content == "") {
										alert("내용을 입력하세요.");
										return;
									}

									$("#updateArticleForm").attr("method",
											"post");
									$("#updateArticleForm").attr("action",
											"/review/doUpdate");
									$("#updateArticleForm").submit();
								});

						$("#cancel")
								.click(
										function() {
											location.href = "/review/reviewdetail/${originalArticle.articleId }"
										});
					});
</script>
<style type="text/css">
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
	background-color: rgba(36, 120, 255, 0.8);
	margin: auto;
	text-align: center;
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
			<h2>공지 사항</h2>
			<hr>
			<nav>

			<form id="updateArticleForm">
				<input type="hidden" id="articleId" name="articleId"
					value="${ originalArticle.articleId }" />

				<table style="border: 3px solid #5ad2ff" id="noticeTh">
					<tr>
						<th>제목<input type="text" id="subject" name="subject"
							style="width: 100%; color: black;" placeholder="제목을 입력하시오."
							value="${ originalArticle.subject }" />
						</th>
					</tr>
					<tr>
						<th>작성자<input type="text" id="writer" name="writer"
							style="width: 100%; color: black;"
							value="${ originalArticle.writer }" readonly="readonly" />
						</th>
					</tr>
					<tr>
						<td>내용<textarea id="content" name="content" rows="11"
								cols="15" style="resize: none; width: 100%; color: black;"
								placeholder="내용을 넣으세요.">${ originalArticle.content }</textarea>
						</td>
					</tr>
					<tr>

						<th colspan="2" align="center"><input type="button"
							id="write" value="수정 완료"
							style="border: 1 solid red; font-family: monaco; cursor: pointer; font-size: 22px; color: white; background-color: blue; width: 49%;"
							onMouseOver="this.style.backgroundColor='gray'"
							onMouseOut="this.style.backgroundColor='blue'" /> <input
							type="button" id="cancel" value="수정 취소"
							style="border: 1 solid red; font-family: monaco; cursor: pointer; font-size: 22px; color: white; background-color: blue; width: 49%;"
							onMouseOver="this.style.backgroundColor='gray'"
							onMouseOut="this.style.backgroundColor='blue'" /></th>
					</tr>
				</table>
			</form>
</body>
</html>