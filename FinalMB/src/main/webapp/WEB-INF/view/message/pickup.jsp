<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  	   
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>병 건지기 화면</title>



<!-- 공지사항 css 적용 요망 11/17 강프로    main.css -> notice.css -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/css/notice.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->



<script type="text/javascript" src="/resources/jquery-1.11.3.js"></script>

<script type="text/javascript">



<c:if test="${ empty message }">
alert("도착한 메세지가 없습니다.");
location.href="/menuselect";
</c:if>



<c:if test="${ !loginStatus }">
alert("로그인이 필요한 서비스 입니다. 로그인 창으로 넘어갑니다.");
location.href="/member/login?url=/menuselect";
</c:if>


$(document).ready(function(){
	
	$("#div1").hide();
	
	$(".openThisContent").click(function(){
		
		if(confirm){
			
		}
		
		if(confirm("글을 읽으면 무조건 답장을 해주셔야 합니다.")){
			/* 열기 건너띄기 버튼 가리기 */
			$(".skipThisContent").hide();
			$(".openThisContent").hide();
			
		/*내가한거; 	
			$(this).hidden(".openThisContent");
			$(this).hidden(".skipThisContent"); */
			$("#div1").fadeIn(2000);
			//$(this).parent().parent().parent().parent().parent().children(":eq(1)").fadeIn(500);
		}
	});
	
	
	
	$(".skipThisContent").click(function(){
		if(confirm("정말 다른 사람에게 메세지를 보내시겠습니까?")){	
			$("#skip").attr("method", "post");
			$("#skip").attr("action", "/message/doPickupSkip");
			$("#skip").submit();
			alert("메세지가 다음 회원에게 넘어갔습니다.");
		}
			
	});
	
	
	$(".sendMyMessage").click(function(){
		alert("${loginMemberVO.memberName }님, 답변을 완료해 주셨기에 50 Point가 적립되었습니다.");
		$("#Reply").attr("method", "post");
		$("#Reply").attr("action", "/message/doPickup");
		$("#Reply").submit();
	 });
	
});

</script>


  <style>
  body {
	font-size: 22px;
	}
	
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
			text-align: center;
			width: 40%;	
	}

	
	#noticeBt {
			z-index: 0;
			margin: auto;
			text-align: center;
			width: 15%;	
		
	}
	
	
	#div1 {
			z-index: 0;
			background-color: rgba( 34, 120, 255, 0.6 );
			margin: auto;
			text-align: center;
			width: 50%;
			
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
				<h2>PickUp Message</h2>
				<hr>
		<nav>
		
		<table style="border: 3px solid #5ad2ff" id="noticeTh">

		<tr>
			<th>카테고리 :</th> 
			<td>${message.categoryId}</td>
		</tr>

		<tr>
				<th>작성 날짜 :</th>
				<td>${message.sendWriteDate}</td>
		</tr>
		
		</table>
		
		<table style="border: 3px solid #5ad2ff" id="noticeTh">
		
		<tr>
			<th>키워드 1:</th>
					<td>-${message.keywordFirst}-</td>


			<th>키워드 2:</th>
					<td>-${message.keywordSecond}-</td>
		</tr>

		</table>
		
		
		

<form id="skip">
<input type="hidden" name="messageId" value="${message.messageId }"/>
</form>

	
		<table>
		<tr><td height="10px"></td></tr> 
		</table>	
	
	
<table id="noticeBt">

<tr>
<td>

<input type="button" class="openThisContent"  value="건진다"
	style="border:1 solid red ; font-family:monaco; cursor:pointer;
	font-size:21px; color:white ; background-color:blue ; 
	width:120" onMouseOver="this.style.backgroundColor='gray'" 
	onMouseOut="this.style.backgroundColor='blue'"/>
</td>

<td>
			
<form id="skip">

<input type="button" class="skipThisContent"  value="흘려보내기"
	style="border:1 solid red ; font-family:monaco; cursor:pointer;
	font-size:21px; color:white ; background-color:red ; 
	width:100" onMouseOver="this.style.backgroundColor='gray'" 
	onMouseOut="this.style.backgroundColor='red'"/>

<input type="hidden" name="messageId" value="${message.messageId }"/>

</form>			
				
</td>

</tr>

</table>
	
	
	
	
<!-- 숨겨진 글내용	 -->

		
	
<form id="Reply">
	
<table style="border: 3px solid #5ad2ff" id="div1" >

<tr>	
<th>상대방이 보낸 고민</th>
</tr>


<tr>
<td>
<textarea id="textarea" rows="4" cols="118"  style="resize: none; 
color: black;"

readonly="readonly">${message.sendContent}</textarea>
</td>		
	
</tr>	
	
	
<tr>	
<td>	
<textarea id="textarea" name="receiveContent" rows="4" cols="118" style="resize: none; 
color: black;" 

placeholder="상대방을 비방하는 글을 쓰지 맙시다."></textarea><br/>
</td>
</tr>     
     
<tr>
<td>        
<input type="hidden" name="messageId" value="${message.messageId }"/>
<input type="button" class="sendMyMessage" value="답장 보내기"
	style="border:1 solid red ; font-family:monaco; cursor:pointer;
	font-size:21px; color:white ; background-color:blue ; 
	width:100" onMouseOver="this.style.backgroundColor='gray'" 
	onMouseOut="this.style.backgroundColor='blue'" />

</td>

</tr>
	


</table>

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