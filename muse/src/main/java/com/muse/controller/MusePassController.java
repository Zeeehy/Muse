package com.muse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.muse.member.model.MemberDAO;

@Controller
public class MusePassController {
	
	@Autowired
	MemberDAO mdao;
	
	@RequestMapping("/musePassTermForm.do")
	public ModelAndView musePassTermForm() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("musePass/musePassTerm");
		return mav;
	}
	
	@RequestMapping("/musePassPayment.do")
	public ModelAndView musePassPaymentForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("musePass/musePassPayment");
		
		return mav;
	}
	
	@RequestMapping("/musePassPayOut.do")
	public ModelAndView musePassPayment() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("musePass/musePassPayOut");
		
		return mav;
	}
	
}
