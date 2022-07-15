<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieExam1.jsp</title>
</head>
<body>
<%
//쿠키값 가져오기
//쿠키값을 저장할 문자열 변수 
String language="";
// 클라이언트에 있는 모든 쿠키값을 가져옴=> request에 저장
Cookie cookies[]=request.getCookies();
//쿠키값이 있으면 
if(cookies != null){
	// for문을 통해서 배열 한칸씩 접근
	for(int i=0;i <cookies.length;i++){
		// 쿠키이름 비교 "clang" 
		if(cookies[i].getName().equals("clang")){
			// 쿠키값 출력 
			out.println("쿠키이름 : "+cookies[i].getName()+"<br>");
			out.println("쿠키값 : "+cookies[i].getValue()+"<br>");
			//문자열 변수에 쿠키값 저장
			language=cookies[i].getValue();
		}
	}
}
out.println("쿠키값 출력 : "+language);

// 쿠키값이 "korea"이면  "<h1>안녕하세요</h1>"
// 쿠키값이 "english"이면  "<h1>Hello</h1>"
if(language.equals("korea")){
	%><h1>안녕하세요</h1><%
}else if(language.equals("english")){
	%><h1>Hello</h1><%
}else{
	%><h1>안녕하세요</h1><%
}
%>
<form action="cookieExam2.jsp" method="get">
<input type="radio" name="lang" value="korea" <% if(language.equals("korea")){ %>checked<% } %> >한국어 페이지 보기
<input type="radio" name="lang" value="english" <% if(language.equals("english")){ %>checked<% } %>>영어 페이지 보기
<input type="submit" value="언어 설정">
</form>
</body>
</html>