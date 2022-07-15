<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/application.jsp</title>
</head>
<body>
<%
//자바내장객체 자바API : ServletContext.java 클래스 정의
//=> WAS가 ServletContext 객체생성(기억장소할당) application
//ServletContext application=new ServletContext();

//application 내장객체 : 서버(컨텍스트) 정보를 저장, 서버가 start되면 생성, stop 사라짐
%>
서버 정보 : <%=application.getServerInfo()%><br>
서버 물리적인 경로 : <%=application.getRealPath("/") %><br>
서버 컨텍스트 경로 : <%=application.getContextPath() %><br>
jsp버전 : <%=application.getMajorVersion() %><br>
<%
//자바내장객체 자바API : PageContext.java 클래스 정의
//=> WAS가 PageContext 객체생성(기억장소할당) pageContext
//PageContext pageContext=new PageContext();

//pageContext 내장객체 : 현페이지 실행에 필요한 정보를 저장하는 객체
//                   : 페이지가 변경되면 사라짐

//자바내장객체 자바API : JspWriter.java 클래스 정의
//=> WAS가 JspWriter 객체생성(기억장소할당) out
//JspWriter out=new JspWriter();

//out 내장객체 : 출력정보를 저장하는 내장객체
out.println("출력내장객체<br>");
%>
<%="출력" %><br>
출력버퍼크기 : <%=out.getBufferSize() %>바이트 <br>
출력버퍼 남은 크기 : <%=out.getRemaining() %>바이트<br>
<%
out.close();
out.println("출력내장객체끝");
%>
</body>
</html>





