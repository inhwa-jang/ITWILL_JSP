<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/info.jsp</title>
</head>
<body>
<%
// session "id" 가져오기
String id=(String)session.getAttribute("id");

// MemberDAO 객체생성=> 기억장소 할당
MemberDAO memberDAO=new MemberDAO();
// 리턴할형 MemberDTO   getMember(String id) 메서드 정의
// MemberDTO memberDTO =  주소.getMember(id) 메서드 호출
MemberDTO memberDTO =memberDAO.getMember(id);
	%>
아이디 : <%=memberDTO.getId() %><br>
비밀번호 : <%=memberDTO.getPass() %><br>
이름 : <%=memberDTO.getName() %><br>
가입날짜 : <%=memberDTO.getDate() %><br>
	
<a href="main.jsp">메인으로</a>
</body>
</html>