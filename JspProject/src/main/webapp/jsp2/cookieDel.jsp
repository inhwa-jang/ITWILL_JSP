<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieDel.jsp</title>
</head>
<body>
<%
//쿠키값 삭제
// 클라이언트 http 통해서 쿠키값을 가져와서 request에 저장
// if 쿠키값이 있으면
// for 쿠키값 한칸씩 접근
// if 쿠키값이름이 "cname" 같은것을 찾아서 
Cookie cookies[]=request.getCookies();
if(cookies!=null){
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("cname")){
		//  시간을 0 설정
		//  클라이언트 저장
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		}
	}
}
%>
<script type="text/javascript">
	alert("쿠키값삭제");
	location.href="cookieTest.jsp";
</script>

</body>
</html>