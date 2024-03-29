package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	// 데이터베이스 작업 객체,주제
	// 특징(속성) 저장하는 변수 => 멤버변수
	// 기능을 정의한 함수 => 멤버함수 => 메서드
	
	//디비연결 메서드 정의
	public Connection getConnection() throws Exception{
		// throws Exception : 예외처리는 함수호출하는 곳에서 하겠다
		
//		// //1단계  JDBC 프로그램 드라이버 로더 
//		Class.forName("com.mysql.cj.jdbc.Driver");
//
//		// //2단계  디비연결  DriverManager 디비주소, 디비접속아이디, 디비접속비밀번호 
//		// //      연결정보 저장 => Connection
//		String dbUrl="jdbc:mysql://localhost:3306/jspdb7?serverTimezone=Asia/Seoul";
//		String dbUser="root";
//		String dbPass="1234";
//		Connection con =DriverManager.getConnection(dbUrl, dbUser, dbPass);
//		return con;
		
		// Connection Pool : 미리 디비연결을 서버에서 하고 디비연결 자원을 불러다가 사용
		//                 : 서버에서 하나만 정의하고 자원의 이름을 불러다가 사용, 수정 최소화
		
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	
	
	// 회원가입하는 기능 => 함수정의
	// 리턴할 형 없음
	// 전달받은 값을 저장하는 변수=>매개변수
//	public void insertMember(String id,String pass,String name) {
	// MemberDTO 주소를 저장하는 변수
	public void insertMember(MemberDTO memberDTO) {
		System.out.println("MemberDAO클래스 파일 insertMember()메서드");
		System.out.println("폼에서 전달해온 주소 : "+memberDTO);
		System.out.println("폼에서 전달해온 아이디 : "+memberDTO.getId());
		System.out.println("폼에서 전달해온 비밀번호 : "+memberDTO.getPass());
		System.out.println("폼에서 전달해온 이름 : "+memberDTO.getName());
		
		System.out.println("메서드 시작");
		int a=10;
		int b=0;
//		if(b==0) {
//			System.out.println("0으로 나눔 에러 발생");
//		}else {
//			System.out.println("나누기 : "+ a/b);
//		}
		//예외처리 구문
		Connection con=null;
		PreparedStatement  pstmt=null;
		try {
			// 에러 발생 가능성이 높은 명령
//			System.out.println("나누기 : "+ a/b);
//			1, 2, 3, 4 단계
			//1, 2단계 디비연결 메서드 호출
			con =getConnection();
	
			// //3단계  연결정보를 이용해서 sql구문 만들기 =>  PreparedStatement
			// // String sql="insert into 테이블이름(열이름,열이름) values(값,'값')";
			// // String sql="insert into member(id,pass,name,date) values(?,?,?,?)";
			String sql="insert into member(id,pass,name,date) values(?,?,?,now())";
			pstmt=con.prepareStatement(sql);
			// // 객체생성 후 첫번째 ? 정수형 num 값 넣기, 두번째 ? 문자열 name 값 넣기
			pstmt.setString(1, memberDTO.getId());
			pstmt.setString(2, memberDTO.getPass());
			pstmt.setString(3, memberDTO.getName());
	
			// //4단계   PrepardStatement sql구문 실행 (insert,update,delete)=>executeUpdate()
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// 에러 발생시 메시지 출력
//			System.out.println("0으로 나눔 에러 발생");
			e.printStackTrace();
		}finally {
			// 에러 발생 여부 상관없이 마무리작업=> 내장객체 기억장소 해제
			System.out.println("마무리작업");
			if(pstmt!=null) try { pstmt.close(); } catch (Exception e2) {	}
			if(con!=null) try { con.close(); } catch (Exception e2) {	}			
		}
		
		System.out.println("메서드 종료");
		return;
	}// 회원가입메서드

	// 리턴할형 MemberDTO   getMember(String id) 메서드 정의
	public MemberDTO getMember(String id) {
		MemberDTO memberDTO=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1, 2단계 디비연결 메서드 호출
			con =getConnection();
			
			//3단계  연결정보를 이용해서 sql구문 만들기 =>  PreparedStatement
			// 문자열 => sql구문 변경, 실행할수 있는 내장객체 => PreparedStatement
			String sql="select * from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4단계   PreparedStatement sql구문 실행 (insert,update,delete) ,
//			        select 결과 저장 => ResultSet
			rs=pstmt.executeQuery();
			// 5단계  ResultSet 저장된 내용을 출력, 저장
			// 결과값 행접근 다음행 next() 다음행 => 데이터 있으면 true / 데이터 없으면 false
			// 열접근 => 출력
			if(rs.next()){
				// 다음행 첫번째 행 데이터 있으면 true => 열접근
				// memberDTO 객체생성 => 기억장소 할당
				memberDTO=new MemberDTO();
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPass(rs.getString("pass"));
				memberDTO.setName(rs.getString("name"));     
				memberDTO.setDate(rs.getTimestamp("date")); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close(); } catch (Exception e2) {	}
			if(pstmt!=null) try { pstmt.close(); } catch (Exception e2) {	}
			if(con!=null) try { con.close(); } catch (Exception e2) {	}	
		}
		return memberDTO;
	}//getMember()
	
	// 리턴할형 MemberDTO   userCheck(String id, String pass) 메서드 정의
	public MemberDTO userCheck(String id, String pass) {
		MemberDTO memberDTO=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1, 2단계 디비연결 메서드 호출
			con =getConnection();

			//3단계  연결정보를 이용해서 sql구문 만들기 =>  PreparedStatement
			// sql 폼에서 입력한 아이디 디비에 아이디 일치하고 ,
//			     폼에서 입력한 비밀번호 디비에  비밀번호 일치
			String sql="select * from member where id=? and pass=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);

			// 4단계   PreparedStatement sql구문 실행, select 결과 저장 => ResultSet
			rs=pstmt.executeQuery();

			// 5단계  ResultSet 저장된 내용을 출력, 저장
			// 결과값 행접근 다음행 next() 다음행 => 데이터 있으면 true / 데이터 없으면 false
			// 데이터 있으면 true 아이디 비밀번호 일치 => 세션값 생성 => main.jsp 이동
			// 데이터 없으면 false 아이디 비밀번호 틀림 => 아이디 비밀번호 틀림 메시지 출력 , 뒤로이동
			if(rs.next()) {
				// 다음행 첫번째 행 데이터 있으면 true => 열접근
				// memberDTO 객체생성 => 기억장소 할당
				memberDTO=new MemberDTO();
				// set메서드 호출 열접근을 데이터 저장
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPass(rs.getString("pass"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setDate(rs.getTimestamp("date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close(); } catch (Exception e2) {	}
			if(pstmt!=null) try { pstmt.close(); } catch (Exception e2) {	}
			if(con!=null) try { con.close(); } catch (Exception e2) {	}	
		}
		return memberDTO;
	}
	
	// 리턴할형 없음  updateMember(MemberDTO updateDTO) 수정작업 메서드 정의
	public void updateMember(MemberDTO updateDTO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1, 2단계 디비연결 메서드 호출
			con =getConnection();
			
			//3단계  연결정보를 이용해서 sql구문 만들기 =>  PreparedStatement
			// 문자열 => sql구문 변경, 실행할수 있는 내장객체 => PreparedStatement
			// update 테이블이름 set 수정열=값 where 조건열=값;
			String sql="update member set name=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, updateDTO.getName());
			pstmt.setString(2, updateDTO.getId());
			//4단계   PrepardStatement sql구문 실행 (insert,update,delete)		
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close(); } catch (Exception e2) {	}
			if(pstmt!=null) try { pstmt.close(); } catch (Exception e2) {	}
			if(con!=null) try { con.close(); } catch (Exception e2) {	}	
		}
	}//
	
	// 리턴할형 없음  deleteMember(String id) 수정작업 메서드 정의
	public void deleteMember(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1, 2단계 디비연결 메서드 호출
			con =getConnection();
			
			//3단계  연결정보를 이용해서 sql구문 만들기 =>  PreparedStatement
			// 문자열 => sql구문 변경, 실행할수 있는 내장객체 => PreparedStatement
			String sql="delete from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			//4단계   PrepardStatement sql구문 실행 (insert,update,delete)		
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close(); } catch (Exception e2) {	}
			if(pstmt!=null) try { pstmt.close(); } catch (Exception e2) {	}
			if(con!=null) try { con.close(); } catch (Exception e2) {	}	
		}
	}//
	
}//클래스
