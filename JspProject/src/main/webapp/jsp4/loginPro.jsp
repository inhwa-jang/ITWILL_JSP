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
<title>jsp4/loginPro.jsp</title>
</head>
<body>
<%
//폼에서 가져온값 request에 저장 "id" "pass" 파라미터 값 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");

//1단계  JDBC 프로그램 드라이버 로더 
Class.forName("com.mysql.cj.jdbc.Driver");

//2단계  디비연결  DriverManager 디비주소, 디비접속아이디, 디비접속비밀번호 
//      연결정보 저장 => Connection
String dbUrl="jdbc:mysql://localhost:3306/jspdb7?serverTimezone=Asia/Seoul";
String dbUser="root";
String dbPass="1234";
Connection con =DriverManager.getConnection(dbUrl, dbUser, dbPass);

//3단계  연결정보를 이용해서 sql구문 만들기 =>  PreparedStatement
// sql 폼에서 입력한 아이디 디비에 아이디 일치하고 ,
//     폼에서 입력한 비밀번호 디비에  비밀번호 일치
String sql="select * from member where id=? and pass=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);

// 4단계   PreparedStatement sql구문 실행, select 결과 저장 => ResultSet
ResultSet rs=pstmt.executeQuery();

// 5단계  ResultSet 저장된 내용을 출력, 저장
// 결과값 행접근 다음행 next() 다음행 => 데이터 있으면 true / 데이터 없으면 false
// 데이터 있으면 true 아이디 비밀번호 일치 => 세션값 생성 => main.jsp 이동
// 데이터 없으면 false 아이디 비밀번호 틀림 => 아이디 비밀번호 틀림 메시지 출력 , 뒤로이동
if(rs.next()){
	// 데이터 있으면 true 아이디 비밀번호 일치 
	// => 세션값 생성(페이지 상관없이 값유지), 기준값 적용 => main.jsp 이동
	session.setAttribute("id", id);
	response.sendRedirect("main.jsp");
}else{
	// 데이터 없으면 false 아이디 비밀번호 틀림 => 아이디 비밀번호 틀림 메시지 출력 , 뒤로이동
	%>
	<script type="text/javascript">
		alert("입력하신 정보 틀림");
		history.back();
	</script>
	<%		
}
%>
</body>
</html>