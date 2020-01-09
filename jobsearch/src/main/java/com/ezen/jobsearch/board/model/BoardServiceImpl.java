package com.ezen.jobsearch.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.jobsearch.common.*;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAO boardDao;
		

	public List<BoardVO> selectAll(SearchVO searchVo){
		return boardDao.selectAll(searchVo);
	}
	
	
	public int insertBoard(BoardVO vo){
		return boardDao.insertBoard(vo);
	}
	
	public int insertReply(CommentVO vo){
		return boardDao.insertReply(vo);
	}
	
	public int updateReadCount(int no){
		return boardDao.updateReadCount(no);
	}
		
	public BoardVO selectByNo(int seq){
		return boardDao.selectByNo(seq);
	}
	
	public CommentVO selectReplyByNo(int seq){
		return boardDao.selectReplyByNo(seq);
	}
	
	
	public int updateBoard(BoardVO vo){
		return boardDao.updateBoard(vo);
	}
	
	public int updateReply(CommentVO vo){
		return boardDao.updateReply(vo);
	}

	
		
	public int deleteBoard(int seq, int type){
		return boardDao.deleteBoard(seq, type);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return boardDao.selectTotalRecord(searchVo);
	}

	@Override
	public int updateDownCount(int no) {
		return boardDao.updateDownCount(no);
	}
	
	

	@Override
	public List<CommentVO> reply(){
		return boardDao.reply();
	}


	
	
	
	
}



