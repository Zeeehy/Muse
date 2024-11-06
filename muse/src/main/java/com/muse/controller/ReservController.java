package com.muse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservController {
	
	@RequestMapping("/reservMain.do")
	public String RerservMainForm() {
		return "reservation/reservMain";
	}
}
