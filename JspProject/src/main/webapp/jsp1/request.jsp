<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/request.jsp</title>
</head>
<body>
<%
// 자바내장객체 자바API : HttpServletRequest.java 클래스 정의
// => WAS가 HttpServletRequest 객체생성(기억장소할당) request 
// HttpServletRequest request=new HttpServletRequest();

// request 내장객체 : 사용자 요청정보 저장
//                  (태그정보, 서버정보, 사용자정보, 세션정보, 쿠키정보, http헤더정보)
%>
서버정보 : <%=request.getServerName() %><br>
포트정보 : <%=request.getServerPort() %><br>
URL정보 : <%=request.getRequestURL() %><br>
URI정보 : <%=request.getRequestURI() %><br>
프로토콜(통신규약) : <%=request.getProtocol() %> <br>
요청방식 : <%=request.getMethod() %><br>
프로젝트(컨텍스트)경로 : <%=request.getContextPath() %><br>
사용자(클라이언트) IP주소 : <%=request.getRemoteAddr() %><br>
서버 물리적 경로 : <%=request.getRealPath("/") %><br>
http정보(user-agent header정보) : <%=request.getHeader("user-agent") %><br>
http정보(accept-language header정보) : <%=request.getHeader("accept-language") %><br>


</body>
</html>