package com.ezen.jobsearch.board.model;

import java.util.List;
import java.util.Map;

import com.ezen.jobsearch.common.*;

public interface BoardService {
	
	public List<BoardVO> selectAll(SearchVO searchVo);
	public int insertReBoard(BoardVO vo);
	public int updateReadCount(int no);
	public BoardVO selectByNo(int no);
	public int updateReBoard(BoardVO vo);
	public boolean checkPwd(int no, String pwd);
	public void deleteReBoard(Map<String, String> map);
	public int selectTotalRecord(SearchVO searchVo);
	public int updateDownCount(int no);
	public int reply(BoardVO vo);
	
}
