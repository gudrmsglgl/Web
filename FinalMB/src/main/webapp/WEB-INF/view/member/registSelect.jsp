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
	$("#userRegist").click(function(){
		location.href="/member/regist";
		
	});
	
	$("#expertRegist").click(function(){
		location.href="/member/expertRegist";
	});
	
	
});

</script>


<style>


#tableCenter {
		z-index: 0;
		margin: auto;
		text-align: left;
		width: 200px;
}


#noticeHead1 {
		
		z-index: 0;
		background-color: red;
		margin: auto;
		text-align: center;
		font-size: 20pt;
		width: 200px;
}


#noticeHead2 {

		z-index: 0;
		background-color: green;
		margin: auto;
		text-align: center;
		font-size: 20pt;
		width: 500px;

}


#noticeTh {
		z-index: 0;
		background-color: rgba( 34, 120, 255, 0.1 );
		margin: auto;
		text-align: center;
		width: 500px;
		font-size: 15pt;	
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
					
					   <hr>
					   <h2>고민상담의 미래</h2>
					   <hr>
		               <h2>MAB에 오신 것을 환영합니다.</h2>
		               <hr>
					
					<table>
					<tr><td height="10px"></td></tr> 
					</table>	
					
							<nav>
							
							<table id = "tableCenter"  >
							
							<tr>
							
							<td>
							
							<table id = "noticeHead1" >
						
							</table>
							
							<table id = "noticeTh">
		
							<tr>
	
							<td>
							
							<input type="button" id="userRegist" value="일반 회원가입"
							style="border:6 solid red ; font-family:monaco; cursor:pointer; font-weight:bold;
							font-size:21px; color:white ; background-color:#ff4646; width: 700px; height: 50px;"/> 
							
							</td>
							</tr>
							</table>
							
								<table>
					<tr><td height="40px"></td></tr> 
					</table>
					
							<table id = "noticeHead2">
						
							</table>
							
							<table id = "noticeTh">
							<tr>
							<td>
							<input type="button" id="expertRegist" value="전문가 회원가입"
							style="border:6 solid red ; font-family:monaco; cursor:pointer; font-weight:bold;
							font-size:21px; color:white ; background-color:#228b22; width: 700px; height: 50px;"/> 
							</td>
							</tr>
							</table>
			
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