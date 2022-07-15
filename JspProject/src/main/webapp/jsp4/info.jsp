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
<title>jsp4/info.jsp</title>
</head>
<body>
<%
// session "id" 가져오기
String id=(String)session.getAttribute("id");
//1단계  JDBC 프로그램 드라이버 로더 
Class.forName("com.mysql.cj.jdbc.Driver");
//2단계  디비연결  DriverManager 디비주소, 디비접속아이디, 디비접속비밀번호 
//      연결정보 저장 => Connection
String dbUrl="jdbc:mysql://localhost:3306/jspdb7?serverTimezone=Asia/Seoul";
String dbUser="root";
String dbPass="1234";
Connection con =DriverManager.getConnection(dbUrl, dbUser, dbPass);
//3단계  연결정보를 이용해서 sql구문 만들기 =>  PreparedStatement
// 문자열 => sql구문 변경, 실행할수 있는 내장객체 => PreparedStatement
String sql="select * from member where id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
// 4단계   PreparedStatement sql구문 실행 (insert,update,delete) ,
//        select 결과 저장 => ResultSet
ResultSet rs=pstmt.executeQuery();
// 5단계  ResultSet 저장된 내용을 출력, 저장
// 결과값 행접근 다음행 next() 다음행 => 데이터 있으면 true / 데이터 없으면 false
// 열접근 => 출력
if(rs.next()){
	%>
아이디 : <%=rs.getString("id") %><br>
비밀번호 : <%=rs.getString("pass") %><br>
이름 : <%=rs.getString("name") %><br>
가입날짜 : <%=rs.getTimestamp("date") %><br>
	<%
}
%>
<a href="main.jsp">메인으로</a>
</body>
</html>