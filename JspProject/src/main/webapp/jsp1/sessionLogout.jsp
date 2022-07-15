<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/sessionLogout.jsp</title>
</head>
<body>
<%
//세션객체 전체 삭제
session.invalidate();
%>
<script type="text/javascript">
	alert("로그아웃");
// 	location.href="sessionMain.jsp";
</script>
<%
response.sendRedirect("sessionMain.jsp");
%>
</body>
</html>