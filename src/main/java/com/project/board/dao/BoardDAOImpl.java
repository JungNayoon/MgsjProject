package com.project.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.board.domain.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);

	@Autowired
	private SqlSession sqlSession;

	private static final String NAME_SPACE = "mappers.boardMapper";
	
	private static final String NAME_SPACE_REPLY = "mappers.boardReplyMapper";

	// 공지사항 목록
	@Override
	public List<BoardDTO> adminBoardList(int displayTotalContent, int pageContent, String searchType, String keyword) throws Exception {

		logger.info("공지 게시글 목록 불러오기 adminBoardList - DAO");

		HashMap<String, Object> pageData = new HashMap<>();
		pageData.put("displayTotalContent", displayTotalContent);
		pageData.put("pageContent", pageContent);
		pageData.put("searchType", searchType);
		pageData.put("keyword", keyword);

		return sqlSession.selectList(NAME_SPACE + ".adminBoardList", pageData);

	}

	// 게시글 레벨에 따른 총 갯수. (관리자, 회원, 비회원)
	@Override
	public int totalSearchContent(String searchType, String keyword) throws Exception {

		logger.info("게시글 총 갯수 가져오기");

		// 게시판 레벨에 따른 검색어 결과
		HashMap<String, String> searchData = new HashMap<>();
		
		searchData.put("searchType", searchType);
		searchData.put("keyword", keyword);

		return sqlSession.selectOne(NAME_SPACE + ".totalSearchContent", searchData);
	}

	// 게시글 등록
	@Override
	public void boardWrite(BoardDTO boardDTO) throws Exception {

		logger.info("게시글 등록 boardWrite - DAO");

		sqlSession.insert(NAME_SPACE + ".boardWrite", boardDTO);
	}

	// 게시글 삭제
	@Override
	public void boardDelete(int bno) throws Exception {

		logger.info("BoardDAOImpl에서 게시글 삭제하기 시작");
		
		// 게시글 삭제시 댓글을 수정 한 뒤 게시글을 삭제해야 한다.
		
		sqlSession.delete(NAME_SPACE + ".boardDelete", bno);
	}

	// 게시글 조회
	@Override
	public BoardDTO boardView(int bno) throws Exception {

		logger.info("BoardDAOImpl에서 게시글 조회하기 시작");

		return sqlSession.selectOne(NAME_SPACE + ".boardView", bno);

	}

	// 게시글 수정 로직
	@Override
	public void boardModify(BoardDTO boardDTO) throws Exception {

		logger.info("게시글 수정 로직 실행 boardModify - DAO");

		sqlSession.update(NAME_SPACE + ".boardModify", boardDTO);
	}

}
