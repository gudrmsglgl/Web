<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>사라진 메세지</title>

<!-- 공지사항 css 적용 요망 11/17 강프로    main.css -> notice.css -->
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

</script>

<style>
body {
   font-size: 22px;
}

#noticeTable {
   /* margin-left: 600px; */
      margin: auto;
      z-index: 0;
      width: 90%;   
      background-color: rgba( 40, 120, 255, 0.3 );
}

#deleteTh {
      z-index: 0;
      background-color: rgba( 36, 120, 255, 0.8 );
      margin: auto;
      z-index: 0;
      width: 90%;      
}

#deleteBt {
   z-index: 0;
   background-color: rgba(36, 120, 255, 0.8);
   margin: auto;
   text-align: center;
   width: 90%;
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
         <h2>Delete Message Box</h2>
                  이곳은 메세지가 7일이 지났거나 모든 회원에게 돌아간 메세지가 보여집니다.
         <br>총${deleted.paging.totalCount} 개 의 메세지가 삭제처리 되었습니다.
         <hr>
         <nav>


   <table id="noticeTable" >
   <tr>
   
   <td colspan="2" class="center">
   <input type="button" id="receiveBottle" value="답변받은 메세지 보관함" onclick="location.href= '/message/receivebbox'"
   style="border:1 solid red ; font-family:monaco; cursor:pointer;
         font-size:22px; color:white ; background-color:blue ; 
         width: 60%;" onMouseOver="this.style.backgroundColor='gray'" 
         onMouseOut="this.style.backgroundColor='blue'"/>
   </td>
   
   <td colspan="2" class="center">
   <input type="button" id="sendBottle" value="답변보낸 메세지 보관함" onclick="location.href= '/message/sendbbox'"
   style="border:1 solid red ; font-family:monaco; cursor:pointer;
         font-size:22px; color:white ; background-color:blue ; 
         width: 60%;" onMouseOver="this.style.backgroundColor='gray'" 
         onMouseOut="this.style.backgroundColor='blue'"/>
   </td>
      
   <td colspan="2" class="center">
   <input type="button" id="deleteBottle" value="사라진 메세지" onclick="location.href= '/message/deletebbox'"
   style="border:1 solid red ; font-family:monaco; cursor:pointer;
         font-size:22px; color:white ; background-color:red ; 
         width: 60%;" onMouseOver="this.style.backgroundColor='gray'" 
         onMouseOut="this.style.backgroundColor='red'"/>
   </td>
   
   <td colspan="2" class="center">
   <input type="button" id="unsolvedBottle" value="표류중인 메시지" onclick="location.href= '/message/unsolvedMessagebbox'"
   style="border:1 solid red ; font-family:monaco; cursor:pointer;
         font-size:22px; color:white ; background-color:blue ; 
         width: 60%;" onMouseOver="this.style.backgroundColor='gray'" 
         onMouseOut="this.style.backgroundColor='blue'"/>
   </td>
   
   
   </tr>
   </table>

   <table>
   <tr><td height="20px"></td></tr> 
   </table>   



   <table id="noticeTable" style="border: 3px solid #5ad2ff">
         
           <colgroup>
              <col width="10%"/>
              <col width="10%"/>
              <col width="10%"/>
              <col width="10%"/>
              <col width="10%"/>
              <col width="3%"/>
              
          </colgroup>

   <thead>
      <tr id="deleteTh" height="50px" style="font-size:18pt;">
         <th scope="col">카테고리</th>
         <th scope="col">키워드1</th>
         <th scope="col">키워드2</th>
         <th scope="col">보낸 날짜</th>
         <th scope="col">보낸 내용</th>
         <th scope="col"></th>
      </tr>
   </thead>

      
         <c:if test = "${ empty deleted }" >
         <tr>
         <td colspan="6">내용이 없습니다.</td>
         </tr>
         </c:if>

         <c:if test = "${ not empty deleted }" >
           <c:forEach items="${deleted.messageList}" var="messageVO">  
            <tr height="50px" style="font-size:18pt;">
                <td style="vertical-align: middle;">${messageVO.categoryId}</td>
                <td style="vertical-align: middle;">${messageVO.keywordFirst}</td>
                <td style="vertical-align: middle;">${messageVO.keywordSecond}</td>
                <td style="vertical-align: middle;">${messageVO.sendWriteDate}</td>            
                <td style="vertical-align: middle;">
                <textarea style="font-size:16pt; color:black; width: 100%; resize:none; margin:5px; vertical-align:middle;" rows="3">${messageVO.sendContent}</textarea></td>
            
                  
                  
                     <td style="vertical-align: middle;"><input type="button" id="delete" value="삭제"
                        style="border: 1 solid red; font-family: monaco; cursor: pointer; font-weight: bold; font-size: 18px; color: white;  background-color: blue; "
                        onMouseOver="this.style.backgroundColor='gray'"
                        onMouseOut="this.style.backgroundColor='blue'" /></td>
					 
                  
                             
               </tr>
         </c:forEach>
         </c:if>
</table>

<table  border="1" id="deleteTh">
      <tr>
         <td colspan="6" class="center">
         ${ deleted.paging.getPagingList("pageNo","[@]", "◀-", "-▶") }
         </td>
      </tr>
</table> 

</nav> </header>

         <footer id="footer"> <span class="copyright">&copy;
            201003011_김형근.</span> </footer>
      </div>
   </div>

</body>
</html>