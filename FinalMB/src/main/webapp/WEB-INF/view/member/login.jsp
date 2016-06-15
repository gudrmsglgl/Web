<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인을 하세요♥</title>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css" />

<script type="text/javascript" src="/resources/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#registSelect").click(function() {
			location.href = "/member/registSelect";
		});

		var errorCode = "${errorCode}";

		if (errorCode == "1") {
			alert("ID가 틀렸습니다.");
		}
		if (errorCode == "2") {
			alert("비밀번호가 틀렸습니다.");
		}

		$("#login").click(function() {

			var memberId = $("#memberId").val();
			var password = $("#password").val();

			if (memberId == "") {
				alert("ID를 입력하세요.");
				return;
			}
			if (password == "") {
				alert("PW를 입력하세요.");
				return;
			}
			$("#loginForm").attr("method", "post");
			$("#loginForm").attr("action", "/doLogin");
			$("#loginForm").submit();
		});

	});
</script>

<style>
.control-label {
	z-index: 1;
	font-family: "나눔고딕";
	font-size: 29px;
	color: white;
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
						<h1>Message in A Bottle</h1>
						<br>
						<h2>익명을 존중하는 유저들이 만들어가는 고민 상담소</h2>
		
						<form id="loginForm" style="align:center;">
		
							<c:if test="${ not empty url }">
								<input type="hidden" id="url" name="url" value="${url}" />
							</c:if>
								
	            			
	            			 <br>
							 <input type="text" id="memberId" 
							 style="color:black; width:450px; " 
							 autocomplete="off" name="memberId" placeholder=" ID"> 
							
								
							<table>
							<tr><td height="5px"></td></tr> 
							</table>
							
							 <input type="Password" id="memberPassword" 
							 style="color:black; width:450px; "
							 name="memberPassword" placeholder=" Password">
							
							
							<table>
							<tr><td height="10px"></td></tr> 
							</table>
							
					
							<button type="submit" style="font-family:monaco; cursor:pointer; 
							font-size:18px; color:white ; background-color:blue;
							width: 210px; height:40px;"  onMouseOver="this.style.backgroundColor='gray'" 
							onMouseOut="this.style.backgroundColor='blue'"
							id="login">Enter The MAB!!</button>
							
				            &nbsp;&nbsp;&nbsp;
				    
							<button type="button" style="font-family:monaco; cursor:pointer; 
							font-size:18px; color:white ; background-color:blue;
							width: 210px; height:40px;"  onMouseOver="this.style.backgroundColor='gray'" 
							onMouseOut="this.style.backgroundColor='blue'"
							id="registSelect">회원가입</button>
		
						</form>
					</header>
					
					
					
					<footer id="footer">
						<span class="copyright">&copy; 201003011_김형근.</span>
					</footer>

			</div>
		</div>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script>
			window.onload = function() { document.body.className = ''; }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		
			</script>
		
</body>
</html>
