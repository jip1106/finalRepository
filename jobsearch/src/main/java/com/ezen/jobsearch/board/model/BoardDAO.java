package com.ezen.jobsearch.board.model;

import java.util.List;
import java.util.Map;

import com.ezen.jobsearch.common.*;

public interface BoardDAO {
	
	public List<BoardVO> selectAll(SearchVO searchVo);
	
	public int insertReBoard(BoardVO vo);
	
	public int updateReadCount(int no);
	public BoardVO selectByNo(int seq);
	public int updateBoard(BoardVO vo);
	public String selectPwd(int no);
	public int deleteBoard(int seq);
	public int selectTotalRecord(SearchVO searchVo);
	public int updateDownCount(int no);
	public int updateSortNo(BoardVO vo);
	public int reply(BoardVO vo);
	
}
