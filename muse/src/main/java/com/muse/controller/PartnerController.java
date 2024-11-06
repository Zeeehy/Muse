package com.muse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PartnerController {

	@RequestMapping("/partnerAddForm.do")
	public String partnerAddForm() {
		
		return "/partner/partnerAddForm";
	}
	
	@RequestMapping("/castAddForm.do")
	public String castAddForm() {
		
		return "/partner/castAddForm";
	}
	
}
