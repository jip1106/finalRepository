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
	private BoardDAO reBoardDao;
		

	public List<BoardVO> selectAll(SearchVO searchVo){
		return reBoardDao.selectAll(searchVo);
	}
	
	
	public int insertReBoard(BoardVO vo){
		return reBoardDao.insertReBoard(vo);
	}
	
	public int insertReply(CommentVO vo){
		return reBoardDao.insertReply(vo);
	}
	
	public int updateReadCount(int no){
		return reBoardDao.updateReadCount(no);
	}
		
	public BoardVO selectByNo(int seq){
		return reBoardDao.selectByNo(seq);
	}
	
	public CommentVO selectReplyByNo(int seq){
		return reBoardDao.selectReplyByNo(seq);
	}
	
	
	public int updateBoard(BoardVO vo){
		return reBoardDao.updateBoard(vo);
	}

	@Override
	public boolean checkPwd(int no, String pwd) {
		String dbPwd=reBoardDao.selectPwd(no);
		
		if(dbPwd.equals(pwd)) {
			return true;  
		}else {
			return false; 
		}
	}
		
	public int deleteBoard(int seq, int type){
		return reBoardDao.deleteBoard(seq, type);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return reBoardDao.selectTotalRecord(searchVo);
	}

	@Override
	public int updateDownCount(int no) {
		return reBoardDao.updateDownCount(no);
	}
	
	

	@Override
	public List<CommentVO> reply(){
		return reBoardDao.reply();
	}


	
	
	
	
}



