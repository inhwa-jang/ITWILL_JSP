<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/response.jsp</title>
</head>
<body>
<%
//자바내장객체 자바API : HttpServletResponse.java 클래스 정의
//=> WAS가 HttpServletResponse 객체생성(기억장소할당) response 
//HttpServletResponse response=new HttpServletResponse();

// response : 서버의 처리결과(응답정보), 서버에서 사용자 컴퓨터에 설정 변경정보를 저장 내장객체

// 서버에서 클라이언트에 쿠키값을 저장
// response.addCookie("쿠키값");
// 서버에서 사용자 http header 값을 변경
response.setHeader("accept-language", "en");
// 서버에서 사용자 컴퓨터에 내용형식을 설정
response.setContentType("text/html; charset=UTF-8");
// 서버에서 응답정보를 전달하면서  다른곳으로 이동 명령(하이퍼링크)
// <a href="request.jsp">하이퍼링크</a>
// location.href="request.jsp";
response.sendRedirect("request.jsp");
%>
</body>
</html>