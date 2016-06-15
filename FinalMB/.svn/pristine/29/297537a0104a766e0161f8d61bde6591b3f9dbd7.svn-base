<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>운영자 게시판</title>
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
			$("#updateArticleForm").attr("action", "/notice/doUpdate");
			$("#updateArticleForm").submit();
			
		});
	});
</script>
<style type="text/css">
table, th, td {
    border: 1px solid black;
    text-align: left;
}
table {
    width: 260px;
    margin: auto;
}
td{
    width:300px;
    height:300px;
    text-align: left;
}
h2 {
    text-align: center;
}
</style>
</head>
<body>

<br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>


	<h2>공지 사항</h2>
	<form id="updateArticleForm">
	
	<input type="hidden" id="articleId" name="articleId" value="${ originalArticle.articleId }" />
	<table>
		<tr>
		<th> 제목<input type="text" id="subject" name="subject"
				placeholder="제목을 입력하시오." value="${ originalArticle.subject }"/> </th></tr>
		<tr>
		<th> 작성자<input type="text" id="writer" name="writer" value="운영자" readonly = "readonly"/> </th></tr>
		<tr>
		<td> 내용<textarea id="content" name="content" rows="17" cols="35" style="resize:none;"
				placeholder="내용을 넣으세요.">${ originalArticle.content }</textarea> </td></tr>
		<tr>
		<th><input type="button" id="write" value="완료" /> </th></tr>
	</table>
	</form>
	

</body>
</html>