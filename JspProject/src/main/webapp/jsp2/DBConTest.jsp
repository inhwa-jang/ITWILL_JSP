<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
   // 기본적으로 사용가능한 클래스 
   // -> 직접구현해서 접근가능한 범위에서 만들어 놓은 클래스
   // -> Java 활용도가 높은 클래스를 패키지 추가 없이 사용가능하도록 만들어놓은 클래스
   //  => String =>  java.lang.*; 자바에서 제공 기본 패키지
   //  => 패키지 추가 없이 사용가능(import)
   
   // * 기본제공되는 클래스가 아닌경우 클래스가 있는 패키지를 추가해야함(import)   
   
   // import java.lang.String;
	 final String DRIVER = "com.mysql.jdbc.Driver";
// 	final String DRIVER = "com.mysql.cj.jdbc.Driver";

	 final String DBURL = "jdbc:mysql://localhost:3306/jspdb7?serverTimezone=Asia/Seoul";
	 final String DBID = "root";
	 final String DBPW = "1234";
	 
	 // 전달받은 정보를 DB에 저장
	 // 1. 드라이버 로드
	 Class.forName(DRIVER);
	 
// 	 System.out.println(" 드라이버 로드 성공! ");
	 // 2. 디비 연결
	 Connection con
	    = DriverManager.getConnection(DBURL,DBID, DBPW);
	 
// 	 System.out.println(" 디비 연결 성공! ");
   
   
   
  
	
%>



	<h2>
		연결 성공!
		<%=con%></h2>













</body>
</html>