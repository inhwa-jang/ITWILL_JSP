package com.itwillbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.service.BoardService;

public class BoardController extends HttpServlet{
	// 서블릿 상속 => 서블릿 파일이 됨
	// 서블릿 doGet() doPost() ... 메서드 호출
	// doGet() doPost() 메서드 재정의(메서드 오버라이딩)
	
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardController doPro()");
		// 가상주소 => 실페이지 연결 주소매핑
		
		// 가상주소 뽑아오기
		// URL   http://localhost:8080/FunWeb2/write.bo
		// URI       /FunWeb2/write.bo => 8부터 끝까지 뽑아오기
		// 프로젝트경로 /FunWeb2 => 8
		// 찾는 주소   /write.bo
		String uri=request.getRequestURI();
		System.out.println(uri);
		String projectPath=request.getContextPath();
		System.out.println(projectPath);
		String path=uri.substring(projectPath.length());
		System.out.println(path);
		
		if(path.equals("/write.bo")) {
			System.out.println("/write.bo 매핑");
//			/write.bo => center/write.jsp 매핑
			
			// 1. 주소줄에 보이면서(바뀌면서) 이동방식(하이퍼링크,location.href,sendRedirect())
//			response.sendRedirect("center/write.jsp");
			
			// 2. 주소줄에 안보이면서(안 바뀌면서, request모든내용을 가지고 감) 이동방식(forward액션)
			RequestDispatcher dispatcher=request.getRequestDispatcher("center/write.jsp");
			dispatcher.forward(request, response);
		}else if(path.equals("/writePro.bo")) {
			System.out.println("/writePro.bo 매핑");
			//디비파일
			// request한글처리
			request.setCharacterEncoding("utf-8");
			// pass name subject content 파라미터 가져오기
			String name=request.getParameter("name");
			String pass=request.getParameter("pass");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
//			int readcount=0;
			// BoardDTO 객체생성
			BoardDTO boardDTO=new BoardDTO();
			// set메서드 호출 파라미터값 저장 <= pass name subject content readcount
			boardDTO.setName(name);
			boardDTO.setPass(pass);
			boardDTO.setSubject(subject);
			boardDTO.setContent(content);
//			boardDTO.setReadcount(readcount);
			
			// 패키지 com.itwillbs.service 파일이름 BoardService 
			// 리턴할형 없음 insertBoard(BoardDTO boardDTO) 메서드 정의
//			BoardService 객체생성
			BoardService boardService=new BoardService();
			// insertBoard(boardDTO 주소값) 호출
			boardService.insertBoard(boardDTO);
			
			// notice.bo 주소가 바뀌면서 이동
			response.sendRedirect("notice.bo");
		}else if(path.equals("/notice.bo")){
			// 글목록 데이터 가져오기
//			http://localhost:8080/FunWeb2/notice.bo
//			http://localhost:8080/FunWeb2/notice.bo?pageNum=2
			int pageSize=10;
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null){
		 		pageNum="1";
			}
			int currentPage=Integer.parseInt(pageNum);
			int startRow =(currentPage-1)*pageSize+1; 
			
			BoardService boardService=new BoardService();
			List<BoardDTO> boardList=boardService.getBoardList(startRow, pageSize);
			
			//페이징 처리
			// 게시판 글개수
			// 리턴할형int  getBoardCount() 메서드 정의  => 호출
			int count=boardService.getBoardCount();
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount= count/pageSize+ (count%pageSize==0?0:1);
			if(endPage > pageCount){
		 		endPage=pageCount;
			}
			
			//request에 저장 
			request.setAttribute("boardList", boardList);
			// startPage  pageBlock  endPage currentPage  pageCount
			request.setAttribute("startPage", startPage);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("endPage", endPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageCount", pageCount);
			
			// center/notice.jsp 이동
			RequestDispatcher dispatcher=request.getRequestDispatcher("center/notice.jsp");
			dispatcher.forward(request, response);
		}else if(path.equals("/content.bo")) {
			// http://localhost:8080/FunWeb2/content.bo?num=15
			// num 파라미처 가져오기
			int num=Integer.parseInt(request.getParameter("num"));
			// BoardService 객체생성, getBoard() 메서드호출
			BoardService boardService=new BoardService();
			BoardDTO boardDTO=boardService.getBoard(num);
			// request 데이터 저장
			request.setAttribute("boardDTO", boardDTO);
			// center/content.jsp 이동
			RequestDispatcher dispatcher=request.getRequestDispatcher("center/content.jsp");
			dispatcher.forward(request, response);
		}else if(path.equals("/update.bo")) {
			// http://localhost:8080/FunWeb2/update.bo?num=15
			// num 파라미처 가져오기
			int num=Integer.parseInt(request.getParameter("num"));
			// BoardService 객체생성, getBoard() 메서드호출
			BoardService boardService=new BoardService();
			BoardDTO boardDTO=boardService.getBoard(num);
			// request 데이터 저장
			request.setAttribute("boardDTO", boardDTO);
			// center/update.jsp 이동
			RequestDispatcher dispatcher=request.getRequestDispatcher("center/update.jsp");
			dispatcher.forward(request, response);
		}else if(path.equals("/updatePro.bo")) {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// request 파라미터 값 가져오기
			int num=Integer.parseInt(request.getParameter("num"));
			String name=request.getParameter("name");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
			// BoardDTO 객체생성
			BoardDTO boardDTO=new BoardDTO();
			// 멤버변수 파라미터값 저장
			boardDTO.setNum(num);
			boardDTO.setName(name);
			boardDTO.setSubject(subject);
			boardDTO.setContent(content);
			// BoardService 객체생성
			BoardService boardService=new BoardService();
			// updateBoard() 메서드 호출
			boardService.updateBoard(boardDTO);
			// notice.bo 주소가 변경되면서 이동
			response.sendRedirect("notice.bo");
		}else if(path.equals("/delete.bo")) {
			// http://localhost:8080/FunWeb2/delete.bo?num=15
			// num 파라미처 가져오기
			int num=Integer.parseInt(request.getParameter("num"));
			// BoardService 객체생성
			BoardService boardService=new BoardService();
			// deleteBoard(num) 메서드호출
			boardService.deleteBoard(num);
			// notice.bo 주소가 변경되면서 이동
			response.sendRedirect("notice.bo");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardController doGet()");
		doPro(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardController doPost()");
		doPro(request, response);
	}

}
