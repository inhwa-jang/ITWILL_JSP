package com.itwillbs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

public class MemberController extends HttpServlet{

	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//주소 뽑아오기
		String uri=request.getRequestURI();
		System.out.println(uri);
		String projectPath=request.getContextPath();
		System.out.println(projectPath);
		// 가상주소 /join.me   uri 문자열에서 프로젝트경로 길이 번째부터 끝까지 뽑아오기
		System.out.println("프로젝트경로 길이 : "+projectPath.length());
		String path=uri.substring(projectPath.length());
		System.out.println(path);
		// 주소매핑
		if(path.equals("/insert.me")) {
			// member/insertForm.jsp이동
			RequestDispatcher dispatcher=request.getRequestDispatcher("member/insertForm.jsp");
			dispatcher.forward(request, response);
		}else if(path.equals("/insertPro.me")) {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// request 파라미터 가져오기
			String id=request.getParameter("id");
			String pass=request.getParameter("pass");
			String name=request.getParameter("name");
			// com.itwillbs.domain MemberDTO 파일 만들기
			// MemberDTO 객체생성
			MemberDTO memberDTO=new MemberDTO();
			// set메서드 호출 파라미터 값 저장
			memberDTO.setId(id);
			memberDTO.setPass(pass);
			memberDTO.setName(name);
			// com.itwillbs.service MemberService 파일 만들기
			// MemberService 객체생성
			MemberService memberService=new MemberService();
			// public void insertMember(MemberDTO 주소저장변수) 메서드 정의
			// insertMember(memberDTO) 메서드 호출
			memberService.insertMember(memberDTO);
			// login.me 이동
			response.sendRedirect("login.me");
		}else if(path.equals("/login.me")) {
			// member/loginForm.jsp이동
			RequestDispatcher dispatcher=request.getRequestDispatcher("member/loginForm.jsp");
			dispatcher.forward(request, response);
		}else if(path.equals("/loginPro.me")) {
			//로그인 인증
			// request id, pass 파라미터 가져오기
			String id=request.getParameter("id");
			String pass=request.getParameter("pass");
			// MemberService 객체생성
			MemberService memberService=new MemberService();
			// 리턴할형 MemberDTO  userCheck(String id,String pass) 메서드 정의
			// MemberDTO memberDTO =userCheck 메서드 호출
			MemberDTO memberDTO=memberService.userCheck(id, pass);
			// memberDTO null 아니면 => 아이디 비밀번호 일치 => 세션값 생성 => 메인페이지 이동 main.me
			//           null 이면  => 아이디 비밀번호 틀림 => 자바스크립트 "틀림" 뒤로이동
			if(memberDTO!=null) {
				HttpSession session=request.getSession();
				session.setAttribute("id", id);
				response.sendRedirect("main.me");
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('아이디 비밀번호 틀림');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
		}else if(path.equals("/main.me")) {
			// member/main.jsp이동
			RequestDispatcher dispatcher=request.getRequestDispatcher("member/main.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

}
