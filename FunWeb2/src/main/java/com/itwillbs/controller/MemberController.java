package com.itwillbs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;
import com.mysql.cj.Session;

public class MemberController extends HttpServlet{
	//서블릿(처리담당자) 파일 상속=> 주소매핑
	// 서블릿이 처리를 하기위해서 doGet() doPost() service().. 메서드 자동으로 호출
	// 메서드오버라이딩
	
//	http://localhost:8080/FunWeb2/join.me
	
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터 전송방식이 get방식, post방식 상관없이 호출
		System.out.println("MemberController doPro()");
		// 가상주소 => 실제 주소 매핑
		// /join.me => join.jsp 매핑
		// 주소에서 join.me 뽑아오기
		// URL   http://localhost:8080/FunWeb2/join.me
		// URI       /FunWeb2/join.me
		// 프로젝트경로 /FunWeb2 
		// 찾는 주소   /join.me
		String uri=request.getRequestURI();
		System.out.println(uri);
		String projectPath=request.getContextPath();
		System.out.println(projectPath);
		// 가상주소 /join.me   uri 문자열에서 프로젝트경로 길이 번째부터 끝까지 뽑아오기
		System.out.println("프로젝트경로 길이 : "+projectPath.length());
		String path=uri.substring(projectPath.length());
		System.out.println(path);
		
