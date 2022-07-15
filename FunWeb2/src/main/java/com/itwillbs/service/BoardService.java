package com.itwillbs.service;

import java.util.List;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.domain.BoardDTO;

public class BoardService {
	// 리턴할형 없음 insertBoard(BoardDTO boardDTO) 메서드 정의
	public void insertBoard(BoardDTO boardDTO) {
		//처리
		boardDTO.setReadcount(0);
		// BoardDAO 객체생성
		BoardDAO boardDAO=new BoardDAO();
		// insertBoard 메서드 호출
		boardDAO.insertBoard(boardDTO);
	}
	//List<BoardDTO> boardList=boardService.getBoardList(startRow, pageSize);
	public List<BoardDTO> getBoardList(int startRow,int pageSize){
		// BoardDAO 객체생성
		BoardDAO boardDAO=new BoardDAO();
		// getBoardList 메서드 호출
		List<BoardDTO> boardList=boardDAO.getBoardList(startRow, pageSize);
		return boardList;
	}
	
	// 리턴할형int  getBoardCount() 메서드 정의  
	public int getBoardCount() {
		BoardDAO boardDAO=new BoardDAO();
		int count=boardDAO.getBoardCount();
		return count;
	}
	
	// 리턴할형 BoardDTO  getBoard(int num)메서드 정의
	public BoardDTO getBoard(int num) {
		// BoardDAO 객체생성
		BoardDAO boardDAO=new BoardDAO();
		// getBoard 메서드 호출
		BoardDTO boardDTO=boardDAO.getBoard(num);
		return boardDTO;
	}
	
	// 리턴할형없음 updateBoard(BoardDTO boardDTO) 메서드 정의 
	public void updateBoard(BoardDTO boardDTO) {
		// BoardDAO 객체생성
		BoardDAO boardDAO=new BoardDAO();
		// updateBoard 메서드 호출
		boardDAO.updateBoard(boardDTO);
	}
	
	// 리턴할형없음 deleteBoard(int num) 메서드 정의 , 조건 num=?
	public void deleteBoard(int num) {
		// BoardDAO 객체생성
		BoardDAO boardDAO=new BoardDAO();
		// deleteBoard 메서드 호출
		boardDAO.deleteBoard(num);
	}
	
	
}
