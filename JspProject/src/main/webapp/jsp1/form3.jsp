<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/form3.jsp</title>
</head>
<body>
<form action="pro3.jsp" method="post">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pass"><br>
성별 : <input type="radio" name="gender" value="남">남성
      <input type="radio" name="gender" value="여">여성<br>
취미 : <input type="checkbox" name="hobby" value="여행">여행
      <input type="checkbox" name="hobby" value="게임">게임
      <input type="checkbox" name="hobby" value="독서">독서<br> 
등급 : <select name="grade">
		<option value="1">1등급</option>
		<option value="2">2등급</option>
		<option value="3">3등급</option>
	</select><br>
자기소개 : <textarea name="intro" rows="5" cols="10"></textarea>	
<input type="submit" value="전송">
</form>
</body>
</html>