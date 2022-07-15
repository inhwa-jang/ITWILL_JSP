<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/include2.jsp</title>
</head>
<body>
<table border="1" width="600" height="600">
<tr height="100"><td colspan="2">
<jsp:include page="top.jsp"></jsp:include>
</td></tr>
<tr height="400"><td width="100">왼쪽메뉴</td><td>본문2</td></tr>
<tr height="100"><td colspan="2">
<jsp:include page="bottom.jsp"></jsp:include>
</td></tr>
</table>
</body>
</html>