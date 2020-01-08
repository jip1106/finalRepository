package com.ezen.jobsearch.board.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.jobsearch.board.model.BoardService;
import com.ezen.jobsearch.board.model.BoardVO;
import com.ezen.jobsearch.board.model.CommentVO;
import com.ezen.jobsearch.common.*;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger
	=LoggerFactory.getLogger(BoardController.class); 

	@Autowired
	private BoardService BoardService;

	@RequestMapping("/list.do")
	public String list(@ModelAttribute SearchVO searchVo, 
				Model model) {
	
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<BoardVO> list=BoardService.selectAll(searchVo);
		List<CommentVO> replylist = BoardService.reply();
		
		
		int totalRecord=BoardService.selectTotalRecord(searchVo);
	
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("replylist", replylist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write_get() {
		

		return "board/boardWrite";
	}
	
	@RequestMapping(value="/write.do", method = RequestMethod.POST)
	public String write_post(@ModelAttribute BoardVO BoardVo, 
			HttpServletRequest request, Model model) {
		
		String msg="", url="";
		int cnt=BoardService.insertReBoard(BoardVo);
	

		if(cnt>0) {
			
			url="/board/list.do";
		}else {
			
			url="/board/write.do";
		}

		//3		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@RequestMapping("/countUpdate.do")
	public String countUpdate(@RequestParam(defaultValue = "0") int seq,
			Model model) {
	
		if(seq==0) {
		
			model.addAttribute("url", "/board/list.do");
			
			return "common/message";
		}
		
		int cnt=BoardService.updateReadCount(seq);
		
		return "redirect:/board/detail.do?seq="+seq+"&type=1";		
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam(defaultValue = "0") int seq, @RequestParam int type,
			Model model) {
		
		 if(seq==0) {
		 
		 model.addAttribute("url", "/board/list.do");
		 
		 return "common/message"; }
		 
		 
		
		if(type==1) {
			
			BoardVO BoardVo=BoardService.selectByNo(seq);
			model.addAttribute("vo", BoardVo);
			
		} else if (type ==2) {
			
			CommentVO vo=BoardService.selectReplyByNo(seq);
			model.addAttribute("vo", vo);
			
		}
		model.addAttribute("type", type);
		return "board/boardDetail";
	}

	
	@RequestMapping(value="/delete.do", method = RequestMethod.GET)
	public String delete_get(@RequestParam(defaultValue = "0") int seq, @RequestParam int type,
			Model model) {
	
		String msg="", url="";
		
		
		int cnt=BoardService.deleteBoard(seq, type);

		if(cnt>0) {
			msg="삭제성공";
			url="/board/list.do";
		}else {
			msg="삭제실패";
			url="/board/detail.do?seq="+seq;
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping(value="/edit.do", method =RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue = "0") int seq, @RequestParam int type,
			Model model) {
		
		String re = "";
		
		if(seq==0) {
			model.addAttribute("url", "/board/list.do");
			
			return "common/message";
		}
	
		if(type==1) {
			
			BoardVO BoardVo=BoardService.selectByNo(seq);
			model.addAttribute("vo", BoardVo);
			re = "board/boardEdit";
		} else if (type ==2) {
			
			CommentVO vo=BoardService.selectReplyByNo(seq);
			model.addAttribute("vo", vo);
			model.addAttribute("replyrw", 1);
			model.addAttribute("seq", seq);
			re = "board/boardReply";
		}
		
		return re;
		
	}
	
	@RequestMapping(value="/edit.do", method = RequestMethod.POST)
	public String edit_post(@ModelAttribute BoardVO BoardVo,
			HttpServletRequest request,	Model model) {
		
		String msg="", url="";
		
			int cnt=BoardService.updateBoard(BoardVo);
			if(cnt>0) {
				
				msg="수정성공";
				url="/board/list.do";
				
			}else {
				msg="수정실패";
				url="/reBoard/detail.do?no="+BoardVo.getBoardSeq();
			}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/reply.do", method = RequestMethod.GET)
	public String reply_get(@RequestParam(defaultValue = "0") int seq,
			ModelMap model) {
		
		BoardVO vo=BoardService.selectByNo(seq);
		
		model.addAttribute("vo", vo);
		return "board/boardReply";
	}
	
	
	
	@RequestMapping(value="/reply.do", method=RequestMethod.POST) 
	public String reply_post(@ModelAttribute CommentVO vo, HttpServletRequest request, @RequestParam int boardSeq, ModelMap model) {
		
		vo.setRefBoardseq(boardSeq);
		
		int cnt=BoardService.insertReply(vo);
		 
		if(cnt>0) { 
		
			
			model.addAttribute("msg", "답글작성성공"); 
			model.addAttribute("url","/board/list.do");
			
		
		} else {
		
			model.addAttribute("msg", "답글작성실패"); 
			model.addAttribute("url","/board/reply.do?no="+boardSeq);
	
		
		} 
		return "common/message"; 
	}
	
}




