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
	
	//ModelAndView�� request�� �����
	@RequestMapping("/hello.do") //��ɾ ���� �����ϴ� �޼ҵ�. �� hello.do�� �ҷ����� ����
	public ModelAndView hello() {
		
		String result="spring MVC Framework!";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", result);
		mav.setViewName("/hello");
		//view ������ ����
		
		AdminDTO dto = adminDao.practice();
		mav.addObject("dto",dto);
		
		return mav;
	}
}
