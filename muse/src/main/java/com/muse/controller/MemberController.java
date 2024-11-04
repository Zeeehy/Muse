package com.muse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("/memberLogin.do")
	   public String memberLoginForm() {
	      
	      return "/member/memberLogin";
	   }
	
}
