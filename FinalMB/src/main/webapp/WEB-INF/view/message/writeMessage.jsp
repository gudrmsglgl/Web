<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일반 유저에게 고민 작성</title> <!--  일반 유저에게 메시지 작성 ty -->
<!-- 1 -->


		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
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
	
	$(document).ready(function() {
		
		
		
		$("#selectBtn").click(function() {
			var selectType = $("#selectCategory").val();
		});
		
		$("#cancel").click(function() {
			location.href="/menuselect";
		});
		
		$("#toUser").click(function() {
			location.href="/menuselect"
		});
		
		$("#send").click(function() {
			
			var content = $("#textarea").val();
			var keywordFirst = $("#keywordFirst").val();
			var keywordSecond = $("#keywordSecond").val();
			var categoryId = $("#categoryId").val();
			
			if (content.length < 10) {
				alert("고민을 10자 이상 적어주세요.");
				$("#textarea").focus();
				return;
			}
			
			
			if (keywordFirst == "") {
				alert("키워드1를 입력해주세요.");
				$("#keywordFirst").focus();
				return;
			}
			
			if (keywordSecond == "") {
				alert("키워드2를 입력해주세요.");
				$("#keywordSecond").focus();
				return;
			}
	        
			if (categoryId == "카테고리"){
	             alert("카테고리를 골라주세요");
	             $("#categoryId").focus();
	             return;
	        }
			
	
			$("#writeMessageForm").attr("method", "post");
			$("#writeMessageForm").attr("action", "/message/doWriteMessage");
			$("#writeMessageForm").submit();
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
		background-color: rgba( 34, 120, 255, 0.6 );
		margin: auto;
		text-align: center;
		width: 50%;	
		
}

#noticeBt {
		z-index: 0;
		
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

				<!-- Header -->
					<header id="header">
					
						
	<nav>

	<form id="writeMessageForm">
	
	<c:if test="${loginMemberVO.myPoint < 50 }">
			
			<hr>
			<h1>포인트가 부족하여 더 이상 글을 쓸 수가 없습니다.</h1>
			<hr>
			
			<table>
			<tr><td height="30px"></td></tr> 
			</table>
			
			
			<input type="button" id="toUser" value="메인으로"
							style="border:6 solid red ; font-family:monaco; cursor:pointer; font-weight:bold;
							font-size:70px; color:white ; background-color:#1e90ff; width: 300px; height: 200px;"/> 
							
	</c:if>
	
	
	
	<c:if test="${loginMemberVO.myPoint >= 50 }"> 
		
			<hr>
			<h2>본문 글은 답장을 결정한 회원 외에는 보여지지 않습니다.</h2>
			<hr>

		<table>
		<tr><td height="30px"></td></tr> 
		</table>


	<table style="border: 3px solid #5ad2ff" id="noticeTh">	
		
		<tr>
		<th>
		  	<select id="categoryId" name="categoryId" style="color:black; width:100%; font-family:monaco;">
			<option value="카테고리">-카테고리-</option>
			<option value="연애">연애</option>
			<option value="학업">학업</option>
			<option value="진로">진로</option>
			<option value="인간관계">인간관계</option>
			<option value="패션">패션</option>
			<option value="컴플렉스">컴플렉스</option>
			<option value="경제">경제</option>
			<option value="기타">기타</option>
			</select>
		</th>
		</tr>
		
		<tr height="80px">
		<td><textarea id="textarea" name="sendContent" 
			rows="10" 
			placeholder="회원들 모두 함께 만들어가는 소중한 공간입니다. 타인에 대한 배려와 책임을 담아 고민을 적어주세요."
			style="font-family:monaco; font-size: 18; resize: none; width:100%; color:black;" maxlength=2000></textarea>
		</td>	
		</tr>
		
		</table>
		
		
		<table>
		<tr><td height="7px"></td></tr> 
		</table>
		
		<table id="noticeTh">
		
		<tr>
		<td>
		<label class="control-label" style="font-size: 18;">키워드1</label> 
		<input class="form-control input-lg" id="keywordFirst" name="keywordFirst" type="text" 
		style="font-family:monaco; font-size: 18; color:black; width:40%;" placeholder="키워드는 총 5글자 까지 가능합니다."
		maxlength=4 > 

			
			&nbsp;
			
		<label class="control-label" style="font-size: 18;">키워드2 </label> 
		<input class="form-control input-lg" id="keywordSecond"  name="keywordSecond" type="text" 
		style="font-family:monaco; font-size: 18; color:black; width:40%;" placeholder="제일 중요한 단어를 적어주세요." 
		maxlength=4 > <br>
		</td>
		</tr>
	
		</table>
	
		<table>
		<tr><td height="7px"></td></tr> 
		</table>
	
		<table id="noticeBt">
	
		<tr> 
	     <td>
	     <input type="button" id="send" value="보내기 (-50 point)" 
			style="border:1 solid red ; font-family:monaco; cursor:pointer;
			font-size:22px; color:white ; background-color:blue ; 
			width: 40%;" onMouseOver="this.style.backgroundColor='gray'" 
			onMouseOut="this.style.backgroundColor='blue'" /> 
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		  <input type="button" id="cancel" value="취소" 
			style="border:1 solid red ; font-family:monaco; cursor:pointer;
			font-size:22px; color:white ; background-color:blue ; 
			width: 40%;" onMouseOver="this.style.backgroundColor='gray'" 
			onMouseOut="this.style.backgroundColor='blue'" /> 
		
		 </td>	
		</tr>

		</table>

		</c:if>


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