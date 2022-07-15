<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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
<title>member/insertPro.jsp</title>
</head>
<body>
<%
//post 방식 => request 한글처리
request.setCharacterEncoding("utf-8");
// 폼에서 가져온값 request에 저장 "id" "pass" "name" 파라미터 값 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");

//  디비작업 자바파일 => 패키지(폴더) member  파일이름 MemberDAO
//  public void insertMember(String id,String pass,String name) 메서드 정의

// MemberDAO 파일안에 있는 insertMember()메서드 호출
// MemberDAO 파일 사용할때 기억장소 할당 => 객체생성
MemberDAO memberDAO=new MemberDAO();
// insertMember()메서드 호출
out.println("MemberDAO 형태기억장소를 접근할 주소 : "+memberDAO+"<br>");

// memberDAO.insertMember(id, pass, name,gender,email,phone,address,.....);
// 전달할 데이터가 여러개 일경우 => 하나의 공간(바구니)에 담아서 전달 
//  데이터를 담아서 전달하는 자바파일 => 패키지(폴더) member  파일이름 MemberDTO
//  전달 데이터를 저장할 멤버변수 정의 
//  멤버변수에 값을 저장 메서드 정의 set() , 값을 가져올 메서드 정의 get()  
// 데이터를 저장하기위해서 기억장소 할당 => 객체생성
MemberDTO memberDTO=new MemberDTO();
out.println("MemberDTO 형태기억장소를 접근할 주소 : "+memberDTO+"<br>");
// set메서드 호출 => 멤버변수에 id pass name 값 저장
memberDTO.setId(id);
memberDTO.setPass(pass);
memberDTO.setName(name);
// 디비 작업하러 갈때 바구니 기억장소의 주소를 들고감 

// memberDAO.insertMember(id, pass, name);
memberDAO.insertMember(memberDTO);


response.sendRedirect("loginForm.jsp");
%>
<script type="text/javascript">
// 	alert("회원가입성공");
// 	location.href="loginForm.jsp";
</script>
</body>
</html>