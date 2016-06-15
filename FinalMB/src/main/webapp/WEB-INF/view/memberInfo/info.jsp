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
alert("권한이 없습니다. 로그인창으로 넘어갑니다");
location.href="/member/login?url=/menuselect";
</c:if>


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
		background-color: rgba( 34, 120, 255, 0.8 );
		margin: auto;
		width: 50%;	
		font-family: "monaco"; 
		font-size: 24px;
		
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
			<h1>Info</h1>
			<hr>
			<h2><a href="info">내 정보&nbsp;&nbsp;&nbsp;&nbsp;</a> 
				<a href="checkPassword">수정&nbsp;&nbsp;&nbsp;</a> 
				<a href="/member/unregister">탈퇴</a>
			</h2>
			<hr>
			<br>
					

            <table  id="infoTh" >
                <tr>
   
                <tr>
                  <td style="text-align: left; border: 5px solid #5ad2ff;">&nbsp;아이디</td>
                  <td>${memberVO.memberId}</td>
                </tr>
                
                <tr>
                  <td style="text-align: left; border: 5px solid #5ad2ff;">&nbsp;이름</td>
                  <td>${memberVO.memberName}</td>
                </tr>
                
                <tr>
                  <td style="text-align: left; border: 5px solid #5ad2ff;">&nbsp;이메일</td>
                  <td>${memberVO.email}</td>
                </tr>
                
                <tr>
                  <td style="text-align: left; border: 5px solid #5ad2ff;">&nbsp;포인트</td>
                  <td>${memberVO.myPoint}</td>
                </tr>
                
                <tr>
                  <td style="text-align: left; border: 5px solid #5ad2ff;">&nbsp;가입날짜</td>
                  <td>${memberVO.registDate}</td>
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


<%-- 
              <li>
                <a href="info">내 정보</a>
              </li>
              <li>
                <a href="checkPassword">회원정보 수정</a>
              </li>
              <li>
                <a href="/member/unregister">탈퇴</a>
              </li>

         <br>
         
            <h1>회원정보</h1>
            <hr>

            <table>
                <tr>
   
                <tr>
                  <td>아이디 :</td>
                  <td>${memberVO.memberId}</td>
                </tr>
                
                <tr>
                  <td>이름 :</td>
                  <td>${memberVO.memberName}</td>
                </tr>
                
                <tr>
                  <td>이메일 :</td>
                  <td>${memberVO.email}</td>
                </tr>
                
                <tr>
                  <td>포인트 :</td>
                  <td>${memberVO.myPoint}</td>
                </tr>
                
                <tr>
                  <td>가입날짜 :</td>
                  <td>${memberVO.registDate}</td>
                </tr>
                
               </table>
                
            <hr> --%>
            
            <script>
			window.onload = function() { document.body.className = ''; }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		
			</script>


</body>
</html>