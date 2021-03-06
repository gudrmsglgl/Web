
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>표류중인 나의 메시지</title>

<!-- 공지사항 css 적용 요망 11/17 강프로    main.css -> notice.css -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/css/notice.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->

<script type="text/javascript" src="/resources/jquery-1.11.3.js"></script>
<script type="text/javascript">

<c:if test="${ !loginStatus }">
alert("로그인이 필요한 서비스 입니다. 로그인 창으로 넘어갑니다.");
	location.href="/member/login?url=/menuselect";
</c:if>

</script>
<style>
body {
	font-size: 22px;
}

#noticeTable {
	/* margin-left: 600px; */
	margin: auto;
	z-index: 0;
	width: 90%;
	background-color: rgba(40, 120, 255, 0.4);
}

#deleteTh {
	z-index: 0;
	background-color: rgba(36, 120, 255, 0.8);
	margin: auto;
	z-index: 0;
	width: 90%;
}

#deleteBt {
	z-index: 0;
	background-color: rgba(36, 120, 255, 0.8);
	margin: auto;
	text-align: center;
	width: 90%;
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
				<h2>Delete Message Box</h2>
				이곳은 아직 답변이 완료되지 않은 회원님의 메세지가 표시가 됩니다. <br>
				총${unsolved.paging.totalCount} 개 의 메세지가 표류 중 입니다.
				<hr>
				<nav>



					<table id="noticeTable">
						<tr>

							<td colspan="2" class="center"><input type="button"
								id="receiveBottle" value="답변받은 메세지 보관함"
								onclick="location.href= '/message/receivebbox'"
								style="border: 1 solid red; font-family: monaco; cursor: pointer; font-size: 22px; color: white; background-color: blue; width: 60%;"
								onMouseOver="this.style.backgroundColor='gray'"
								onMouseOut="this.style.backgroundColor='blue'" /></td>

							<td colspan="2" class="center"><input type="button"
								id="sendBottle" value="답변보낸 메세지 보관함"
								onclick="location.href= '/message/sendbbox'"
								style="border: 1 solid red; font-family: monaco; cursor: pointer; font-size: 22px; color: white; background-color: blue; width: 60%;"
								onMouseOver="this.style.backgroundColor='gray'"
								onMouseOut="this.style.backgroundColor='blue'" /></td>

							<td colspan="2" class="center"><input type="button"
								id="deleteBottle" value="사라진 메세지"
								onclick="location.href= '/message/deletebbox'"
								style="border: 1 solid red; font-family: monaco; cursor: pointer; font-size: 22px; color: white; background-color: blue; width: 60%;"
								onMouseOver="this.style.backgroundColor='gray'"
								onMouseOut="this.style.backgroundColor='blue'" /></td>

							<td colspan="2" class="center"><input type="button"
								id="unsolvedBottle" value="표류중인 메시지"
								onclick="location.href= '/message/unsolvedMessagebbox'"
								style="border: 1 solid red; font-family: monaco; cursor: pointer; font-size: 22px; color: white; background-color: red; width: 60%;"
								onMouseOver="this.style.backgroundColor='gray'"
								onMouseOut="this.style.backgroundColor='red'" /></td>
						</tr>
					</table>


					<table>
						<tr>
							<td height="20px"></td>
						</tr>
					</table>



					<table id="noticeTable" style="border: 3px solid #5ad2ff">

						<colgroup>
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="25%" />

							<col width="3%" />
						</colgroup>

						<thead>
							<tr id="deleteTh" height="50px" style="font-size:18pt;">
								<th scope="col">카테고리</th>
								<th scope="col">키워드1</th>
								<th scope="col">키워드2</th>
								<th scope="col">보낸 날짜</th>
								<th scope="col">내가 쓴 글</th>
								<th scope="col"></th>
							</tr>
						</thead>


						<c:if test="${ empty unsolved }">
							<tr>
								<td colspan="6">내용이 없습니다.</td>
							</tr>
						</c:if>


						<c:if test="${ not empty unsolved }">
							<c:forEach items="${unsolved.messageList }" var="messageVO">
								<tr height="50px" style="font-size:18pt;">
									<td style="vertical-align: middle;">${messageVO.categoryId}</td>
									<td style="vertical-align: middle;">${messageVO.keywordFirst}</td>
									<td style="vertical-align: middle;">${messageVO.keywordSecond}</td>
									<td style="vertical-align: middle;">${messageVO.sendWriteDate}</td>
									<td style="vertical-align: middle;">
									
									<textarea
											style="color: black; width: 80%; resize: none; margin: 5px; vertical-align: middle;"
											rows="3">${messageVO.sendContent}</textarea></td>


									<td style="vertical-align: middle;"><input type="button"
										id="delete" value="삭제"
										style="font-size:16pt; border: 1 solid red; font-family: monaco; cursor: pointer; font-weight: bold; font-size: 18px; color: white; background-color: blue;"
										onMouseOver="this.style.backgroundColor='gray'"
										onMouseOut="this.style.backgroundColor='blue'" /></td>

								</tr>
							</c:forEach>
						</c:if>
					</table>

					<table border="1" id="deleteTh">
						<tr>
							<td colspan="6" class="center">${ unsolved.paging.getPagingList("pageNo","[@]", "◀-", "-▶") }
							</td>
						</tr>
					</table>

				</nav>
			</header>

			<footer id="footer">
				<span class="copyright">&copy; 201003011_김형근.</span>
			</footer>
		</div>
	</div>

</body>
</html>
