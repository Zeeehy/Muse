package com.muse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MusicalDetailController {

	@RequestMapping("/musicalDetail.do")
	public String musicalDetail() {
		return "musicalDetail/musicalDetail";
	}
	
}
