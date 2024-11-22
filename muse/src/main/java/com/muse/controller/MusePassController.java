package com.muse.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.muse.member.model.MemberDAO;
import com.muse.musePass.model.MusePassDAO;

@Controller
public class MusePassController {
	
	@Autowired
	MemberDAO mdao;
	
	@Autowired
	MusePassDAO mpdao;
	
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
	
	@RequestMapping("/musePassPayCheck.do")
	public ModelAndView musePassPayCheckForm(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		String u_id = (String) session.getAttribute("s_id");
		paramMap.put("u_id",u_id);
		
		mpdao.insertMusePass(paramMap);
		mpdao.updateMusePassOn(u_id);
		
		session.setAttribute("s_mpass",1);
		
		mav.setViewName("musePass/musePassPayCheck");
		
		return mav;
	}
	
	
}
