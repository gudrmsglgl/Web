<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나와라얍</title>
<script type="text/javascript">
	
	$(document).ready(function() {
		var check = "${memberVO.memberPassword}";
		var pw = $("#memberPassword").val();
		var pwChk = $("#memberPasswordConfirm").val();
			
		$("#memberPasswordButton").click(function() {
			if( pw == pwChk ) {
				if ( check == pw ) {
					alert("탈퇴페이지로 이동합니다");
					if(confirm("정말로 탈퇴하시겠습니까?")){
						location.href="/member/dropMember";
					}
				} else {
					alert("비밀번호가 맞지않습니다.")
				}
			}
			else {
				alert("입력하신 비밀번호가 다릅니다.");
			}
			
		});

	});
</script>

<style> 


body{
	color: white;
	font-size: 24px;
}

</style>


</head>






<body>



	<table style="width: 100%;">
		<tr>
			<td><a href="info"> 내정보 </a></td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td><a href="unregister"> 탈퇴 </a></td>
		</tr>
	</table>
	정보 수정을 하기 위해서 비밀번호가 필요합니다.
	<table>
		<tr>
			<th>Password</th>
			<td><input type="password" id="memberPassword"
				name="memberPassword" placeholder="비밀번호를 입력하세요." /></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><input type="password" id="memberPasswordConfirm"
				name="memberPasswordConfirm" placeholder="다시 입력해주세요." /> <input
				type="button" id="memberPasswordButton" value="확인" /></td>
		</tr>
	</table>
	
	
	
	
	  <div class="section-warning">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <ul class="lead nav nav-pills">
              <li >
                <a href="info">내 정보</a>
              </li>
              <li >
                <a href="checkPassword">회원정보 수정</a>
              </li>
              <li class="active">
                <a href="/member/unregister">탈퇴</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
	

	<!-- 	
		<div class="cover">
      <div class="cover-image" style="background-image : url('https://ununsplash.imgix.net/reserve/RONyPwknRQOO3ag4xf3R_Kinsey.jpg?w=1024&amp;q=50&amp;fm=jpg&amp;s=c8e85e7825f6c74ff13321833a9bc28d')"></div>
      <div class="container">
        <div class="row"><div class="col-md-12">
        
        <br><br> <br>
        
        <h1 class="text-left">회원 탈퇴</h1></div></div><div class="row">
        <div class="col-md-12">
        
        <hr>
        
        <br>
        
        </div></div><div class="row">
          <div class="col-md-12">
            <form role="form">
              <div class="form-group">
                <label class="control-label" for="exampleInputPassword1">Password</label>
                <input class="form-control input-lg" id="memberPassword"
				name="memberPassword" placeholder="Password" type="password">
              </div>
            </form>
            
            <br>
            
               <form role="form">
              <div class="form-group">
                <label class="control-label" for="exampleInputPassword1">Password Check</label>
                <input class="form-control input-lg" id="memberPasswordConfirm"
				name="memberPasswordConfirm" placeholder="Password Check" type="password">
              </div>
            </form>
          </div>
        </div><div class="row"><div class="col-md-12">
        
        <br>
        <hr>
        </div></div>
        <div class="row">
          <div class="col-md-12 text-right">
            <a class="btn btn-lg btn-primary" id="memberPasswordButton">탈퇴 확인</a>
          </div>
        </div>
        
        <br><br> <br><br> <br>
        
      </div>
    </div> -->
	
	

	
</body>
</html>
