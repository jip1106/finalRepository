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
	

	
	public int updateReadCount(int no){
		return reBoardDao.updateReadCount(no);
	}
		
	public BoardVO selectByNo(int no){
		return reBoardDao.selectByNo(no);
	}
	
	
	public int updateReBoard(BoardVO vo){
		return reBoardDao.updateReBoard(vo);
	}

	@Override
	public boolean checkPwd(int no, String pwd) {
		String dbPwd=reBoardDao.selectPwd(no);
		
		if(dbPwd.equals(pwd)) {
			return true;  //鍮꾨�踰덊샇 �씪移�
		}else {
			return false; //遺덉씪移�
		}
	}
		
	public void deleteReBoard(Map<String, String> map){
		reBoardDao.deleteReBoard(map);
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
	@Transactional
	public int reply(BoardVO vo) {
		//�듃�옖�옲�뀡 泥섎━
		int cnt=reBoardDao.updateSortNo(vo);
		
		cnt=reBoardDao.reply(vo);
		
		return cnt;		
	}
	
	
	
	
}



