<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updatePro.jsp</title>
</head>
<body>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
// request에 저장된 파라미터값 가져오기 
// "id" "pass" "name" email address phone mobile
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");

// id pass 일치 여부 확인 
// MemberDAO 객체생성
MemberDAO memberDAO=new MemberDAO();
// MemberDTO memberDTO =  userCheck(id,pass) 메서드 호출
MemberDTO memberDTO=memberDAO.userCheck(id, pass);

if(memberDTO!=null){
	// if memberDTO null이 아니면 아이디 비밀번호 일치 
//  => 수정작업
//수정할 정보를 MemberDTO에 저장
//MemberDTO updateDTO 객체생성
//set호출 <= "id" "pass" "name" email address phone mobile 저장
MemberDTO updateDTO=new MemberDTO();
updateDTO.setId(id);
updateDTO.setPass(pass);
updateDTO.setName(name);
updateDTO.setEmail(email);
updateDTO.setAddress(address);
updateDTO.setPhone(phone);
updateDTO.setMobile(mobile);
//public void updateMember(MemberDTO 주소저장변수) 메서드 정의
//"name" email address phone mobile 수정  조건 id=?
//MemberDAO 파일안에 있는 updateMember(MemberDTO 주소)메서드 호출
memberDAO.updateMember(updateDTO);	
// => main.jsp 이동 
response.sendRedirect("../main/main.jsp");
}else{
	// if memberDTO null이면 =>  "아이디 비밀번호 틀림" 뒤로이동
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