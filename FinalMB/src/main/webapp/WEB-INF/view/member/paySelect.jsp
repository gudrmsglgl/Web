<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 화면</title>



<!-- 공지사항 css 적용 요망 11/17 강프로    main.css -> notice.css -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/css/notice.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->



<script type="text/javascript" src="/resources/jquery-1.11.3.js"></script>
<script type="text/javascript">


$(document).ready(function(){
	$("#pay1000").click(function(){
		if(confirm("결제화면으로 넘어갑니다.")){
		location.href="/member/pay1000";
		}
	});
	
	$("#pay2000").click(function(){
		if(confirm("결제화면으로 넘어갑니다.")){
		location.href="/member/pay2000";
		}
	});
	
	$("#pay3000").click(function(){
		if(confirm("결제화면으로 넘어갑니다.")){
		location.href="/member/pay3000";
		}
	});
	
	$("#pay4000").click(function(){
		if(confirm("결제화면으로 넘어갑니다.")){
		location.href="/member/pay4000";
		}
	});
	
	
	<c:if test="${ !loginStatus }">
	alert("로그인이 필요한 서비스 입니다. 로그인 창으로 넘어갑니다.");
	location.href="/member/login?url=/menuselect";
	</c:if>
});


</script>


<style> 

	
	
/* #infoTable {
		
		margin: auto;
		z-index: 0;
		text-align: left;
		background-color: rgba( 60, 130, 255, 0.6 );
		width: 50%;
		} */
		
#infoTh {
		z-index: 0;
		background-color: rgba( 10, 10, 20, 0.7 );
		margin: auto;
		width: 50%;	
		font-family: "monaco"; 
		font-size: 30px;
		
}



</style>


</head>

<body class="loading">

	
		<div id="wrapper">
		<div id="bg"></div>
		<div id="overlay"></div>
		<div id="main">

		<header id="header">
		<nav>
			<hr>
			<h1>결제</h1>
			<hr>
			<br>
					

            <table  id="infoTh" >
                <tr>
   
                <tr>
                  <td style="text-align: center; border: 5px solid #8ae634;  width: 30%;">&nbsp;1000 point</td>
                 
                   <td>	
                    <input type="button" id="pay1000" value="1000포인트 충전"
							style="border:6 solid red ; font-family:맑은고딕; cursor:pointer; font-weight:bold;
							font-size:20px; color:black ; background-color:#8ae634; width: 99%; height: 40px;"
							onMouseOver="this.value='500 &#8361 결제'"
							onMouseOut="this.value='1000 포인트 충전'"/> 
				   </td>
                </tr>
               </table>
                
             
            <table>
				<tr>
					<td height="10px"></td>
				</tr>
			</table>
                
                
                
                <table  id="infoTh" >
                <tr>
                  <td style="text-align: center; border: 5px solid #8ae634;  width: 30%;">&nbsp;2000 point</td>
                  <td> <input type="button" id="pay2000" value="2000포인트 충전"
							style="border:6 solid red ; font-family:맑은고딕; cursor:pointer; font-weight:bold;
							font-size:20px; color:black ; background-color:#8ae634; width: 99%; height: 40px;"
							onMouseOver="this.value='950 &#8361 결제'"
							onMouseOut="this.value='2000 포인트 충전'"/> </td>
                </tr>
                </table>
                
                
            	<table>
				<tr>
					<td height="10px"></td>
				</tr>
			</table>    
                
                
                
                <table  id="infoTh" >
                <tr>
                  <td style="text-align: center; border: 5px solid #8ae634;  width: 30%;">&nbsp;3000 point</td>
                  <td> <input type="button" id="pay3000" value="3000포인트 충전"
							style="border:6 solid red ; font-family:맑은고딕; cursor:pointer; font-weight:bold;
							font-size:20px; color:black ; background-color:#8ae634; width: 99%; height: 40px;"
							onMouseOver="this.value='1400 &#8361 결제'"
							onMouseOut="this.value='3000 포인트 충전'"/> </td>
                </tr>
                </table>
                
                
                	<table>
				<tr>
					<td height="10px"></td>
				</tr>
			</table>
                
                
                
                <table  id="infoTh" >
                <tr>
                  <td style="text-align: center; border: 5px solid #8ae634;  width: 30%;">&nbsp;4000 point</td>
                  <td> <input type="button" id="pay4000" value="4000포인트 충전"
							style="border:6 solid red ; font-family:맑은고딕; cursor:pointer; font-weight:bold;
							font-size:20px; color:black ; background-color:#8ae634; width: 99%; height: 40px;"
							onMouseOver="this.value='1800 &#8361 결제'"
							onMouseOut="this.value='4000 포인트 충전'"/> </td>
                </tr>

               </table>
            
            <br>
            <br>    
            <hr>
		
		</nav>
		</header>
		
					<footer id="footer">
						<span class="copyright">&copy; 201003011_김형근.</span>
					</footer>
		</div>
		</div>
            
            <script>
			window.onload = function() { document.body.className = ''; }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		
			</script>


</body>
</html>