package com.multi.dao;

import java.util.List;

import com.multi.vo.BoardVO;
//import com.multi.vo.Criteria;
import com.multi.vo.SearchCriteria;

public interface BoardDAO {

	/*
	 * src/main/resource > mappers/boardMapper.xml
	 * xml파일에 구현할 기능에 대한 쿼리문 작성 (CURD)
	 * 
	 */
	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;

	// 게시물 목록 조회
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 게시물 조회
	public BoardVO read(int bno) throws Exception;
	
	// 게시물 수정
	public void update(BoardVO boardVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;
}
