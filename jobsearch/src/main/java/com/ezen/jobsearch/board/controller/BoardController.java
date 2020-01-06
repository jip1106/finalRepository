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
import com.ezen.jobsearch.common.*;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger
	=LoggerFactory.getLogger(BoardController.class); 

	@Autowired
	private BoardService reBoardService;

	@RequestMapping("/list.do")
	public String list(@ModelAttribute SearchVO searchVo, 
				Model model) {
		
		//1
		//logger.info("湲� 紐⑸�?, �뙆�씪誘명�? searchVo={}",searchVo);
		
		//[1] ?��?���? PaginationInfo媛앹껜瑜�? �깮�꽦�븯�뿬 firstRecordIndex 媛�?�쓣 ?��?�븳�떎
		/*
		 * PaginationInfo pagingInfo=new PaginationInfo();
		 * pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		 * pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		 * pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		 */
		
		//[2] searchVo�뿉 recordCountPerPage�� firstRecordIndex?���? ��?��?���븳�떎
		/*
		 * searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		 * searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		 */
		
		//logger.info("媛� ��?��?�� �썑 searchVo={}", searchVo);
		
		//2
		List<BoardVO> list=reBoardService.selectAll(searchVo);
		logger.info(list.toString());
		logger.info("湲�紐⑸�? 寃곌?��, list.size={}", list.size());
		
		//[3] �젅?��붾뱶 媛쒖?�� 議고?���썑 ��?��?��
		/*
		 * int totalRecord=reBoardService.selectTotalRecord(searchVo);
		 * logger.info("totalRecord={}", totalRecord);
		 * 
		 * pagingInfo.setTotalRecord(totalRecord);
		 */
		
		//3
		model.addAttribute("list", list);
		/* model.addAttribute("pagingInfo", pagingInfo); */
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write_get() {
		

		return "board/boardWrite";
	}
	
	@RequestMapping(value="/write.do", method = RequestMethod.POST)
	public String write_post(@ModelAttribute BoardVO BoardVo, 
			HttpServletRequest request, Model model) {
		//1
		logger.info("湲��벑濡�, �뙆�씪誘명꽣 vo={}",BoardVo);
		
		//2
		String msg="", url="";
		int cnt=reBoardService.insertReBoard(BoardVo);
		logger.info("湲��벑濡� 寃곌낵, cnt={}", cnt);

		if(cnt>0) {
			msg="湲��벑濡앸릺�뿀�뒿�땲�떎.";
			url="/board/list.do";
		}else {
			msg="湲��벑濡� �떎�뙣!";
			url="/board/write.do";
		}

		//3		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	
	
}




