<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/list.jsp</title>
</head>
<body>
<h1>글목록</h1>
<%
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
String sql="select * from board";
PreparedStatement pstmt=con.prepareStatement(sql);
// 4단계   PreparedStatement sql구문 실행 (insert,update,delete) ,
//        select 결과 저장 => ResultSet
ResultSet rs=pstmt.executeQuery();
// 5단계  ResultSet 저장된 내용을 출력, 저장
// while 결과값 행접근 다음행 next() 다음행 => 데이터 있으면 true / 데이터 없으면 false
// 열접근 => 출력
%>
<table border="1">
<tr><td>번호</td><td>글쓴이</td><td>제목</td><td>등록일</td><td>조회</td></tr>
<%
while(rs.next()){
	%>
<tr><td><%=rs.getInt("num") %></td><td><%=rs.getString("name") %></td>
<td><a href="content.jsp?num=<%=rs.getInt("num") %>"><%=rs.getString("subject") %></a></td><td><%=rs.getTimestamp("date") %></td>
    <td><%=rs.getInt("readcount") %></td></tr>
	<%
}
%>
</table>
</body>
</html>