<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/sessionPro.jsp</title>
</head>
<body>
<%
//폼에서 입력한 내용을 http를 통해서 서버에 전달 =>
//서버 request내장객체 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");

%>
폼에서 가져온 아이디 : <%=id %><br>
폼에서 가져온 비밀번호 : <%=pass %><br>
<%
//데이터베이스에 저장된 회원가입한 아이디 kim 비밀번호 p123
String dbId="kim";
String dbPass="p123";

if(id.equals(dbId)  &&  pass.equals(dbPass)){
	// 폼 입력 디비에 저장된 내용 일치 => sessionMain.jsp 이동
	// 권한부여 : 연결되어있으면 페이지 상관없이 값이 유지 => 세션값생성
	session.setAttribute("id", id);
	response.sendRedirect("sessionMain.jsp");
}else{
	// 폼 입력  디비에 저장된 내용 틀림 => 뒤로이동
	%>
	<script>
		alert("입력하신 정보는 틀립니다.");
		history.back();
	</script>
	<%
}
%>

</body>
</html>
