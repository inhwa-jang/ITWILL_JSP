<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/for.jsp</title>
</head>
<body>
<%
//변수 : 하나의 기억장소 하나의 값 저장
int a=10;
int a1=10; int a2=20; int a3=30;

//배열 : 하나의 기억장소 여러개 값 저장
//    : 하나의 기억장소 여러개를 저장한 기억장소의 주소 저장
// int b[]=new int[3];
// b[0]=10;  b[1]=20; b[2]=30;
// int b[]={10,20,30};
int b[]=new int[]{10,20,30};


%>
배열 크기 : <%=b.length %><br>
<%-- <%=b[0] %><br> --%>
<%-- <%=b[1] %><br> --%>
<%-- <%=b[2] %><br> --%>
<%
for(int i=0;i<b.length;i++){
	%>
	<%=b[i] %><br>
	<%
}
%>
<%
//변수 : 하나의 기억장소 하나의 값 저장
String h="여행";
String hobby1="여행"; String hobby2="게임"; String hobby3="독서";

//배열변수
String hobby[]={"여행","게임","독서"};
%>
배열 크기 : <%=hobby.length %><br>
<%
for(int i=0;i<hobby.length;i++){
	%>
	<%=hobby[i] %><br>
	<%
}
%>
<table border="1">
<tr><td>i</td><td>hobby[i]</td></tr>
<%
for(int i=0;i<hobby.length;i++){
	%>
	<tr><td><%=i %></td><td><%=hobby[i] %></td></tr>
	<%
}
%>
</table>
</body>
</html>