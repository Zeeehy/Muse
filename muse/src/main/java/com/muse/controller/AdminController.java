package com.muse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.muse.admin.model.AdminDAO;
import com.muse.admin.model.AdminDTO;

@Controller
public class AdminController {

	@Autowired
	private AdminDAO adminDao;
	
	@RequestMapping("/index.do")
	public String index() {
		return "/index";
	}
	
	//ModelAndView는 request와 비슷함
	@RequestMapping("/hello.do") //명령어에 의해 진입하는 메소드. 즉 hello.do가 불러지면 실행
	public ModelAndView hello() {
		
		String result="spring MVC Framework!";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", result);
		mav.setViewName("/hello");
		//view 페이지 저장
		
		AdminDTO dto = adminDao.practice();
		mav.addObject("dto",dto);
		
		return mav;
	}
}
