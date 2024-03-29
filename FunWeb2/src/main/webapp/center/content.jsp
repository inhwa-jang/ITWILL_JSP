<%@page import="com.itwillbs.domain.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
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
// // content.jsp?num=1
// // request 에서 num 가져오기 
// int num=Integer.parseInt(request.getParameter("num"));
// // BoardDAO 객체생성
// BoardDAO boardDAO=new BoardDAO();
// // 게시판 글 조회수 1 증가
// // 리턴할형 없음 updateReadcount(int num)메서드 정의 
// // update board set readcount = readcount +1 where num=? 
// // updateReadcount(num)메서드 호출
// boardDAO.updateReadcount(num);

// // 리턴할형 BoardDTO  getBoard(int num)메서드 정의 
// // BoardDTO boardDTO = getBoard(num) 메서드 호출
// BoardDTO boardDTO=boardDAO.getBoard(num);

// request.setAttribute("boardDTO", boardDTO);
BoardDTO boardDTO=(BoardDTO)request.getAttribute("boardDTO");
%>
<article>
<h1>Notice Content</h1>
<table id="notice">
<tr><td>글번호</td><td><%=boardDTO.getNum() %></td>
    <td>등록일</td><td><%=boardDTO.getDate() %></td></tr>
<tr><td>글쓴이</td><td><%=boardDTO.getName() %></td>
    <td>조회수</td><td><%=boardDTO.getReadcount() %></td></tr>
<tr><td>글제목</td><td colspan="3"><%=boardDTO.getSubject() %></td></tr>
<tr><td>글내용</td><td colspan="3"><%=boardDTO.getContent() %></td></tr>
</table>
<div id="table_search">
<%
// 로그인id , 글쓴이boardDTO.getName()  일치하면 => 글수정, 글삭제 버튼 보이기
// String id = 세션값 가져오기
String id=(String)session.getAttribute("id");
// 세션값 null 이 아니면 
// if(id!=null){
	// 로그인 글쓴이 비교
// 	if(id.equals(boardDTO.getName())){
		%>
<input type="button" value="글수정" class="btn" onclick="location.href='update.bo?num=<%=boardDTO.getNum()%>'"/>
<input type="button" value="글삭제" class="btn" onclick="location.href='delete.bo?num=<%=boardDTO.getNum()%>'"/>		
		<%
// 	}
// }
%>
<input type="button" value="글목록" class="btn" onclick="location.href='notice.bo'"/>
</div>
<div class="clear"></div>
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