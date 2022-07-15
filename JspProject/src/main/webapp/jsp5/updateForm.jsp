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
<title>jsp5/updateForm.jsp</title>
</head>
<body>
<%
// http://localhost:8080/JspProject/jsp5/updateForm.jsp?num=1
// http가 들고온 num 파라미터값을 서버에 request에 저장
// request에서 "num" 파라미터값 가져오기
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
<h1>글수정</h1>
<form action="updatePro.jsp" method="post">
<input type="hidden" name="num" value="<%=rs.getInt("num")%>">
<table border="1">
<tr><td>작성자</td><td><input type="text" name="name" value="<%=rs.getString("name")%>"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="<%=rs.getString("subject")%>"></td></tr>
<tr><td>내용</td>
    <td><textarea name="content" rows="10" cols="20"><%=rs.getString("content")%></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>
</table>
</form>
	<%
}
%>

</body>
</html>