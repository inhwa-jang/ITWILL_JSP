<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/jdbcTest.jsp</title>
</head>
<body>
<%
//mysql데이터베이스에서 제공하는 JDBC  프로그램 :   mysql-connector-java-8.0.22.jar
//설치 : src - main - webapp - WEB-INF - lib - mysql-connector-java-8.0.22.jar

// 자바 내장객체  Connection, DriverManager,  PrepardStatement, ResultSet 데이터베이스 접속
// 1단계  JDBC 프로그램 드라이버 로더 
// com\mysql\cj\jdbc 폴더  Driver.class 파일 
Class.forName("com.mysql.cj.jdbc.Driver");

// 2단계  디비연결  DriverManager 디비주소, 디비접속아이디, 디비접속비밀번호 
//         연결정보 저장 => Connection
String dbUrl="jdbc:mysql://localhost:3306/jspdb7?serverTimezone=Asia/Seoul";
String dbUser="root";
String dbPass="1234";
Connection con =DriverManager.getConnection(dbUrl, dbUser, dbPass);

// 3단계  연결정보를 이용해서 sql구문 만들기 =>  PreparedStatement
// 4단계   PreparedStatement sql구문 실행 (insert,update,delete) ,
//        select 결과 저장 => ResultSet
// 5단계  ResultSet 저장된 내용을 출력, 저장
%>
연결성공 <%=con %>
</body>
</html>