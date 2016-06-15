<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>


<!-- 공지사항 css 적용 요망 11/17 강프로    main.css -> notice.css -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/css/notice.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->



<script type="text/javascript">


	$(document).ready(function() {
		

		$("#memberPasswordButton").click(function() {
			var check = "${checkVO.memberPassword}";
			if (check == $("#memberPassword").val()) {
				location.href = "/memberInfo/infomodify";
			} else {
				alert("비밀번호가 틀렸습니다.")
			}
		});

	});
	
	
</script>

<style> 



#infoTh {
		z-index: 0;
		background-color: rgba( 34, 120, 255, 0.2 );
		margin: auto;
		font-family: "monaco"; 
		cellspacing: 0;
		width: 700px;
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
			<h1>Member Update</h1>
			<hr>
			<h2><a href="info">내 정보&nbsp;&nbsp;&nbsp;&nbsp;</a> 
				<a href="checkPassword">수정&nbsp;&nbsp;&nbsp;</a> 
				<a href="/member/unregister">탈퇴</a>
			</h2>
			<hr>
			<br>
    	
    	
    	
    <table id="infoTh">
		<tr>
			
			<td style="vertical-align: top;">
					<input type="password" id="memberPassword"
					style="font-family:monaco; font-size:18px; color:black ; 
					width: 98%; " 
				name="memberPassword" placeholder="비밀번호를 입력하셈." />
			</td>


			<td rowspan="2">
					<input type="button" id="memberPasswordButton" value="EDIT" 
					style="font-family:monaco; cursor:pointer; 
					font-size:18px; color:white ; background-color:blue;
					width: 90%; height:100%;"  onMouseOver="this.style.backgroundColor='gray'" 
					onMouseOut="this.style.backgroundColor='blue'"/>
			</td>	
		</tr>
		
		<tr>
			
			<td>
				<input type="password" id="memberPasswordConfirm"
				style="font-family:monaco; font-size:18px; color:black ; 
					width: 98%;"
				name="memberPasswordConfirm" placeholder="다시 입력해주세요." /> 
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
