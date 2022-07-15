package com.itwillbs.service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

public class MemberService {

	// joinPro메서드() 정의
	public void joinPro(MemberDTO memberDTO) {
		System.out.println("MemberService joinPro()");
	//  디비작업 자바파일 => 패키지(폴더) member  파일이름 MemberDAO
		// MemberDAO 파일 사용할때 기억장소 할당 => 객체생성
		MemberDAO memberDAO=new MemberDAO();

		//  public void insertMember(MemberDTO 주소저장변수) 메서드 정의
		// MemberDAO 파일안에 있는 insertMember(MemberDTO 주소)메서드 호출
		memberDAO.insertMember(memberDTO);
	}
	
	// loginPro.jsp => MemberService loginPro(String id,String pass)메서드 정의
	public MemberDTO loginPro(String id,String pass) {
		// MemberDAO 객체생성
		MemberDAO memberDAO=new MemberDAO();
		// 리턴할형 MemberDTO  userCheck(String id,String pass) 메서드 정의 
		// MemberDTO memberDTO =  userCheck(id,pass) 메서드 호출
		MemberDTO memberDTO=memberDAO.userCheck(id, pass);
		return memberDTO;
	}
	
	// public 리턴할형 MemberDTO 함수이름 getMember(String id)  메서드 정의
	public MemberDTO getMember(String id) {
		// MemberDAO 객체생성
		MemberDAO memberDAO=new MemberDAO();
		// MemberDTO memberDTO =  getMember(id) 메서드 호출
		MemberDTO memberDTO=memberDAO.getMember(id);
		return memberDTO;
	}
	
	// public void updateMember(MemberDTO 주소저장변수) 메서드 정의
	public void updateMember(MemberDTO updateDTO) {
		// MemberDAO 객체생성
		MemberDAO memberDAO=new MemberDAO();
		// updateMember(updateDTO) 메서드 호출
		memberDAO.updateMember(updateDTO);
	}
	
	
	
}
