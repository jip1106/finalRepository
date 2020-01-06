package com.ezen.jobsearch.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	private Logger logger=
		LoggerFactory.getLogger(ResumeController.class);
	
	@RequestMapping("/resume.do")
	public String resume_get() {
		logger.info("화면보여주기");
		
		return "resume/resume";
	}

}
