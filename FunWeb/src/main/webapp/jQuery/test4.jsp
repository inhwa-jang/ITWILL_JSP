<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery/test4.jsp</title>
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// submit전송 버튼을 클릭하면 submit() 이벤트 발생
	$('#fr').submit(function() {
// 		alert("메시지");
//      val() 함수 value값 
// 		alert($('#id').val());
// 		alert($('#pass').val());
		//포커스 focus() 
		if($('#id').val()==""){
// 			alert("아이디 입력하세요");
			$('#iddiv').html("아이디 입력하세요");
			$('#id').focus();
			return false;
		}else{
			$('#iddiv').html("");
		}
		
		if($('#pass').val()==""){
			alert("비밀번호 입력하세요");
			$('#pass').focus();
			return false;
		}
		//성별제어
		if($('#gender1').is(":checked")==false && $('#gender2').is(":checked")==false){
			alert("성별 선택하세요");
			return false;
		}
		//연령
		if($('#age').val()==""){
			alert("연령 선택하세요");
			$('#age').focus();
			return false;
		}
	});
});
</script>
</head>
<body>
<form action="a.jsp" method="get" id="fr">
아이디 : <input type="text" name="id" id="id">
<div id="iddiv"></div>
<br>
비밀번호 : <input type="password" name="pass" id="pass"><br>
성별 : <input type="radio" name="gender" value="남" id="gender1">남
      <input type="radio" name="gender" value="여" id="gender2">여<br>
연령 : <select name="age" id="age">
		<option value="">선택하세요</option>
		<option value="10">10대</option>
		<option value="20">20대</option>
		<option value="30">30대</option>
	</select>
<input type="submit" value="전송">
</form>
</body>
</html>