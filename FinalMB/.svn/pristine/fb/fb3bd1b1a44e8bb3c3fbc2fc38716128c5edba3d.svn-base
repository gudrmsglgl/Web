<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>관리자 게시판</title>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
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
body{

font-size: 22px;

}

#noticeTable {
      /* margin-left: 600px; */
      margin: auto;
      z-index: 0;
      width: 100%;	
      background-color: rgba( 40, 120, 255, 0.3 );
      }
      
#noticeTh {
      z-index: 0;
      background-color: rgba( 36, 120, 255, 0.8 );
      
}

/* #noticeBt {
		z-index: 0;
		background-color: rgba( 36, 120, 255, 0.8 );
		margin: auto;
		width: 49%;	
		color: black;
		text-align: right;
}
 */

/* #searchForm {
color: black;
}

.check { 
width:18pt; 
height:18pt; 
}  */

</style>


</head>


<body class="loading">


   <div id="wrapper">
      <div id="bg"></div>
      <div id="overlay"></div>
      <div id="main">

  <header id="header">
  
               <hr>
               <h2>관리자 페이지(일반회원)</h2>
               <hr>
               <nav>

	<h2>총 ${messageList.paging.totalCount} 개의 게시물 확인.</h2>

	<table>
		<tr><td height="10px"></td></tr> 
	</table>	
			
	<table id="noticeTable" style="border: 3px solid #5ad2ff">
				
		    <colgroup>
		        <col width="22%"/>
		        <col width="5%"/>
		        <col width="5%"/>
		        <col width="5%"/>
		        <col width="5%"/>
		        <col width="15%"/>
		        <col width="5%"/>
		        <col width="15%"/>
		    </colgroup>

	<thead>
		<tr id="noticeTh">
			<th scope="col">메세지 아이디</th>
			<th scope="col">카테고리</th>
			<th scope="col">키워드1</th>
			<th scope="col">키워드2</th>
			<th scope="col">보낸사람</th>
			<th scope="col">보낸날짜</th>
			<th scope="col">답변자</th>
			<th scope="col">답변날짜</th>
		</tr>
	</thead>
	
		<c:if test="${empty messageList.messageList}">
			<tr>
				<td colspan="5">데이터 없음.</td>
			</tr>
		</c:if>


		<c:if test="${not empty messageList.messageList}">

			<c:forEach items="${messageList.messageList }" var="messageVO">
			
				<tr>
					<td><a href="/message/addetail/${messageVO.messageId}">${messageVO.messageId}</a></td>
					<td>${messageVO.categoryId}</td>
					<td>${messageVO.keywordFirst}</td>
					<td>${messageVO.keywordSecond}</td>
					<td>${messageVO.sendMemberId}</td>
					<td>${messageVO.sendWriteDate}</td>
					<td>${messageVO.receiveMemberId}</td>
					<td>${messageVO.receiveWriteDate}</td>
				</tr>
				
			</c:forEach>
		</c:if>
	
		<tr id="noticeTh">
			<td colspan="8">
				${messageList.paging.getPagingList("pageNo"," [@] ", "◀-", "-▶")}
			</td>
		</tr>

	</table>
	
	</nav>
		
  </header>
  
  	</div>
	</div>


</body>


</html>