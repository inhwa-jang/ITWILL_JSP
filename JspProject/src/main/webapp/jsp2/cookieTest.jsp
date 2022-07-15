<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieTest.jsp</title>
</head>
<body>
<%
// 쿠키 : 자바내장객체, 객체생성
//     : 공통점 - 페이지,서버,클라이언트 상관없이 값을 유지
//     : 차이점 - 클라이언트 하드웨어 저장, 보안상 관계없는 내용 유지, 서버에 부하는 줄여줌
   

// 세션 : jsp내장객체, jsp객체생성, 서버와 클라이언트 연결정보 저장
//     : 공통점 - 페이지 상관없이 값을 유지
//     : 차이점 - 서버에 메모리 저장, 보안상 중요한 내용 유지(로그인정보)

//클라이언트에서 서버에 주소 입력해서 요청하면 
//http값 요청정보를 가져와서 서버에 request에 전달해서 저장
//request내장객체에서 쿠키값 가져오기
// 클라이언트에 있는 모든 쿠키값을 가져옴=> request에 저장
Cookie cookies[]=request.getCookies();
//쿠키값이 있으면 
if(cookies != null){
	// for문을 통해서 배열 한칸씩 접근
	for(int i=0;i <cookies.length;i++){
		if(cookies[i].getName().equals("cname")){
			out.println("쿠키값을 저장한 배열 주소 : "+cookies+"<br>");
			out.println("쿠키주소 : "+cookies[i]+"<br>");
			out.println("쿠키이름 : "+cookies[i].getName()+"<br>");
			out.println("쿠키값 : "+cookies[i].getValue()+"<br>");
		}
	}
}
%>
<input type="button" value="쿠키값 생성" 
onclick="location.href='cookieSet.jsp'">
<input type="button" value="쿠키값 삭제" 
onclick="location.href='cookieDel.jsp'">
</body>
</html>

