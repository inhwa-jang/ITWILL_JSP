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
<title>member/updateForm.jsp</title>
</head>
<body>
<%
//session "id" 가져오기
String id=(String)session.getAttribute("id");

//MemberDAO 객체생성=> 기억장소 할당
MemberDAO memberDAO=new MemberDAO();
// MemberDTO memberDTO =  주소.getMember(id) 메서드 호출
MemberDTO memberDTO=memberDAO.getMember(id);
%>
<form action="updatePro.jsp" method="post">
아이디 : <input type="text" name="id" value="<%=memberDTO.getId() %>" readonly><br>
비밀번호 : <input type="password" name="pass"><br>
이름 : <input type="text" name="name" value="<%=memberDTO.getName()%>"><br>
<input type="submit" value="회원정보수정">
</form>	
	
<a href="main.jsp">메인으로</a>
</body>
</html>