<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// member/dupcheck2.jsp
// id 파라미터 request 가져오기
String id=request.getParameter("id");

//MemberDAO 객체생성
MemberDAO memberDAO=new MemberDAO();
//MemberDTO memberDTO = getMember(id) 메서드 호출
MemberDTO memberDTO =memberDAO.getMember(id);

if(memberDTO==null){
	// id없음 => 아이디 중복 아님 => "아이디 사용 가능"
		%>아이디 사용 가능<%
}else{
	// id있음  => "아이디 중복" 
		%>아이디 중복<%	
}
%>