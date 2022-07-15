<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/updatePro.jsp</title>
</head>
<body>
<%
// request post방식 한글처리
request.setCharacterEncoding("utf-8");
// 폼에서 가져온값 request에 저장 "num" "name" 파라미터 값 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");

//1단계  JDBC 프로그램 드라이버 로더 
//com\mysql\cj\jdbc 폴더  Driver.class 파일 
// com\mysql\cj\jdbc 폴더  Driver.class 파일 
Class.forName("com.mysql.cj.jdbc.Driver");

//2단계  디비연결  DriverManager 디비주소, 디비접속아이디, 디비접속비밀번호 
//      연결정보 저장 => Connection
String dbUrl="jdbc:mysql://localhost:3306/jspdb7?serverTimezone=Asia/Seoul";
String dbUser="root";
String dbPass="1234";
Connection con =DriverManager.getConnection(dbUrl, dbUser, dbPass);

//3단계  연결정보를 이용해서 sql구문 만들기 =>  PreparedStatement
// 문자열 => sql구문 변경, 실행할수 있는 내장객체 => PreparedStatement
// update 테이블이름 set 수정열=값 where 조건열=값; 
String sql="update student set name=? where num=?";
PreparedStatement  pstmt=con.prepareStatement(sql);
pstmt.setString(1, name);
pstmt.setInt(2, num);


//4단계   PrepardStatement sql구문 실행 (insert,update,delete) ,
pstmt.executeUpdate();
%>
학생정보수정 성공 <%=pstmt %>
</body>
</html>