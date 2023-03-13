package com.project.board.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.board.dao.BoardDAO;
import com.project.board.domain.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {

	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Autowired
	private BoardDAO boardDAO;

	// 공지 게시글 목록보기
	@Override
	public List<BoardDTO> adminBoardList(int displayTotalContent, int pageContent, String searchType, String keyword) throws Exception {

		logger.info("공지 게시글 목록 불러오기");

		return boardDAO.adminBoardList(displayTotalContent, pageContent, searchType, keyword);
	}

	// 게시글 등록하기
	@Override
	public void boardWrite(BoardDTO boardDTO) throws Exception {

		logger.info("게시글 작성(service), boardWrite : {}", boardDTO);

		boardDAO.boardWrite(boardDTO);
	}

	// 게시글 삭제하기
	@Override
	public void boardDelete(int bno) throws Exception {

		logger.info("게시글 삭제(service), boardDelete : {}", bno);

		boardDAO.boardDelete(bno);
	}

	// 공지 게시글 조회하기
	@Override
	public BoardDTO boardView(int bno) throws Exception {

		logger.info("{} 번 게시글 조회 BoardServiceImpl - service", bno);

		return boardDAO.boardView(bno);
	}

	// 게시글 수정
	@Override
	public void boardModify(BoardDTO boardDTO) throws Exception {

		logger.info("공지 게시글 수정 boardModify - service");

		boardDAO.boardModify(boardDTO);
	}

	// 게시글 레벨에 따른 총 갯수 가져오기
	@Override
	public int totalSearchContent(String searchType, String keyword) throws Exception {

		logger.info("게시글 총 갯수 가져오기");

		return boardDAO.totalSearchContent(searchType, keyword);
	}

}
