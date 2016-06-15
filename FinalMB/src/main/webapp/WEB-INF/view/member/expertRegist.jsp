<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
	
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MAB의 회원가입</title>


<!-- 1 -->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->


<script type="text/javascript" src="/resources/jquery-1.11.3.js"></script>
<script type="text/javascript">

$(document).ready(function() {

/*-------------회원아이디 중복 처리 --- */
var isNotduplicated =false;
	
	$("#duplicateResult").hide(); 
	
	
	$("#memberId").keyup(function(event){
		
		//1 사용자가 입력한 아이디를 받아 온다
		var id = $(this).val();
	/* $("#memberId").keyup(function() {
		console.log(event.keyCode);
	}); */
		//2.사용자가 입력한 값의 길이가 0보다 큰지 확인한다
		if(id.length > 0) {
			
			//3.사용자가 입력한 값의 길이가 0보다 크면 서버에서 아이디가 중복되는지 확인 요청한다
			$.post("/member/isDuplicateMemberId", 
					{"memberId" : id }, 
					function(data) {
						data = $.trim(data);
						//alert(data);
													
						//4.서버가 아이디가 중복된다고 보내주면 사용자에게 아이디가 중복임을 알려준다.
						if (data != "0" ) {
							isNotduplicated =false;
							$("#duplicateResult").text("ID가 이미 사용중.");
							$("#duplicateResult").css({
								"color" : "red" ,
								"font-weight" : "bold"
							});
							$("#duplicateResult").slideDown(90); //시간
						}
						else {
							isNotduplicated = true;
							//5.사용가능한 아이디 라고 보내준다면 사용자에게 아이디를 사용할수 있다고 알려준다.
							
							$("#duplicateResult").text("OK BABY. 사용 가능 한 아이디 입니다.");
							$("#duplicateResult").css({
								"color" : "white" ,
								"font-weight" : "bold"
							});
							$("#duplicateResult").slideDown(90);
						}
		
						//6.만약 최종으로 입력한 아이디가 중복되었을때는 regist버튼을 눌러도 아무런 반응이 없어야한다.
						//이경우 사용자가 입력한 아이디는 사용중인 아이디라서 가입이 불가능하다. 다른 아이디를 입력해라 라고 보여준다	
			});
		}
	});
	

	$("#regist").click(function() {
		var id = $("#memberId").val();
		var pwd = $("#memberPassword").val();
		var pwdConf = $("#memberPasswordConfirm").val();
		var name = $("#memberName").val();
		var licenseNumber = $("#licenseNumber").val();
		var bankNumber = $("#bankNumber").val();
		var email = $("#email").val();
		var phoneNumber = $("#phoneNumber").val();
		var bankId = $("#bankId").val();

		id = $.trim(id);
		$("#memberId").val(id);

		
		if ( !isNotduplicated ) {
			alert("입력하신 아이디는 이미 사용중 입니다.");
			return;
		}
		
		
		
		pwd = $.trim(pwd);
		$("#memberPassword").val(pwd);

		pwdConf = $.trim(pwdConf);
		$("#memberPasswordConfirm").val(pwdConf);

		name = $.trim(name);
		$("#memberName").val(name);

		licenseNumber = $.trim(licenseNumber);
		$("#licenseNumber").val(licenseNumber);
		
		bankNumber = $.trim(bankNumber);
		$("#bankNumber").val(bankNumber);
		
		email = $.trim(email);
		$("#email").val(email);
		
		phoneNumber = $.trim(phoneNumber);
		$("#phoneNumber").val(phoneNumber);
		
		bankId = $.trim(bankId);
		$("#bankId").val(bankId);
		
		
		if (id == "") {
			alert("아이디를 입력해 주세요");
			$("#memberId").focus();
			return;

		}
		if (pwd == "") {
			alert("비밀번호를 입력해 주세요");
			$("#memberPassword").focus();
			return;
		}
		if (pwdConf == "") {
			alert("비밀번호를 다시 입력해 주세요");
			$("#memberPasswordConfirm").focus();
			return;
		}
		if (name == "") {
			alert("사용할 이름을 입력하세요");
			$("#memberName").focus();
			return;
		}
		
		if (licenseNumber == "") {
			alert("자격증 번호를 입력해 주세요");
			$("#licenseNumber").focus();
			return;
		}
		
		if (bankNumber == "") {
			alert("계좌번호를 입력해 주세요");
			$("#bankNumber").focus();
			return;
		}
		
		if (email == "") {
			alert("이-메일을 입력해 주세요");
			$("#email").focus();
			return;
		}

		if (phoneNumber == "") {
			alert("헨드폰번호를 입력해 주세요");
			$("#phoneNumber").focus();
			return;
		}
 
		if (bankId == "은행이름") {
			alert("은행을 선택해 주세요");
			$("#bankId").focus();
			return;
		} 
		
		if (id.length < 6) {
			alert("아이디는 6글자 이상만 입력 가능 합니다.");
			$("#memberId").focus();
			return;
		}

		if (pwd != pwdConf) {
			alert("비밀번호를 다시 확인해 주세요.");

			$("#memberPassword").val("");
			$("#memberPasswordConfirm").val("");
			$("#memberPassword").focus();
			return;
		}
		
		$("#registForm").attr("method" , "post");
		$("#registForm").attr("action" , "/member/doExpertRegist");
		$("#registForm").submit();

	});
});
	
	
	
