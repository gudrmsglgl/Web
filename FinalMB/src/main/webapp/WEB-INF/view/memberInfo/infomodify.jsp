<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>


<!-- 공지사항 css 적용 요망 11/17 강프로    main.css -> notice.css -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/css/notice.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->



<script type="text/javascript" src="/resources/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#infoModify").click(function() {

			var id = $("#memberId").val();
			var name = $("#memberName").val();
			var pwd = $("#memberPassword").val();
			var pwdConf = $("#memberPasswordConfirm").val();
			var email = $("#email").val();

			pwd = $.trim(pwd);
			$("#memberPassword").val(pwd);

			pwdConf = $.trim(pwdConf);
			$("#memberPasswordConfirm").val(pwdConf);

			email = $.trim(email);
			$("#email").val(email);

			if (pwd == "") {
				alert("비밀번호를 입력해 주세요");
				$("#memberPassword").focus();
				return;
			}
			if (pwdConf == "") {
				alert("비밀번호를 한번 더 입력해 주세요");
				$("#memberPasswordConfirm").focus();
				return;
			}
			if (email == "") {
				alert("이메일을 입력해주 세요");
				$("#memberName").focus();
				return;
			}

			if (pwd != pwdConf) {
				alert("비밀번호를 다시 확인해 주세요.");

				$("#memberPassword").val("");
				$("#memberPasswordConfirm").val("");
				$("#memberPassword").focus();
				return;
			}

			$("#infoModifyForm").attr("method", "post");
			$("#infoModifyForm").attr("action", "/doUpdate");
			$("#infoModifyForm").submit();

		});
	});
</script>

<style>



#noticeTable {
		/* margin-left: 600px; */
		margin: auto;
		z-index: 0;
		text-align: left;
		background-color: rgba( 60, 130, 255, 0.6 );
		width: 50%;
		}
		
#noticeTh {
		z-index: 0;
		background-color: rgba( 34, 120, 255, 0.8 );
		margin: auto;
		text-align: left;
		width: 50%;	
		
}

#noticeBt {
		z-index: 0;
		background-color: rgba( 36, 120, 255, 0.8 );
		margin: auto;
		text-align: center;
		width: 50%;	
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
			<h2>정보수정</h2>
			<hr>
    	
    <nav>
    	
    		<form id="infoModifyForm">
			
			
			<table style="border: 3px solid #5ad2ff" id="noticeTh">
			<tr>
			<th>ID</th>
			<td><input type="text" autocomplete="off"
			id="memberId" name="memberId" placeholder="${memberVO.memberId}"
			readonly="readonly" style="font-family:monaco; font-size:18px; color:black ; 
			width: 100%;"> </td>
			</tr>
			
			<tr>
			<th>NAME</th>
			<td><input type="text" id="memberName" name="memberName" readonly="readonly" placeholder="${memberVO.memberName}"
			style="font-family:monaco; font-size:18px; color:black ; 
					width: 100%;"> 
			</td>
			</tr>
			
			<tr>
			<th>PASSWORD</th>
			<td><input type="password" id="memberPassword" name="memberPassword" placeholder="비밀번호"
			style="font-family:monaco; font-size:18px; color:black ; 
					width: 100%;"> 
			</td>
			</tr>
			
			<tr>
			<th>PWD CHECK</th>
			<td><input type="password" id="memberPasswordConfirm" style="font-family:monaco; font-size:18px; color:black ; 
					width: 100%;"
			name="memberPasswordConfirm" placeholder="비밀번호 체크"> 
			</td>
			</tr>
			
			
			<tr>
			<th>EMAIL</th>
			<td><input type="email" id="email" name="email" placeholder="이메일" style="font-family:monaco; font-size:18px; color:black ; 
					width: 100%;"> 
			</td>
			</tr>

			</table>
			
			<table id="noticeBt"  style="border: 3px solid #5ad2ff">
			<tr>
			<td> 
			<input type="button" id="infoModify" value="OK!"style="border:1 solid red ; font-family:monaco; cursor:pointer;
			font-size:21px; color:white ; background-color:blue ; 
			width:100%" onMouseOver="this.style.backgroundColor='gray'" 
			onMouseOut="this.style.backgroundColor='blue'"/> 
			</td>
			</tr>
			</table>
			
			
		<%-- 	<label>ID</label> 
			<input type="text" autocomplete="off"
			id="memberId" name="memberId" placeholder=" ${memberVO.memberId}"
			readonly="readonly"> 
			
			<br> 
			<label>NAME</label> 
			<input type="text" id="memberName" name="memberName" readonly="readonly" placeholder="${memberVO.memberName}"> 
			
			<br> 
			<label>PASSWORD</label>
			<input type="password" id="memberPassword" name="memberPassword" placeholder="비밀번호"> 
			
			<br> 
			<label>PASSWORD CHECK</label> 
			<input type="password" id="memberPasswordConfirm"
			name="memberPasswordConfirm" placeholder="비밀번호 체크"> 
			
			<br>
			<label>EMAIL</label> 
			<input type="email" id="email" name="email" placeholder="이메일"> 
			 --%>
			
		
	</form>
			

	</nav>

	
	</header>
	
			<footer id="footer">
			<span class="copyright">&copy; 201003011_김형근.</span>
			</footer>
    
	
	</div>
	</div>
	

</body>
</html>