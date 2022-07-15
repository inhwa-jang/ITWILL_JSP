<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/sessionMain.jsp</title>
</head>
<body>
<%=session.getAttribute("id") %> 님 로그인 하셨습니다.
<a href="sessionLogout.jsp">로그아웃</a>
</body>
</html>