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
<title>jsp3/selectPro.jsp</title>
</head>
<body>
<%
//폼에서 가져온값 request에 저장 "num" 파라미터 값 가져오기
int num=Integer.parseInt(request.getParameter("num"));
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
String sql="select * from student where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);

// 4단계   PreparedStatement sql구문 실행 (insert,update,delete) ,
//        select 결과 저장 => ResultSet
ResultSet rs=pstmt.executeQuery();

// 5단계  ResultSet 저장된 내용을 출력, 저장
// 결과값 행접근 다음행 next() 다음행 => 데이터 있으면 true / 데이터 없으면 false
// 열접근 => 출력
%>
<table border="1">
<tr><td>학생번호</td><td>학생이름</td></tr>
<%
if(rs.next()){
	// next() 다음행 => 데이터 있으면 true => 열접근
			%>
	<tr><td><%=rs.getInt("num") %></td><td><%=rs.getString("name") %></td></tr>		
			<%
}
%>
</table>
</body>
</html>