</script>

<style>

#noticeTh {
		z-index: 0;
		background-color: rgba( 34, 120, 255, 0.6 );
		margin: auto;
		text-align: left;
		width: 50%;	
				
}

#bankTable{
		z-index: 0;
		background-color: rgba( 34, 120, 255, 0.6 );
		margin: auto;
		text-align: left;
		width: 50%;	
				
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
		
			<hr>
			<h1>MAB 전문가 회원가입</h1>
			<hr>
			
		<table>
		<tr><td height="30px"></td></tr> 
		</table>
			
			
			<form id="registForm">
			
      			
      		<table style="border: 3px solid #5ad2ff" id="noticeTh">	
              <tr>
              	<th>
                  <input type="text" id="memberId" 
                  name="memberId" autocomplete="off" placeholder=" 아이디"
                  style="width:100%; color: black; ime-mode:disabled;">       
                   <span id="duplicateResult"></span>
             	 </th>
             </tr>	 
             	 
             <tr>	 
             	 <th>
                  <input type="text" id="memberName" 
                  name="memberName" placeholder=" 이름"
                  style="width:100%; color: black;">
              	</th>
             </tr>
             
             <tr> 	
              	<th>
                  <input type="password" id="memberPassword" 
                  name="memberPassword" placeholder=" 비밀번호"
                  style="width:100%; color: black;">
             	</th>
             </tr>
             
             <tr>
             	<th>
                  <input type="password" id="memberPasswordConfirm" 
                  name="memberPasswordConfirm" placeholder=" 비밀번호 체크"
                  style="width:100%; color: black;">
             	</th>
             </tr>
             
             
               <tr>	 
             	 <th>
                  <input type="text" id="licenseNumber" 
                  name="licenseNumber" placeholder=" 자격증 번호"
                  style="width:100%; color: black;">
              	</th>
             </tr>
             
             <tr>	
			<th>
			<select id="bankId" name="bankId" style="color:black; width:49%; font-family:monaco;">
									<option value="은행이름" >-- 은행을 선택하세요 --</option>
									<option value="국민">국민</option>
									<option value="신한">신한</option>
									<option value="우리">우리</option>
									<option value="하나">하나</option>
									<option value="농협">농협</option>
									<option value="제주">제주</option>
									<option value="기업">기업</option>
									<option value="시발">시발</option>
									<option value="기타">기타</option>
									<option value="등등">등등</option>
									
								</select>
					
							</th>
							  </tr>
               <tr>	
             	<th>
                  <input type="text" 
                  id="bankNumber" name="bankNumber"  placeholder=" 계좌번호"
                  style="width:100%; color: black;">
           		</th>
           		</tr>
              
              
              
              
              
            
  
             <tr>	
             	<th>
                  <input type="text" 
                  id="email" name="email"  placeholder=" 이메일"
                  style="width:100%; color: black;">
           		</th>
           	</tr>
           	      
             <tr>	
             	<th>
                  <input type="text" 
                  id="phoneNumber" name="phoneNumber"  placeholder="핸드폰 번호"
                  style="width:100%; color: black;">
           		</th>
           	</tr>
           	
           	<tr>	
           		<th><input type="button" id="regist" value="JOIN" 
					style="border:1 solid red ; font-family:monaco; cursor:pointer;
					font-size:22px; color:white ; background-color:blue ; 
					width: 100%;" onMouseOver="this.style.backgroundColor='gray'" 
					onMouseOut="this.style.backgroundColor='blue'" /> 
        		</th>
           		
              </tr>  
                     
            </table>  
              
              
			</form>

		</header>

		<footer id="footer">
			<span class="copyright">&copy; 201003011_김형근.</span>
		</footer>

</div>
</div>


</body>
</html>