package com.project.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.board.domain.BoardReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	private static final Logger logger = LoggerFactory.getLogger(ReplyDAOImpl.class);

	private static final String NAME_SPACE = "mappers.boardReplyMapper";

	@Autowired
	private SqlSession sqlSession;

	// 댓글 목록 불러오기
	@Override
	public List<BoardReplyDTO> replyList(int bno) throws Exception {

		logger.info("댓글 목록 불러오기 replyList - DAO");

		return sqlSession.selectList(NAME_SPACE + ".replyList", bno);
	}

	// 댓글 작성하기
	@Override
	public void replyWrite(BoardReplyDTO boardReplyDTO) throws Exception {

		logger.info("댓글작성(ajax) replyWrite - DAO : {}", boardReplyDTO);

		sqlSession.insert(NAME_SPACE + ".replyWrite", boardReplyDTO);
	}

	// 댓글 수정하기
	@Override
	public void replyModify(BoardReplyDTO boardReplyDTO) throws Exception {

		logger.info("댓글수정(ajax) replyModify - DAO : {}", boardReplyDTO);

		sqlSession.update(NAME_SPACE + ".replyModify", boardReplyDTO);
	}

	// 댓글 삭제하기
	@Override
	public void replyDelete(BoardReplyDTO boardReplyDTO) throws Exception {

		logger.info("댓글삭제(ajax) replyDelete - DAO : {}", boardReplyDTO);

		sqlSession.delete(NAME_SPACE + ".replyDelete", boardReplyDTO);

	}

	// 댓글 삭제 및 수정시 비밀번호 가져오기
	@Override
	public int getReplyPwd(BoardReplyDTO boardReplyDTO) throws Exception{
		
		logger.info("비밀번호 확인 시작");
		
		int Pwd = sqlSession.selectOne(NAME_SPACE + ".getReplyPwd", boardReplyDTO);		
		
		return Pwd;
	}
}