		if(path.equals("/join.me")) {
			System.out.println("/join.me 매핑");
			// join.jsp 매핑=> 이동
			// jsp 명령 이동
			// 1. 주소줄에 보이면서(바뀌면서) 이동방식(하이퍼링크,location.href,sendRedirect())
//			response.sendRedirect("member/join.jsp");
			
			// 2. 주소줄에 안보이면서(안 바뀌면서, request모든내용을 가지고 감) 이동방식(forward액션)
			RequestDispatcher dispatcher=request.getRequestDispatcher("member/join.jsp");
			dispatcher.forward(request, response);
			
		}else if(path.equals("/joinPro.me")) {
			System.out.println("/joinPro.me 매핑");
			// 디비 insert 
			request.setCharacterEncoding("utf-8");
			// 폼에서 가져온값 request에 저장 
			// "id" "pass" "name" email address phone mobile 파라미터 값 가져오기
			String id=request.getParameter("id");
			String pass=request.getParameter("pass");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String address=request.getParameter("address");
			String phone=request.getParameter("phone");
			String mobile=request.getParameter("mobile");

			// 데이터를 저장하기위해서 MemberDTO 기억장소 할당 => 객체생성
			MemberDTO memberDTO=new MemberDTO();

			// set메서드 호출 => 멤버변수에 id pass name email address phone mobile 값 저장
			memberDTO.setId(id);
			memberDTO.setPass(pass);
			memberDTO.setName(name);
			memberDTO.setEmail(email);
			memberDTO.setAddress(address);
			memberDTO.setPhone(phone);
			memberDTO.setMobile(mobile);
			// joinPro.jsp 
			// => 처리하는 자바파일(com.itwillbs.service패키지 MemberService)
			// joinPro메서드() 정의 
			// MemberService 객체생성 
			// joinPro메서드() 호출
			MemberService memberService=new MemberService();
			memberService.joinPro(memberDTO);
			
			
			// 로그인 페이지 주소줄이 변경되면서 이동 /login.me
			response.sendRedirect("login.me");
			
		}else if(path.equals("/login.me")) {
			System.out.println("/login.me 매핑");
//			http://localhost:8080/FunWeb2/login.me
//		가상주소	/login.me  => member/login.jsp 이동
			RequestDispatcher dispatcher=request.getRequestDispatcher("member/login.jsp");
			dispatcher.forward(request, response);
		}else if(path.equals("/loginPro.me")) {
			System.out.println("/loginPro.me 매핑");
			// request 저장된 id,pass 파라미터 가져오기
			String id=request.getParameter("id");
			String pass=request.getParameter("pass");
			
			// loginPro.jsp => MemberService loginPro(String id,String pass)메서드 정의
			// MemberService 객체생성
			MemberService memberService =new MemberService();
			// 메서드 호출
			MemberDTO memberDTO=memberService.loginPro(id, pass);
			// if memberDTO null이 아니면 아이디 비밀번호 일치 => 세션값 생성 "id",id main.jsp 이동 
			// if memberDTO null이면  "아이디 비밀번호 틀림" 뒤로이동
			if(memberDTO!=null){
				//아이디 비밀번호 일치
				// 세션객체생성
				HttpSession session=request.getSession();
				//세션값 저장
				session.setAttribute("id", id);
				// 주소가 바뀌면서 이동  main.me
				response.sendRedirect("main.me");
			}else{
				// 아이디 비밀번호 틀림
				// 자바 => html출력
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('아이디 비밀번호 틀림');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			
			
		}else if(path.equals("/main.me")) {
			System.out.println("/main.me 매핑");
			// main/main.jsp
			RequestDispatcher dispatcher=request.getRequestDispatcher("main/main.jsp");
			dispatcher.forward(request, response);
		}else if(path.equals("/welcome.me")) {
			System.out.println("/welcome.me 매핑");
			// company/welcome.jsp
			RequestDispatcher dispatcher=request.getRequestDispatcher("company/welcome.jsp");
			dispatcher.forward(request, response);			
		}else if(path.equals("/logout.me")) {
			System.out.println("/logout.me 매핑");
			// logout.me 가상주소 => 세션값 삭제=> main.me 이동 
			// 세션객체생성
			HttpSession session=request.getSession();
			session.invalidate();
			// 주소가 바뀌면서 이동  main.me
			response.sendRedirect("main.me");
		}else if(path.equals("/update.me")) {
			System.out.println("/update.me 매핑");
			// 세션값 가져오기
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
			
			// 디비작업 : 회원정보 조회
			// MemberService 객체생성
			MemberService memberService =new MemberService();
			// 메서드 호출
			MemberDTO memberDTO=memberService.getMember(id);
			// request 모든 데이터 가지고 이동 방식 dispatcher.forward()
			request.setAttribute("memberDTO", memberDTO);
			
//			update.me 가상주소 => member/update.jsp 이동 
			RequestDispatcher dispatcher=request.getRequestDispatcher("member/update.jsp");
			dispatcher.forward(request, response);
		}else if(path.equals("/updatePro.me")) {
			System.out.println("/updatePro.me 매핑");
//			updatePro.me 가상주소 => DB처리 => main.me 이동
			// request한글처리
			request.setCharacterEncoding("utf-8");
			// 수정할 정보를 request가져오기
			String id=request.getParameter("id");
			String pass=request.getParameter("pass");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String address=request.getParameter("address");
			String phone=request.getParameter("phone");
			String mobile=request.getParameter("mobile");
			// MemberDTO updateDTO 객체생성
			// 수정할 정보를 저장
			MemberDTO updateDTO=new MemberDTO();
			updateDTO.setId(id);
			updateDTO.setPass(pass);
			updateDTO.setName(name);
			updateDTO.setEmail(email);
			updateDTO.setAddress(address);
			updateDTO.setPhone(phone);
			updateDTO.setMobile(mobile);
			
			// MemberService 객체생성
			MemberService memberService=new MemberService();
			// 메서드 호출
			MemberDTO memberDTO=memberService.loginPro(id, pass);
			if(memberDTO!=null) {
				// if memberDTO null이 아니면 아이디 비밀번호 일치 => 수정 main.me 이동 
				// 메서드 호출 updateMember()
				memberService.updateMember(updateDTO);
				// 주소가 바뀌면서 이동  main.me
				response.sendRedirect("main.me");
			}else {
				// if memberDTO null이면  "아이디 비밀번호 틀림" 뒤로이동
				// 자바 => html출력
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('아이디 비밀번호 틀림');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
		}
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터 전송방식이 get방식이면 자동호출
		System.out.println("MemberController doGet()");
		doPro(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터 전송방식이 post방식이면 자동호출
		System.out.println("MemberController doPost()");
		doPro(request, response);
	}

	
}
