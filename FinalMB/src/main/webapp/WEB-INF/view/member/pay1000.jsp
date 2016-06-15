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

		
	<c:if test="${ !loginStatus }">
	alert("로그인이 필요한 서비스 입니다. 로그인 창으로 넘어갑니다.");
	location.href="/member/login?url=/menuselect";
	</c:if>
	
	
$(document).ready(function(){
	
	
$("#pay").click(function() {

	alert("결제가 완료되었습니다.");

	$("#payForm").attr("method", "post");
	$("#payForm").attr("action", "/member/doPay1000");
	$("#payForm").submit();
	
});
	
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
		<form id="payForm">
			<hr>
			<h1>결제</h1>
			<hr>
			<br>
					

            <table  id="infoTh" >
                <tr>
  
                <tr>
                  <td style="text-align: left; border: 5px solid #8ae634;">&nbsp;판매가격</td>
                  <td style="text-align: center; border: 5px solid #8ae634;"> 500 원</td>
                </tr>
                
                <tr>
                  <td style="text-align: left; border: 5px solid #8ae634;">&nbsp;결제수단</td>
                  <td style="text-align: center; border: 5px solid #8ae634;">
                    	<select id="categoryPay" name="categoryPay" style="color:black; width:100%; height:100%; font-family:monaco;">
                    	
							<option value="농협">무통장 농협: 010-6326-0306 (예금주:MAB 김형근)</option>
							<option value="신한은행">무통장 신한: 110-312-811412 (예금주:MAB 김형근)</option>
							<option value="기업은행">무통장 기업: ****-*****-***** (예금주:MAB 김형근)</option>
						</select>
                  </td>
                </tr>
                
                <tr>
                  <td style="text-align: left; border: 5px solid #8ae634;">&nbsp;포인트</td>
                  <td style="text-align: center; border: 5px solid #8ae634;"> 1000 point</td>
                </tr>
                
                <tr>
                <td colspan="2">
                   <input type="button" id="pay" value="구매하기" 
							style="border:1 solid black ; font-family:맑은고딕; cursor:pointer; font-weight:bold;
							font-size:20px; color:black ; background-color:#8ae634; width: 100%; height: 40px; "/> 
                </td> 
                </tr>
           
               </table>
                
            <br>    
            <hr>
		</form>
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