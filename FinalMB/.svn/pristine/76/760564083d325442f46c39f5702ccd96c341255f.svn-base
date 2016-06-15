<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>
<!-- 1 -->
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

			$("#updateArticleForm").attr("method", "post");
			$("#updateArticleForm").attr("action", "/free/doUpdate");
			$("#updateArticleForm").submit();
		});
		
		$("#cancel").click(function() {
			location.href="/free/freeBoardList"
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
				<h2>자유게시판 글 수정</h2>
				<hr>

				<nav>

					<form id="updateArticleForm">

						<input type="hidden" id="articleId" name="articleId"
							value="${ originalArticle.articleId }" />

						<table style="border: 3px solid #5ad2ff" id="noticeTh">
							<tr>

								<th>제목<input type="text" id="subject" name="subject"
									style="width: 100%; color: black;"
									value="${ originalArticle.subject }" />
								</th>

							</tr>

							<tr>
								<th>작성자<input type="text" id="writer" name="writer"
									style="width: 100%; color: black;"
									value="${originalArticle.writer}" readonly="readonly" />
								</th>
							</tr>
							<tr>

								<td><textarea id="content" name="content" rows="11"
										cols="15" style="resize: none; width: 100%; color: black;"
										placeholder="내용을 넣으세요.">${ originalArticle.content }</textarea>
								</td>
							</tr>
							<tr>


								<th colspan="2" align="center"><input type="button" id="write" value="수정완료"
									style="border: 1 solid red; font-family: monaco; cursor: pointer; font-size: 22px; color: white; background-color: blue; width: 49%;"
									onMouseOver="this.style.backgroundColor='gray'"
									onMouseOut="this.style.backgroundColor='blue'" />
								<input type="button" id="cancel" value="취소"
									style="border: 1 solid red; font-family: monaco; cursor: pointer; font-size: 22px; color: white; background-color: blue; width: 49%;"
									onMouseOver="this.style.backgroundColor='gray'"
									onMouseOut="this.style.backgroundColor='blue'" /></th>

							</tr>
						</table>
					</form>

				</nav>
			</header>
		</div>
	</div>

</body>
</html>