<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/scopePro.jsp</title>
</head>
<body>
<h1>jsp1/scopePro.jsp</h1>
<%
// http://localhost:8080/JspProject/jsp1/scopePro.jsp?id=lee&pass=1111
// 폼에서 입력한 내용을 서버에 전달
// 서버 request내장객체 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
// 내장객체 값을 저장 
// 현페이지정보
pageContext.setAttribute("page", "pageContext value");
// 요청정보 
request.setAttribute("req","request value" );
// 연결정보
session.setAttribute("ses", "session value");
// 서버정보
application.setAttribute("app", "application value");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
pageContext 값 : <%=pageContext.getAttribute("page") %><br>
request 값 : <%=request.getAttribute("req") %><br>
session 값 : <%=session.getAttribute("ses") %><br>
application 값 : <%=application.getAttribute("app") %><br>
<!-- http://localhost:8080/JspProject/jsp1/scopeProPro.jsp?id=lee&pass=1111 -->
<!-- get방식 형태로 파라미터값 전달 -->
<a href="scopeProPro.jsp?id=<%=id %>&pass=<%=pass%>">scopeProPro.jsp이동</a> 
<script type="text/javascript">
// 	alert("scopeProPro.jsp 이동");
<%-- 	location.href="scopeProPro.jsp?id=<%=id%>&pass=<%=pass%>"; --%>
</script>
<%
// response.sendRedirect("scopeProPro.jsp?id="+id+"&pass="+pass);

// 다른방식의 이동 => 현페이지에 있는 request 정보를 들고 이동 forward
//                 현페이지에 주소를 유지하면서 화면에 내용만 이동 forward
// 액션태그 : jsp문법 : 태그 처럼 사용
%>
<%-- <jsp:forward page="scopeProPro.jsp"></jsp:forward> --%>
</body>
</html>
