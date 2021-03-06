<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>



<!-- 1 -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="resources/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->



<script type="text/javascript" src="/resources/jquery-1.11.3.js"></script>

<script type="text/javascript">

<c:if test="${loginMemberVO.gradeId eq '일반' || loginMemberVO.gradeId eq '관리자' }">
$().ready(function() {
	setInterval(function() {
		$.post("/message/pickup/ajax", {}, function(data) {
			if(data != null || data != "") {
				$(".badge").css({
					"background-color" : "#00D8FF",
					"border" : "5px solid #FFFFFF",
					"color" : "#FFFFFF",
					"font-weight" : "bold",
					"border-radius" : "55px",
					"position" : "relative",
					"top" : "27px",
					"right" : "18px",
					"z-index" : "10",
					"padding" : "5px"
				}).text($.trim(data)).show();
			}
		});
	}, 2000);
});
</c:if>

<c:if test ="${loginMemberVO.gradeId eq '상담전문가' }" > 	
	$().ready(function() {
	setInterval(function() {
		$.post("/message/expertPickup/ajax", {}, function(data) {
			if(data != null || data != "") {
				$(".badge").css({
					"background-color" : "#00D8FF",
					"border" : "5px solid #FFFFFF",
					"color" : "#FFFFFF",
					"font-weight" : "bold",
					"border-radius" : "55px",
					"position" : "relative",
					"top" : "-140px",
					"left" : "167px",
					"z-index" : "10",
					"padding" : "5px"
				}).text($.trim(data)).show();
			}
		});
	}, 2000);
});
</c:if>
		



</script>


<style>

/*  li.tooltip {
	background-color: #5D5D5D;
	border: 2px solid #505050;
	border-radius: 2px;
	position: relative;
	z-index: 1;
	font-family: "나눔고딕";
	font-size: 20px;
	} */
</style>


</head>
<c:if test="${loginMemberVO.gradeId eq '일반' || loginMemberVO.gradeId eq '관리자' }">


	<body class="loading">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">

				<!-- Header -->
				<header id="header">
				<h1>Message in A Bottle</h1>
				<br>
				<h2>익명을 존중하는 유저들이 만들어가는 고민 상담소 ${loginMemberVO.gradeId}</h2>
				<nav> <!-- 	<ul>
								<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>	
								<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
								<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
								<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
								<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
							</ul> --> <span class="badge"></span>


				<ul>
					<li><a><input type="image" src="/resources/image/sm1.png"
							onmouseover="this.src='/resources/image/smm2.png'"
							onmouseout="this.src='/resources/image/sm1.png'" width="150"
							onfocus='this.blur(10)'
							onclick="location.href='/message/selectMode'"></a></li>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>



					<li><a><input type="image" src="/resources/image/wm1.png"
							onmouseover="this.src='/resources/image/wm3.png'"
							onmouseout="this.src='/resources/image/wm1.png'" width="150"
							onfocus='this.blur(10)' onclick="location.href= 'message/pickup'"></a></li>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>



					<li><a><input type="image" src="/resources/image/rm1.png"
							onmouseover="this.src='/resources/image/rm3.png'"
							onmouseout="this.src='/resources/image/rm1.png'" width="150"
							onfocus='this.blur(10)'
							onclick="location.href= 'message/selectCompleteBottle'"></a></li>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>


					<li><a><input type="image" src="/resources/image/box1.png"
							onmouseover="this.src='/resources/image/box2.png'"
							onmouseout="this.src='/resources/image/box1.png'" width="150"
							onfocus='this.blur(10)'
							onclick="location.href= 'message/receivebbox'"></a></li>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;</td>

					<!-- 	<li><a><input type="image" src="resources\image\bottlebox2.png" width="80"
				onfocus='this.blur(10)' 
				onclick="location.href='message/receivebbox'"></a></li>

			<li><a><input type="image" src="resources\image\info2.png" width="80"
				onfocus='this.blur(10)' 			
				onclick="location.href='/member/info'"></a></li>
				
			<li><a><input type="image" src="resources\image\notice2.png" width="80"
				onfocus='this.blur(10)' 
				onclick="location.href='/notice/list'"></a></li> -->
				</ul>

				</nav> <!-- <a><div class="tooltip"></div></a>	 --> </header>



				<footer id="footer"> <span class="copyright">&copy;
					201003011_김형근.</span> </footer>

			</div>
		</div>



		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script>
			window.onload = function() { document.body.className = ''; }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		
			</script>

	</body>
</c:if>

<c:if test="${loginMemberVO.gradeId eq '상담전문가'}">


	<body class="loading">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">

				<!-- Header -->
				<header id="header">
				<h1>Message in A Bottle</h1>
				<br>
				<h2>${loginMemberVO.gradeId} ${loginMemberVO.memberName}님 </h2>
				<nav> <!-- 	<ul>
								<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>	
								<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
								<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
								<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
								<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
							</ul> --> <span class="badge"></span>


				<li><a><input type="image" src="/resources/image/wm1.png"
						onmouseover="this.src='/resources/image/wm3.png'"
						onmouseout="this.src='/resources/image/wm1.png'" width="150"
						onfocus='this.blur(10)' onclick="location.href= 'message/expertPickup'"></a></li>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>



				<li><a><input type="image" src="/resources/image/rm1.png"
						onmouseover="this.src='/resources/image/rm3.png'"
						onmouseout="this.src='/resources/image/rm1.png'" width="150"
						onfocus='this.blur(10)'
						onclick="location.href= 'message/completeBottle'"></a></li>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>


				<li><a><input type="image" src="/resources/image/box1.png"
						onmouseover="this.src='/resources/image/box2.png'"
						onmouseout="this.src='/resources/image/box1.png'" width="150"
						onfocus='this.blur(10)'
						onclick="location.href= 'message/receivebbox'"></a></li>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;</td>


				</ul>

				</nav> <!-- <a><div class="tooltip"></div></a>	 --> </header>



				<footer id="footer"> <span class="copyright">&copy;
					201003011_김형근.</span> </footer>

			</div>
		</div>



		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script>
			window.onload = function() { document.body.className = ''; }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		
			</script>

	</body>

</c:if>
</html>
