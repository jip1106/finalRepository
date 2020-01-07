package com.ezen.jobsearch.board.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.jobsearch.common.SearchVO;

@Repository
public class BoardDAOMybatis implements BoardDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace="config.mybatis.mapper.oracle.board.board.";
	
	
	public List<BoardVO> selectAll(SearchVO searchVo){
		List<BoardVO> list
			=sqlSession.selectList(namespace+"selectAll", searchVo);
		
		return list;
	}
	
	
	public int insertReBoard(BoardVO vo) {
		int cnt=sqlSession.insert(namespace+"insertReBoard", vo);
		return cnt;
	}
	
	public int updateReadCount(int no){
		int cnt=sqlSession.update(namespace+"updateReadCount", no);
		return cnt;
	}
	
	public BoardVO selectByNo(int seq){
		BoardVO vo=sqlSession.selectOne(namespace+"selectByNo", seq);
		return vo;
	}
	
	public int updateBoard(BoardVO vo){
		int cnt=sqlSession.update(namespace+"updateBoard", vo);
		return cnt;
	}

	@Override
	public String selectPwd(int no) {
		String pwd=sqlSession.selectOne(namespace+"selectPwd", no);
		return pwd;
	}
	
	public int deleteBoard(int seq) {
		return sqlSession.delete(namespace+"deleteBoard", seq);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",
				searchVo);
	}

	@Override
	public int updateDownCount(int no) {
		return sqlSession.update(namespace+"updateDownCount", no);
	}

	@Override
	public int updateSortNo(BoardVO vo) {
		return sqlSession.update(namespace+"updateSortNo", vo);
	}

	@Override
	public int reply(BoardVO vo) {
		return sqlSession.insert(namespace+"reply", vo);
	}
	
	
	
	
}








