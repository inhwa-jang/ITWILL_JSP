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
<title>jsp3/select.jsp</title>
</head>
<body>
<%
//1단계  JDBC 프로그램 드라이버 로더 
//com\mysql\cj\jdbc 폴더  Driver.class 파일 
//com\mysql\cj\jdbc 폴더  Driver.class 파일 
Class.forName("com.mysql.cj.jdbc.Driver");

//2단계  디비연결  DriverManager 디비주소, 디비접속아이디, 디비접속비밀번호 
//      연결정보 저장 => Connection
String dbUrl="jdbc:mysql://localhost:3306/jspdb7?serverTimezone=Asia/Seoul";
String dbUser="root";
String dbPass="1234";
Connection con =DriverManager.getConnection(dbUrl, dbUser, dbPass);

//3단계  연결정보를 이용해서 sql구문 만들기 =>  PreparedStatement
// 문자열 => sql구문 변경, 실행할수 있는 내장객체 => PreparedStatement
// select * from student;
String sql="select * from student";
PreparedStatement pstmt=con.prepareStatement(sql);

// 4단계   PreparedStatement sql구문 실행 (insert,update,delete) ,
//        select 결과 저장 => ResultSet
ResultSet rs=pstmt.executeQuery();

// 5단계  ResultSet 저장된 내용을 출력, 저장
// 결과값 행접근 다음행 next() 이전행 previous() 첫번째행 first() 마지막행 last()
// next()  다음행 => 데이터 있으면 true / 데이터 없으면 false

// out.println(rs.next());  //true
// out.println(rs.next());  //true
// out.println(rs.next());  //true

// out.println(rs.next());  //false

// while(rs.next()){
// 	// 행이 있으면(rs.next() true이면) => 1열접근, 2열접근
// // 	out.println(rs.getInt(1)+","+rs.getString(2)+"<br>");
// 	out.println(rs.getInt("num")+","+rs.getString("name")+"<br>");
// }
%>
<table border="1">
<tr><td>학생번호</td><td>학생이름</td></tr>
<%
while(rs.next()){
	%>
	<tr><td><%=rs.getInt("num") %></td><td><%=rs.getString("name") %></td></tr>
	<%
}
%>
</table>
</body>
</html>