package com.muse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OpenNoticeController {

	
	@RequestMapping("/openNotice.do")
	public ModelAndView openNoticeMain() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("openNotice/openNoticeList");
		
		return mav;
	}
}
