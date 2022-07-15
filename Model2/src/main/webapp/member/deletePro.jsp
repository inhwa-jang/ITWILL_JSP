<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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
<title>member/deletePro.jsp</title>
</head>
<body>
<%
//request에 저장된 파라미터 값 가져오기 "id" "pass" 
String id=request.getParameter("id");
String pass=request.getParameter("pass");

//MemberDAO 객체생성=> 기억장소 할당
MemberDAO memberDAO =new MemberDAO();
//MemberDTO memberDTO =  주소.userCheck(id,pass) 메서드 호출
MemberDTO memberDTO=memberDAO.userCheck(id, pass);

// 5단계  ResultSet 저장된 내용을 출력, 저장
// 결과값 행접근 다음행 next() 다음행 => 데이터 있으면 true / 데이터 없으면 false
if(memberDTO!=null){
	// 데이터 있으면 true 아이디 비밀번호 일치 => 삭제작업 => main.jsp 이동
	// 삭제작업
	
	// 리턴할형 없음  deleteMember(String id) 수정작업 메서드 정의
	// 디비주소.deleteMember(id) 메서드 호출	
	memberDAO.deleteMember(id);
	
	// 세션값 전체삭제
	session.invalidate();
	// main.jsp 이동
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