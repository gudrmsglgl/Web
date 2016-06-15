<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전문가에게 고민 작성</title>  <!--  전문가에게 메시지 보내기 jsp. ty -->

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
			
			var subject = $("#expertSendSubject").val();
			var content = $("#textarea").val();
			var special_list = $("#receiveMemberId").val();
			
			
			if (subject == "") {
				alert("제목을 입력해 주세요");
				$("#expertSendSubject").focus();
				return;

			}
	
			if (content.length < 10) {
				alert("고민을 10자 이상 적어주세요.");
				$("#textarea").focus();
				return;
			}
			
			if(special_list =="consider" || special_list =="consider2" || special_list =="consider3"){
				alert("아직 심사중입니다.");
				$("#receiveMemberId").focus();
				return;
				
			}
			alert("${loginMemberVO.memberName }님의 고민이 전송되었습니다. 1000 Point를 사용하셨습니다.");

			$("#writeMessageForm").attr("method", "post");
			$("#writeMessageForm").attr("action", "/message/doWriteMessageExpert");
			$("#writeMessageForm").submit();
		});
		
		
	});	
		
</script>


<style>


#noticeTable {
		/* margin-left: 600px; */
		z-index: 0;
		background-color: rgba( 34, 120, 255, 0.1 );
		margin: auto;
		text-align: center;
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
							<c:if test="${loginMemberVO.myPoint < 1000 }">
			
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
	
	
	
	<c:if test="${loginMemberVO.myPoint >= 1000 }"> 
	
								<hr>
								<h2>고민 주제에 맞는 상담 전문가를 골라주세요.</h2>
								<hr>
								
								<table>
								<tr><td height="30px"></td></tr> 
								</table>
	
	
	
								<table  id="noticeTable">	
								
								<tr>
								<th>
								
								
								<select id="categoryId" name="categoryId" style="color:black; width:49%; font-family:monaco;">
									<option value="카테고리" >-- 카테고리 --</option>
									<option value="연애">연애</option>
									<option value="학업">학업</option>
									<option value="진로">진로</option>
									<option value="인간관계">인간관계</option>
									<option value="패션">패션</option>
									<option value="컴플렉스">컴플렉스</option>
									<option value="경제">경제</option>
									<option value="기타">기타</option>
								</select>
								
								
								<select id="receiveMemberId" name="receiveMemberId" style="color:black; width:49%; font-family:monaco;">
									<option value="전문가" >-- 전문가 리스트 --</option>
									<option value="inokid">-연애 전문 상담가 최은미- </option>
									<option value="iamexpert">-진로 전문 상담가 강병-</option>
									<option value="consider">-[심사중]경제 전문가 김미-</option>
									<option value="consider2">-[심사중]성 전문가 최광-</option>
									<option value="consider3">-[심사중]패션 전문가 최수연-</option>
									
									
								</select>
								
								</th>
								</tr>
								</table>
								
								<table>
								<tr><td height="9px"></td></tr> 
								</table>
								
								
								<table style="border: 3px solid #5ad2ff; font-size: 18pt;" id="noticeTh">	
													
								<tr>
								<td>
								<input type="text" id="expertSendSubject" name="expertSendSubject" style="color:black; width:100%; font-family:monaco;"
								placeholder=" 제목을 입력해주세요."  />
								</td>
								</tr>
								</table>
								
								<table>
								<tr><td height="7px"></td></tr> 
								</table>
									
								<table style="border: 3px solid #5ad2ff; font-size: 18pt;" id="noticeTh">		
								<tr>
								<td>
								<textarea id="textarea" name="expertSendContent" rows="10" 
									style="font-family:monaco; resize: none;  width:100%; color:black;" maxlength=2000
									placeholder=" 고민을 적어주세요."></textarea>
						
								</td>
								</tr>
								</table>
								
								<table>
								<tr><td height="7px"></td></tr> 
								</table>
						
								<table id="noticeBt">
							<tr> 
						     <td>
						     <input type="button" id="send" value="보내기 (-1000 point)" 
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