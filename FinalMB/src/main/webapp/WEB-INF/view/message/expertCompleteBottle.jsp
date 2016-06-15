<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전문가에게 온 답변</title>

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
	$("#delete").click(function() {

		if (confirm("정말 삭제 하시겠습니까?")) {
			if (confirm("정말 정말 삭제 하시겠습니까??")) {
			
			$("#expertMessageId").val("${ messageVO.expertMessageId }");

			$("#deleteForm").attr("method", "post");
			$("#deleteForm").attr("action", "/message/deleteMine");
			$("#deleteForm").submit();
		}
	}

	});

});



<c:if test="${ !loginStatus }">
alert("로그인이 필요한 서비스 입니다. 로그인 창으로 넘어갑니다.");
	location.href="/member/login?url=/menuselect";
</c:if>

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
	background-color: rgba(255, 19, 19, 0.8);
	margin: auto;
	width: 50%;
}


#noticeBt {
	z-index: 0;
	/* background-color: rgba( 36, 120, 255, 0.8 ); */
	margin: auto;
	width: 50%;
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

			<header id="header"> <br>
			<hr>
			<h2>전문가에게 돌아온 메세지</h2>
			<hr>

			<nav> <c:if test="${ empty messageList  }">
				<td>내용이 없습니다.</td>
			</c:if> 
			<c:if test="${ not empty messageList  }">
				<c:forEach items="${messageList.messageList}" var="messageVO">
					<form id="writeArticleForm">
						<table style="border: 1px solid #5ad2ff; font-size:18pt;" id="noticeTh">
							<tr height="50px">
								<th>메시지 번호 : ${messageVO.expertMessageId}</th>
							</tr>
						</table>
						
						<table style="border: 1px solid #5ad2ff; font-size:18pt;" id="noticeTh">
							<tr height="50px">
								
								<th>고민 작성 날짜 : ${messageVO.sendWriteDate}</th>
							</tr>
						</table>
						
						<table style="border: 1px solid #5ad2ff; font-size:18pt; text-align: left;" id="noticeTh">
							<tr height="50px">
								<th>&nbsp;&nbsp;${messageVO.expertSendSubject}</th>
							</tr>
						</table>
						
						<table style="border: 1px solid #5ad2ff" id="noticeTh">
							<td colspan="2"><textarea id="textarea" rows="4"
									style="resize: none; color: black; width: 100%;"
									readonly="readonly">${messageVO.expertSendContent}</textarea></td>
						</table>
						
						<br>
						
						<table style="border: 1px solid #5ad2ff; font-size:18pt;" id="noticeTh">
							<tr height="50px">
								<th>답변 받은 날짜 : ${messageVO.receiveWriteDate}</th>
							</tr>
						</table>
						
						<table style="border: 1px solid #5ad2ff; font-size:18pt; text-align: left;" id="noticeTh">
							<tr height="50px">
								<th>&nbsp;&nbsp;${messageVO.expertReceiveSubject}</th>
								
							</tr>
						</table>
						<table style="border: 1px solid #5ad2ff; font-size:18pt;" id="noticeTh">
							<tr height="50px">
								<td colspan="2"><textarea id="textarea" rows="4" cols="22"
										style="resize: none; width: 100%; color: black;"
										readonly="readonly">${messageVO.expertReceiveContent}</textarea></td>
							</tr>
						</table>
						
						
							<table>
							<tr>
							<td height="6px"></td>
							</tr>
							</table>
						
						<table style="border: 1px solid #5ad2ff" id="noticeTh">
						<tr>
						<td>${messageList.paging.getPagingList("pageNo"," [@] ", "◀-", "-▶")}</td>
						</tr>
						</table>
						
						<table id="noticeBt">
						<tr>
							<td><input type="button" id="delete" value="삭제"
								style="border: 4 solid red; font-family: monaco; cursor: pointer; 
								font-weight: bold; font-size: 20px; color: white; background-color: blue; width: 200"
								onMouseOver="this.style.backgroundColor='gray'"
								onMouseOut="this.style.backgroundColor='blue'" /></td>
						</tr>
						</table>
						
						
						
						
					</form>
				</c:forEach>
			</c:if> <br>
			</nav> </header>
			
				<form id="deleteForm">
						<input type="hidden" id="messageId" name="messageId" />
						</form>
			
			
			<footer id="footer"> <span class="copyright">&copy;
				201003011_김형근.</span></footer>
			<br> <br>
		</div>
	</div>
</body>
</html>
