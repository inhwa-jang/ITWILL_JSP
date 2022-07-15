<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/insertPro.jsp</title>
</head>
<body>
<%
// 폼에서 입력한 내용을 http 가 가져와서 서버에 전달 
// 서버 request 내장객체 저장

// post 방식 => request 한글처리
request.setCharacterEncoding("utf-8");
%>
학생번호 : <%=request.getParameter("num") %><br>
학생이름 : <%=request.getParameter("name") %><br>
<%
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");

//자바 내장객체  Connection, DriverManager,  PreparedStatement, ResultSet 데이터베이스 접속
//1단계  JDBC 프로그램 드라이버 로더 
// com\mysql\cj\jdbc 폴더  Driver.class 파일 
Class.forName("com.mysql.cj.jdbc.Driver");

//2단계  디비연결  DriverManager 디비주소, 디비접속아이디, 디비접속비밀번호 
//      연결정보 저장 => Connection
String dbUrl="jdbc:mysql://localhost:3306/jspdb7?serverTimezone=Asia/Seoul";
String dbUser="root";
String dbPass="1234";
Connection con =DriverManager.getConnection(dbUrl, dbUser, dbPass);

//3단계  연결정보를 이용해서 sql구문 만들기 =>  PreparedStatement
// String sql="insert into 테이블이름(열이름,열이름) values(값,'값')";
// String sql="insert into student(num,name) values(1,'홍길동')";
// String sql="insert into student(num,name) values("+num+",'"+name+"')";
String sql="insert into student(num,name) values(?,?)";
// 문자열 => sql구문 변경, 실행할수 있는 내장객체 => PreparedStatement
PreparedStatement  pstmt=con.prepareStatement(sql);
// 객체생성 후 첫번째 ? 정수형 num 값 넣기, 두번째 ? 문자열 name 값 넣기
pstmt.setInt(1, num);
pstmt.setString(2, name);

//4단계   PrepardStatement sql구문 실행 (insert,update,delete) ,
pstmt.executeUpdate();
//     select 결과 저장 => ResultSet
//5단계  ResultSet 저장된 내용을 출력, 저장
%>
학생등록 성공 <%=pstmt %>
</body>
</html>




