<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/insertPro.jsp</title>
</head>
<body>
<%
//post 방식 => request 한글처리
request.setCharacterEncoding("utf-8");
// 폼에서 가져온값 request에 저장 "id" "pass" "name" 파라미터 값 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
// date 시스템 날짜 시간
// Timestamp date=new Timestamp(System.currentTimeMillis());

//1단계  JDBC 프로그램 드라이버 로더 
Class.forName("com.mysql.cj.jdbc.Driver");

//2단계  디비연결  DriverManager 디비주소, 디비접속아이디, 디비접속비밀번호 
//      연결정보 저장 => Connection
String dbUrl="jdbc:mysql://localhost:3306/jspdb7?serverTimezone=Asia/Seoul";
String dbUser="root";
String dbPass="1234";
Connection con =DriverManager.getConnection(dbUrl, dbUser, dbPass);

//3단계  연결정보를 이용해서 sql구문 만들기 =>  PreparedStatement
// String sql="insert into 테이블이름(열이름,열이름) values(값,'값')";
// String sql="insert into member(id,pass,name,date) values(?,?,?,?)";
String sql="insert into member(id,pass,name,date) values(?,?,?,now())";
PreparedStatement  pstmt=con.prepareStatement(sql);
// 객체생성 후 첫번째 ? 정수형 num 값 넣기, 두번째 ? 문자열 name 값 넣기
pstmt.setString(1, id);
pstmt.setString(2, pass);
pstmt.setString(3, name);
// pstmt.setTimestamp(4,date);

//4단계   PrepardStatement sql구문 실행 (insert,update,delete)=>executeUpdate()
pstmt.executeUpdate();

response.sendRedirect("loginForm.jsp");
%>
회원가입 성공 <%=pstmt %>
<script type="text/javascript">
// 	alert("회원가입성공");
// 	location.href="loginForm.jsp";
</script>
</body>
</html>