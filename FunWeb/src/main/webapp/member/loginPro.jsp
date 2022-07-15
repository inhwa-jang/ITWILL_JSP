<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/loginPro.jsp</title>
</head>
<body>
<%
// request 저장된 id,pass 파라미터 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");

// MemberDAO 객체생성
MemberDAO memberDAO=new MemberDAO();
// 리턴할형 MemberDTO  userCheck(String id,String pass) 메서드 정의 
// MemberDTO memberDTO =  userCheck(id,pass) 메서드 호출
MemberDTO memberDTO=memberDAO.userCheck(id, pass);

// if memberDTO null이 아니면 아이디 비밀번호 일치 => 세션값 생성 "id",id main.jsp 이동 
// if memberDTO null이면  "아이디 비밀번호 틀림" 뒤로이동
if(memberDTO!=null){
	//아이디 비밀번호 일치
	session.setAttribute("id", id);
	response.sendRedirect("../main/main.jsp");
}else{
	// 아이디 비밀번호 틀림
	%>
	<script type="text/javascript">
		alert("아이디 비밀번호 틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>