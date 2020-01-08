package com.ezen.jobsearch.board.model;

import java.util.List;
import java.util.Map;

import com.ezen.jobsearch.common.*;

public interface BoardService {
	
	public List<BoardVO> selectAll(SearchVO searchVo);
	public int insertReBoard(BoardVO vo);
	public int insertReply(CommentVO vo);
	public int updateReadCount(int no);
	public BoardVO selectByNo(int seq);
	public CommentVO selectReplyByNo(int seq);
	public int updateBoard(BoardVO vo);
	public boolean checkPwd(int no, String pwd);
	public int deleteBoard(int seq, int type);
	public int selectTotalRecord(SearchVO searchVo);
	public int updateDownCount(int no);
	public List<CommentVO> reply();
	
}
