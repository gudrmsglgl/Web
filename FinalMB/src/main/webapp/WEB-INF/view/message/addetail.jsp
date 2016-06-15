<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>

<head>




<!-- 공지사항 css 적용 요망 11/17 강프로    main.css -> notice.css -->

<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/css/notice.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/jquery-1.11.3.js"></script>
<script type="text/javascript">


	$(document).ready(function() {
		$("#delete").click(function() {

			if (confirm("정말 삭제하겠습니까?")) {
				$("#messageId").val("${ messageVO.messageId }");

				$("#deleteForm").attr("method", "post");
				$("#deleteForm").attr("action", "/message/delete");
				$("#deleteForm").submit();
			}

		});

	});
	
	
</script>
<title>관리자 게시판 상세보기</title>

<style>

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
				<h2>관리자 페이지(일반회원)</h2>
				<hr>

				<nav>
				
		<table style="border: 3px solid #5ad2ff" id="noticeTh">
		<tr>
			<th>메세지 아이디</th>
			<td>${messageVO.messageId}</td>
		</tr>
		
		<tr>
			<th>카테고리</th>
			<td>${messageVO.categoryId}</td>
		</tr>
		<tr>
			<th>키워드1</th>
			<td>${messageVO.keywordFirst}</td>
		</tr>
		<tr>
			<th>키워드2</th>
			<td>${messageVO.keywordSecond}</td>
		</tr>
		<tr>
			<th>작성자 아이디</th>
			<td>${messageVO.sendMemberId}</td>
		</tr>
		<tr>
			<th>작성 날짜</th>
			<td>${messageVO.sendWriteDate}</td>
		</tr>
		<tr>
			<th>답변자 아이디</th>
			<td>${messageVO.receiveMemberId}</td>
		</tr>
		<tr>
			<th>답변자 아이디</th>
			<td>${messageVO.receiveWriteDate}</td>
		</tr>
		<tr>
			<th>고민 내용</th>
			<td>${messageVO.sendContent}</td>
		</tr>
		<tr>
			<th>답변 내용</th>
			<td>${messageVO.receiveContent}</td>
		</tr>

		<tr>
			
			<td><input type="button" id="delete" value="메세지 삭제"
				style="border: 4 solid red; font-family: monaco; cursor: pointer; 
				font-weight: bold; font-size: 20px; color: white; background-color: blue; width: 200"
				onMouseOver="this.style.backgroundColor='gray'"
				onMouseOut="this.style.backgroundColor='blue'"/></td>
		</tr>

	</table>
				
				
				
				
				
				
				
				</nav>
				
</header>


			<footer id="footer">
				<span class="copyright">&copy; 201003011_김형근.</span>
			</footer>

</div>

</div>


	<form id="deleteForm">
		<input type="hidden" id="messageId" name="messageId" />
	</form>

	<!--      부트스트랩 사용     -->


</body>
</html>