package com.muse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping("/myPageMain.do")
	public String myPageMainForm() {
		return "/myPage/myPageMain";
	}
	
	@RequestMapping("/myPageUserUpdate.do")
	public String myPageUserUpdateForm() {
		return "/myPage/myPageUserUpdate";
	}
}
