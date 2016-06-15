<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전문가 메시지 확인</title>

<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/css/notice.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		
<script type="text/javascript" src="/resources/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

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
	width: 80%;
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

				<nav>
				
					<h2>총 ${MessageList.paging.totalCount} 개의 상담이 대기중입니다.</h2>
					
					<br>

			
	<table id="noticeTable" style="border: 3px solid #5ad2ff">
			
				    <colgroup>
		        <col width="20%"/>
		        <col width="15%"/>
		        <col width="15%"/>
		 
		    </colgroup>

	<thead>
		<tr id="noticeTh" height="50px">
			<th scope="col">메세지 번호</th>
		    <th scope="col">메시지 제목</th>
			<th scope="col">메세지 보낸 날짜</th>
			
		</tr>
	</thead>	
			

			<c:if test = "${ empty MessageList }" >
			<tr>
				<td colspan="6"> 내용이 없습니다.</td>
			</tr>
			</c:if>
			
			<c:if test = "${ not empty MessageList }" >
			<c:forEach items="${MessageList.messageList}" var="messageVO">  
				<tr>
					<td><a href="/message/expertPickupDetail/${messageVO.expertMessageId}">${messageVO.expertMessageId}</a></td>	
					<td><a href="/message/expertPickupDetail/${messageVO.expertMessageId}">${messageVO.expertSendSubject}</a></td>	
					<td>${messageVO.sendWriteDate}</td>	
				
				</tr>
			</c:forEach>
			</c:if>
			<tr id="noticeTh">
					<td colspan="4">${ MessageList.paging.getPagingList("pageNo", " [ @ ] " , " Prev ", " Next ")}
				</td>
				</tr>
			


		
</table>
		
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