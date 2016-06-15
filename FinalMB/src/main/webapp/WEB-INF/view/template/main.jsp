<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>

<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>

<!DOCTYPE html>
<html>
<head>


<meta charset="utf-8">


<!-- sitemesh 이용한 것 -->
<script type="text/javascript" src="/resources/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document).keyup(function(e) {
		
		var code = e.keyCode;
		if(code == 27) {
			document.getElementById("audio").pause();
		}	
		
		});
	
	
	$(document).ready(function() {
	
	
	$("#gologin").click(function() {
		
		<c:if test="${ !loginStatus }">
		alert("로그인이 필요한 서비스 입니다. 로그인 창으로 넘어갑니다.");
		location.href="/member/login?url=/menuselect";
		</c:if>
			
		<c:if test="${loginStatus}">	
		location.href="/menuselect";
		</c:if>
			
		});
	});
	
	
	//창크기 고정
 	window.onfocus=function(){
	}
	window.onload=function(){
	 window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
	window.moveTo(0,0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
	window.resizeTo(1250,800); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
	window.scrollTo(0,250); // 페이지 상단 광고를 바로 볼 수 있게 스크롤 위치를 조정
	}
	
	//마우스 휠 막기
	document.onmousewheel = function() { 
		  var e = window.event; 
		  var pressedkey = String.fromCharCode(event.keyCode).toLowerCase(); 
		if(event.ctrlKey) { 
		var key_type= event.returnValue=false; 
		} 
		// 마우스휠 이벤트와 ctrl키가 눌렸을때 
		    if (e.srcElement && key_type==false){ 
		return false; 
		} 
		} 
	 
	
</script>



<decorator:head />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><decorator:title default="FinalSpring" /></title>
<link rel="shortcut icon" href="/resources/image/mmm.png" />



<style>


table, div, ul, h1, h2 {
min-width: 1200px !important;

}

table#headTable {
	width: 100% !important;
	height: 100px !important;
	z-index: 10 !important;
	position: absolute;
	text-weight: bolder;
	font-size: 19pt;
}

.nav {
	z-index: 2;
}
</style>
</head>

<body>




	<table id="headTable" style="color: white;">

		<tr>
			<td colspan="6" align="right"><c:if
					test="${not empty loginMemberVO.memberId}">
					<h4>
						${loginMemberVO.memberName}님&nbsp;&nbsp;&nbsp;&nbsp;${loginMemberVO.myPoint}
						Point &nbsp;&nbsp;&nbsp;
						<a onclick="location.href='/member/paySelect'"
							style="cursor: pointer">포인트 충전</a>&nbsp;&nbsp;
						
						 <a onclick="location.href='/member/info'"
							style="cursor: pointer">내 정보</a>&nbsp;&nbsp;
							
							
							 <a onclick="location.href='/logout'" style="cursor: pointer">로그아웃</a>&nbsp;&nbsp;
						
						<c:if test="${loginMemberVO.gradeId eq '관리자'}">
							<a onclick="location.href='/message/admin'"
								style="cursor: pointer">관리 페이지</a>&nbsp;&nbsp;
				<a onclick="location.href='/notice/write'" style="cursor: pointer">공지사항
								작성</a>

						</c:if>
						&nbsp;&nbsp;
					</h4>
				</c:if></td>
		</tr>
		<tr>

			<th><a style="cursor: pointer" id="gologin">메인화면</a></th>
			
			<th><a onclick="location.href='/member/expertInfo'" 
				style="cursor: pointer">전문가 소개</a></th>

			<th><a onclick="location.href='/notice/list'"
				style="cursor: pointer">공지사항</a></th>
			
			<th><a onclick="location.href='/free/freeBoardList'"
				style="cursor: pointer">자유 게시판</a></th>
			
			<th><a onclick="location.href='/qaboard/qalist'"
				style="cursor: pointer">질문 게시판</a></th>
			
			
			<th><a onclick="location.href='/review/reviewlist'" 
				style="cursor: pointer">후기 공유</a></th>
			
		</tr>

	</table>



	<!-- 중간 빈 테이블 -->

	<div class="pageWrapper">
		<div class="menuWrapper" style="float: center;"></div>


		<div class="contentWrapper" style="float: center;">
			<decorator:body />
		</div>

		<div style="clear: both;"></div>
	</div>


</body>
</html>
