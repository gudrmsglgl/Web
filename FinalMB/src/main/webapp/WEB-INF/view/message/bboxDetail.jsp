<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>보관함 상세보기</title>

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

th,td {
	font-size: 18pt !important;
	font-family: "맑은 고딕" !important;
}

#noticeTable {
      /* margin-left: 600px; */
      margin: auto;
      z-index: 0;
      width: 90%;	
      background-color: rgba( 40, 120, 255, 0.1 );
      }

#bboxTh {
	z-index: 0;
	background-color: rgba(34, 120, 255, 0.8);
	margin: auto;
	text-align: left;
	width: 50%;
	color: black;
}

#bboxBt {
	z-index: 0;
	background-color: rgba(36, 120, 255, 0.8);
	margin: auto;
	text-align: center;
	width: 70%;
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
			<h2>답변 받은 메세지 상세보기</h2>
			<hr>
			<nav>

<table id="noticeTable" >
	<tr>
	
	<td colspan="2" class="center">
	<input type="button" id="receiveBottle" value="답변받은 메세지 보관함" onclick="location.href= '/message/receivebbox'"
	style="border:1 solid red ; font-family:monaco; cursor:pointer;
			font-size:22px; color:white ; background-color:red ; 
			width: 60%;" 
			onMouseOver="this.style.backgroundColor='gray'" 
			onMouseOut="this.style.backgroundColor='red'"/>
	</td>
	
	<td colspan="2" class="center">
	<input type="button" id="sendBottle" value="보낸 메세지 보관함" onclick="location.href= '/message/sendbbox'"
	style="border:1 solid red ; font-family:monaco; cursor:pointer;
			font-size:22px; color:white ; background-color:blue ; 
			width: 60%;" onMouseOver="this.style.backgroundColor='gray'" 
			onMouseOut="this.style.backgroundColor='blue'"/>
	</td>
		
	<td colspan="2" class="center">
	<input type="button" id="deleteBottle" value="사라진 메세지" onclick="location.href= '/message/deletebbox'"
	style="border:1 solid red ; font-family:monaco; cursor:pointer;
			font-size:22px; color:white ; background-color:blue ; 
			width: 60%;" onMouseOver="this.style.backgroundColor='gray'" 
			onMouseOut="this.style.backgroundColor='blue'"/>
	</td>
	
	<td colspan="2" class="center">
	<input type="button" id="unsolvedBottle" value="표류중인 메시지" onclick="location.href= '/message/unsolvedMessagebbox'"
	style="border:1 solid red ; font-family:monaco; cursor:pointer;
			font-size:22px; color:white ; background-color:blue ; 
			width: 60%;" onMouseOver="this.style.backgroundColor='gray'" 
			onMouseOut="this.style.backgroundColor='blue'"/>
	</td>
	
	
	</tr>
	</table>


	<table>
	<tr><td height="20px"></td></tr> 
	</table>	


	
	
<table id="bboxBt" style="border: 3px solid #5ad2ff">

	<tr>
		<th>고민 작성날짜:</th>
		<td>${messageVO.sendWriteDate}</td>
		
	</tr>
	
	
	
	<tr>
		<th colspan="2" align="center">고민 내용</th>
	</tr>
	
	<tr>
		<td><textarea id="textarea" rows="5" cols="10"  style="color:black; width: 242%; resize: none;" readonly="readonly">${messageVO.sendContent}</textarea></td>
	</tr>
	
	<tr>
		<th>답변 받은 날짜:</th>
		<td>${messageVO.receiveWriteDate}</td>
	</tr>
	
	<tr>
		<th colspan="2" align="center">답변 내용</th>
	</tr>
	
	<tr>
		<td><textarea id="textarea" rows="5" cols="10"  style="color:black; width: 242%; resize: none;" readonly="readonly">${messageVO.receiveContent}</textarea></td>
	</tr>


</table>
</nav>
</header>

			<footer id="footer"> <span class="copyright">&copy;
				201003011_김형근.</span> </footer>
		</div>
	</div>

</body>
</html>