<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwillbs.domain.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#rr{
	color: red;
	}
</style>
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="notice.bo">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="fnotice.bo">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 게시판 -->
<%

// //날짜 => 문자열(원하는 포맷) 변경
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");

// request.setAttribute("boardList", boardList);
List<BoardDTO> boardList=(List<BoardDTO>)request.getAttribute("boardList");

int startPage=(Integer)request.getAttribute("startPage");
int pageBlock=(Integer)request.getAttribute("pageBlock");
int endPage=(Integer)request.getAttribute("endPage");
int currentPage=(Integer)request.getAttribute("currentPage");
int pageCount=(Integer)request.getAttribute("pageCount");
%>
<article>
<h1>Notice</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    <%
    // 배열크기 : boardList.size()
    for(int i=0;i<boardList.size();i++){
//     	//배열 한칸 데이터 가져올때 boardList.get()
//     	// List<BoardDTO> 데이터 타입으로 가져오면 형변환없이 사용가능
    	BoardDTO boardDTO=boardList.get(i);
    	%>
 <tr onclick="location.href='content.bo?num=<%=boardDTO.getNum()%>'">
 <td><%=boardDTO.getNum() %></td>
     <td class="left"><%=boardDTO.getSubject() %></td>
    <td><%=boardDTO.getName() %></td>
    <td><%=dateFormat.format(boardDTO.getDate())%></td>
    <td><%=boardDTO.getReadcount() %></td></tr>   	
    	<%
    }
    %>
</table>
<div id="table_search">
<input type="text" name="search" class="input_box">
<input type="button" value="search" class="btn">
</div>
<%
// String id = 세션값을 가져오기 
String id=(String)session.getAttribute("id");
// 세션값이 있으면 글쓰기 버튼 보이기
if(id!=null){
	%>
<div id="table_search">
<input type="button" value="글쓰기" class="btn" 
    onclick="location.href='write.bo'">
</div>
	<%
}
%>
<div class="clear"></div>
<div id="page_control">

<%
if(startPage > pageBlock){
	%><a href="notice.bo?pageNum=<%=startPage-pageBlock %>">Prev</a><%
}

for(int i=startPage;i<=endPage;i++){
	if(i==currentPage){
		%>
		<span id="rr"><%=i %></span>
		<%
	}else{
		%>
		<a href="notice.bo?pageNum=<%=i %>"><%=i %></a>
		<%
	}
	
}

if(endPage < pageCount){
	%>
	<a href="notice.bo?pageNum=<%=startPage+pageBlock %>">Next</a>
	<%
}
%>

</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>