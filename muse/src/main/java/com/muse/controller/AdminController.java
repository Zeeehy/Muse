package com.muse.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.muse.admin.model.AdminDAO;
import com.muse.admin.model.AdminDTO;
import com.muse.admin.model.BannerDTO;

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
		
		return mav;
	}
	
	
	@RequestMapping("/adminIndex.do")
	public ModelAndView adminIndex() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/index");
		return mav;
	}
	
	
	@RequestMapping("/adminLogin.do")
	public ModelAndView goAdminLogin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/login");
		return mav;
	}
	
	
	//배너 리스트 가져오기
	@RequestMapping("/bannerList.do")
	public ModelAndView bannerList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/bannerList");
		
		//기존 배너 있으면 들고오기
		List<BannerDTO> lists = adminDao.bannerList();
		mav.addObject("lists",lists);
		
		
		return mav;
	}
	
	//추가할 배너리스트 가져오기
	@RequestMapping("/addBannerList.do")
	public ModelAndView addBannerList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/addBannerList");
		
		//배너추가는 viewstate 확인
		List<BannerDTO> lists = adminDao.addBannerList();
		mav.addObject("lists",lists);
		
		return mav;
	}
	
	//배너 추가하기
	@RequestMapping("/addBanner.do")
	public ModelAndView addBanner(@RequestParam("m_code") String m_code) {
		ModelAndView mav = new ModelAndView();
		
		//banner테이블에 추가하기
		int result = adminDao.addBanner(m_code);
		
		if(result>=1){
			mav.setViewName("/admin/adminPopup");
			mav.addObject("msg", "배너 추가 완료!");
		}
		return mav;
	}
	
	
	
	//배너삭제
	@RequestMapping("/deleteBanner.do")
	public ModelAndView deleteBanner(@RequestParam("m_code") String m_code) {
		ModelAndView mav = new ModelAndView();
		
		//배너삭제
		int result = adminDao.deleteBanner(m_code);
		
		if(result>=1){
			mav.setViewName("/admin/adminMsg");
			mav.addObject("msg", "배너 삭제 완료");
			mav.addObject("goUrl", "bannerList.do");
		}
		
		return mav;
	}
}





