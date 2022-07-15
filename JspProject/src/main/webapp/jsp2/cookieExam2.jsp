<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieExam2.jsp</title>
</head>
<body>
<%
//선택한값을 request에서 가져오기
String lang=request.getParameter("lang");
%>
선택한 언어 <%=lang %><br>
<%
//페이지 상관없이 값 유지 , 서버에 부하는 줄이고, 클라이언트 저장
//쿠키이름 : "clang" , 쿠키값 : 폼에서 선택한 값 lang 변수 안에 저장된 값

// 쿠키 객체생성(서버)
// Cookie cookie=new Cookie("쿠키이름","쿠키문자열값");
Cookie cookie=new Cookie("clang",lang);
// 쿠키 유지시간 설정 
cookie.setMaxAge(30*60);
// 쿠키값을 클라이언트 저장(response에 저장)
response.addCookie(cookie);
%>
<script type="text/javascript">
	alert("언어설정");
	location.href="cookieExam1.jsp";
</script>
</body>
</html>