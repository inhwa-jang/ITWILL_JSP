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
<title>jsp5/content.jsp</title>
</head>
<body>
<%
// http://localhost:8080/JspProject/jsp5/content.jsp?num=1
// 주소?이름=값  값을 서버에 전달 request에 저장
// request 에서 num값 가져오기 
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
String sql="select * from board where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
// 4단계   PreparedStatement sql구문 실행 (insert,update,delete) ,
//        select 결과 저장 => ResultSet
ResultSet rs=pstmt.executeQuery();
// 5단계  ResultSet 저장된 내용을 출력, 저장
// 결과값 행접근 다음행 next() 다음행 => 데이터 있으면 true / 데이터 없으면 false
// 열접근 => 출력
if(rs.next()){
	%>
<table border="1">
<tr><td>글번호</td><td><%=rs.getInt("num") %></td>
    <td>등록일</td><td><%=rs.getTimestamp("date") %></td></tr>
<tr><td>글쓴이</td><td><%=rs.getString("name") %></td>
    <td>조회수</td><td><%=rs.getInt("readcount") %></td></tr>
<tr><td>글제목</td><td colspan="3"><%=rs.getString("subject") %></td></tr>
<tr><td>글내용</td><td colspan="3"><%=rs.getString("content") %></td></tr>
<tr><td colspan="4">
<input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=rs.getInt("num")%>'">
<input type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=rs.getInt("num")%>'">
<input type="button" value="글목록" onclick="location.href='list.jsp'"></td></tr>
</table>	
	<%
}
%>
</body>
</html>

