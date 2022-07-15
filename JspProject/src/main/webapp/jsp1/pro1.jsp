<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/pro1.jsp</title>
</head>
<body>
<%
// 사용자 http://localhost:8080/JspProject/jsp1/pro1.jsp?id=lee&num=5 요청

// => 웹애플리케이션서버(WAS) 처리작업
// 1) request(http가 들고온 요청 저장), response(서버처리한결과 응답 저장) 내장객체 기억장소 만듬
// 2) 서블릿(처리담당자)지정 : 요청정보를 이용해서 jsp =>html 변경 => 처리한 정보를 response 저장

//request.멤버변수   request.멤버함수()  
// request.getParmeter() request에 저장되어있는 요청정보를 가져오기
// request에 저장된 값은 모두 문자열

String sid=request.getParameter("id");
String snum=request.getParameter("num");
%>
아이디 : <%=sid %><br>
좋아하는 숫자 : <%=snum %><br>
<!-- 문자와 숫자 연결 -->
좋아하는 숫자 + 100 : <%=snum+100 %><br>
<!-- 문자을 숫자변경 숫자 더하기 -->
<!-- snum문자 숫자변경 : Integer.parseInt(문자열) -->
좋아하는 숫자를 정수형으로 변경 + 100 : <%=Integer.parseInt(snum)+100 %><br>


</body>
</html>