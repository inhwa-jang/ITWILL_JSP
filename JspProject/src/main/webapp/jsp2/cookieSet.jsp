<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieSet.jsp</title>
</head>
<body>
<%
//세션값 저장  session.setAttribute("이름", 값);
//세션값 가져오기 session.getAttribute("이름");
//세션객체 전체삭제 session.invalidate();

// 쿠키 객체생성(서버)
// Cookie cookie=new Cookie("쿠키이름","쿠키문자열값");
Cookie cookie=new Cookie("cname","cookieValue");
// 쿠키 유지시간 설정 
cookie.setMaxAge(30*60);
// 쿠키값을 클라이언트 저장(response에 저장)
response.addCookie(cookie);
%>
쿠키변수 저장된 주소 : <%=cookie %><br>
쿠키이름 : <%=cookie.getName() %><br>
쿠키값 : <%=cookie.getValue() %><br>
쿠키시간 : <%=cookie.getMaxAge() %>초<br>
<script type="text/javascript">
	alert("쿠키값생성");
	location.href="cookieTest.jsp";
</script>
</body>
</html>