<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지를 보낼 상대를 골라라</title> <!--  메시지 보낼 상대 (유저와 전문가) 고르기 ty -->



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
	$("#toUser").click(function(){
		location.href="/message/writeMessage";
		
	});
	
	$("#toExpert").click(function(){
		if(confirm("1000원의 비용이 발생합니다. 고민을 작성하시겠습니까?")){
		location.href="/message/writeMessageExpert";
		}
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
					<h2>고민을 보낼 대상을 선택하세요</h2>
		            <hr>
					
					<table>
					<tr><td height="10px"></td></tr> 
					</table>	
					
							<nav>
							
							<input type="button" id="toUser" value="회원"
							style="border:3px solid white; font-family:맑은고딕; cursor:pointer; font-weight:bold;
							font-size:60px; tex color:white; width: 600px; height: 200px; background-color: rgba( 100, 180, 250, 0.4 );"
							onMouseOver="this.value='-50포인트'"
							onMouseOut="this.value='회원에게 보내기'"/> 
						
					
							
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							
							<input type="button" id="toExpert" value="전문가"
							style="border:3px solid white; font-family:맑은고딕; cursor:pointer; font-weight:bold;
							font-size:60px; color:white; width: 600px; height: 200px; background-color: rgba( 100, 180, 250, 0.4 );"
							onMouseOver="this.value='-1000포인트'"
							onMouseOut="this.value='전문가에게 보내기'"/> 
							
						
											
						

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