<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/pro2.jsp</title>
</head>
<body>
<%
//폼에서 입력한 내용이 http를 통해서 서버에 전달
//서버에서 request내장객체 기억공간을 만들고 http가 들고온 정보를 저장

// post방식으로 한글을 넘기면 request.getParameter 하기전에 한글처리 작업
request.setCharacterEncoding("utf-8");

String name=request.getParameter("name");
String sage=request.getParameter("age");
%>
이름 : <%=name %><br>
나이 : <%=sage %><br>
<%
//문자열 숫자로 변경
int age=Integer.parseInt(sage);
if(age < 20){
	%>
	<%=age %>세 미성년
	<%
}else{
	%>
	<%=age %>세 성인
	<%
}
%>

</body>
</html>



