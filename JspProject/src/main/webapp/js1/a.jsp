<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js1/a.jsp</title>
</head>
<body>
<%
// 자바, jsp(java server page) 명령여러개
// 폼화면에서 입력값 서버 전달 => 서버에서  입력값은 전달받아서 저장 => request jsp내장객체
// request내장객체.멤버변수,  request내장객체.멤버함수()
// request.getParameter("태그이름") 멤버함수()
%>
아이디 : <%=request.getParameter("id") %><br>
비밀번호 : <%=request.getParameter("pwd") %><br>
이름 : <%=request.getParameter("name") %><br>
성별 : <%=request.getParameter("gender") %><br>
취미 : <%=request.getParameter("hobby") %><br>
자기소개 : <%=request.getParameter("intro") %><br>
회원등급 : <%=request.getParameter("grade") %><br>
</body>
</html>
