package com.law.hansong.dao;

import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.law.hansong.dto.Board;
import com.law.hansong.dto.BoardFile;


@Repository
public class BoardDao {

	@Autowired
	   private SqlSessionTemplate sqlSession;

	// 게시글 갯수
	public int getListCount() {
		return sqlSession.selectOne("Board.getListCount");
	}
	// 게시글 목록
	public List<Board> getBoardList(Map<String, Object> map) {
		return sqlSession.selectList("Board.selectList",map);
	}
	// 게시글 조회수
	public int updateReadCount(Long id) {
		return sqlSession.update("Board.updateReadCount", id);
	}
	// 게시글 상세보기
	public Board searchDetail(Long id) {
		return sqlSession.selectOne("Board.getDetail", id);
	}
	// 게시글 등록하기
	public int addBoard(Board board) {
		return sqlSession.insert("Board.insertBoard", board); 
	}
	// 파일 첨부
	public int fileInsert(BoardFile boardFile) {
		return sqlSession.insert("Board.fileInsert", boardFile); 		
	}
	// 파일 첨부 리스트
	public List<BoardFile> getFileList(Long id) {
		return sqlSession.selectList("Board.getFileList", id);
	}
	// 게시글 수정
	public int updateBoard(Board board) {
		return sqlSession.update("Board.updateBoard", board); 		
	}	
	// 게시글 삭제
	public int deleteBoard(Long id) {
		return sqlSession.delete("Board.deleteBoard", id); 
	}	
	// 파일 삭제
	public int fileDelete(Map<String, Object> returnMap) {
		return sqlSession.delete("Board.fileDelete", returnMap); 
	}


	


	
	

	
}
