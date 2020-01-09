package com.ezen.jobsearch.board.model;

import java.util.List;
import java.util.Map;

import com.ezen.jobsearch.common.*;

public interface BoardDAO {
	
	public List<BoardVO> selectAll(SearchVO searchVo);
	
	public int insertBoard(BoardVO vo);
	
	public int insertReply(CommentVO vo);
	
	
	public int updateReadCount(int no);
	public BoardVO selectByNo(int seq);
	public CommentVO selectReplyByNo(int seq);
	public int updateBoard(BoardVO vo);
	public int updateReply(CommentVO vo);
	public String selectPwd(int no);
	public int deleteBoard(int seq, int type);
	public int selectTotalRecord(SearchVO searchVo);
	public int updateDownCount(int no);
	public int updateSortNo(BoardVO vo);
	public List<CommentVO> reply();
	
}
