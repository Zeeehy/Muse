package com.muse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservController {
	
	@RequestMapping("/reservMain.do")
	public String RerservMainForm() {
		return "reservation/reservMain";
	}
	
	@RequestMapping("/reservSale.do")
	public String ReservSaleForm() {
		return "reservation/reservSale";
	}
	
	@RequestMapping("/reservCheck.do")
	public String ReservCheckForm() {
		return "reservation/reservCheck";
	}
	
	@RequestMapping("/reservCancle.do")
	public String ReservCancleForm() {
		return "reservation/reservCancle";
	}
	
	@RequestMapping("/reservSuccess.do")
	public String ReservSuccesForm() {
		return "reservation/reservSuccess";
	}
}
