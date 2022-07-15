<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/pro3.jsp</title>
</head>
<body>
<%
//폼에서 입력한 내용 http 들고 서버전달
//서버 request내장객체 기억장소 할당 http가 들고온 정보를 request에 저장

// post방식으로 데이터 전달해오면 한글처리 설정
request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
String pass=request.getParameter("pass");
String gender=request.getParameter("gender");
//이름하나에 여러개 태그 값을 가져옴 hobby="여행" hobby="게임"  hobby="독서"
// String[] 배열변수 = String[]; 
String hobby[]=request.getParameterValues("hobby");


String grade=request.getParameter("grade");
String intro=request.getParameter("intro");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
성별 : <%=gender %><br>
취미 : <%=hobby %><br>
<table border="1">
<tr><td>i</td><td>hobby[i]</td></tr>
<%
// hobby가 null이 아니면 for동작
if(hobby!=null){
	for(int i=0;i<hobby.length;i++){
	%>
		<tr><td><%=i %></td><td><%=hobby[i] %></td></tr>
	<%
	}
}
%>
</table>
<br> 
등급 : <%=grade %><br>
자기소개 : <%=intro %><br>
</body>
</html>