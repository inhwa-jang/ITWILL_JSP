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
<title>jsp5/writePro.jsp</title>
</head>
<body>
<%
// post 방식 데이터 전송 request 한글 처리
request.setCharacterEncoding("utf-8");
// 폼에서 입력한 내용 서버에 전달 => request내장객체 저장  
// name,pass,subject,content 파라미터 가져오기
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// readcount 조회수 0
int readcount=0;

//1단계  JDBC 프로그램 드라이버 로더 
Class.forName("com.mysql.cj.jdbc.Driver");
//2단계  디비연결  DriverManager 디비주소, 디비접속아이디, 디비접속비밀번호 
//      연결정보 저장 => Connection
String dbUrl="jdbc:mysql://localhost:3306/jspdb7?serverTimezone=Asia/Seoul";
String dbUser="root";
String dbPass="1234";
Connection con =DriverManager.getConnection(dbUrl, dbUser, dbPass);

int num=0;
// num 구하기 => 중복되지 않게, 비어있지 않게 만들어서 저장=> 1, 2, 3,....
// 게시판 번호 중에 가장 큰번호 +1 => 이번에 저장할 게시판 글번호 구할수 있음
// 3단계
String sql="select max(num) from board";
PreparedStatement  pstmt=con.prepareStatement(sql);
// 4단계 실행 => 실행결과 저장
ResultSet rs=pstmt.executeQuery();
// 5단계 결과 행접근 
if(rs.next()){
	// 가장 큰번호 +1
	num=rs.getInt("max(num)")+1;
}

//3단계  연결정보를 이용해서 sql구문 만들기 =>  PreparedStatement
// String sql="insert into 테이블이름(열이름,열이름) values(값,'값')";
sql="insert into board(num,name,pass,subject,content,readcount,date) values(?,?,?,?,?,?,now())";
pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
pstmt.setString(2, name);
pstmt.setString(3, pass);
pstmt.setString(4, subject);
pstmt.setString(5, content);
pstmt.setInt(6, readcount);

//4단계   PrepardStatement sql구문 실행 (insert,update,delete)=>executeUpdate()
pstmt.executeUpdate();

// 글목록 이동 => list.jsp 
response.sendRedirect("list.jsp");
%>
</body>
</html>