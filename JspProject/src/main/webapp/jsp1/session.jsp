<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/session.jsp</title>
</head>
<body>
<%
//자바내장객체 자바API : HttpSession.java 클래스 정의
//=> WAS가 HttpSession 객체생성(기억장소할당) session
//HttpSession session=new HttpSession();

// session 내장객체 : 서버 클라이언트 연결 정보를 저장

// session 삭제 
// 1. 브라우저를 모두 닫았을때
// 2. 30분동안 인터넷 작업을(서버에 접속하지 않은경우) 하지 않았을때
// 3. 로그아웃 버튼클릭(session 삭제 명령)
%>
session ID 값 : <%=session.getId() %><br>
세션 생성시간 : <%=session.getCreationTime() %><br>
세션 최종 접속 시간 : <%=session.getLastAccessedTime() %><br>
세션 유지시간 : <%=session.getMaxInactiveInterval() %>초<br>
세션 유지시간 변경 : 
<%
session.setMaxInactiveInterval(3600);
%>
<br>
변경한 세션 유지시간 : <%=session.getMaxInactiveInterval() %>초<br>
세션값 전체삭제 :
<%
// session.invalidate();
%>
<br>
<%
//세션내장객체에 값을 저장
// session.setAttribute("세션이름", 세션값);
session.setAttribute("sname", "svalue");
%>
세션내장객체안에 저장된 "sname"이름 값 : <%=session.getAttribute("sname") %><br>

</body>
</html>