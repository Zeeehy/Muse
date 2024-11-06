package com.muse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {

	//@Autowired
	//private AdminDAO adminDao;
	
	@RequestMapping("/srIndex.do")
	public String index() {
		return "/review/srIndex";
	}
}
