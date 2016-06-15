<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답변 온 메시지 확인하기</title> <!--  메시지 받은 것 (유저와 전문가) 보기 ty -->



	<!-- 1 -->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/css/notice.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		
		
		
<script type="text/javascript" src="/resources/jquery-1.11.3.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#fromUser").click(function(){
		location.href="/message/completeBottle.";
		
	});
	
	$("#fromExpert").click(function(){
		location.href="/message/expertCompleteBottle";
		
	});
	
	<c:if test="${ !loginStatus }">
	alert("로그인이 필요한 서비스 입니다. 로그인 창으로 넘어갑니다.");
	location.href="/member/login?url=/menuselect";
	</c:if>
});

</script>




</head>

	<body class="loading">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">

				<!-- Header -->
					<header id="header">
					
					   <hr>
		               <h2>어떤 유형의 답변 글을 읽을지 선택하세요</h2>
		               <hr>
					
					
					<table>
					<tr><td height="10px"></td></tr> 
					</table>	
					
							<nav>
							
							<input type="button" id="fromUser" value="일반회원 답변(랜덤)"
							style="border:3px solid white; font-family:맑은고딕; cursor:pointer; font-weight:bold;
							font-size:60px; color:white; width: 600px; height: 200px; background-color: rgba( 100, 180, 250, 0.4 );"
							/> 
						
					
							
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							
							<input type="button" id="fromExpert" value="전문가 답변"
							style="border:3px solid white; font-family:맑은고딕; cursor:pointer; font-weight:bold;
							font-size:60px; color:white; width: 600px; height: 200px; background-color: rgba( 100, 180, 250, 0.4 );"
							/> 
							
						
											
						

						<!-- 	<input type="image" id="toUser" src="/resources/image/touser.PNG" />
	
							<input type="image" id="toExpert" src="/resources/image/toexpert.PNG" /> -->
							
							
							
						</nav>
					</header>
									
					<footer id="footer">
						<span class="copyright">&copy; 201003011_김형근.</span>
					</footer>

			</div>
		</div>
</body>
</html>