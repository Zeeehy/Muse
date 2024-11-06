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
	
	//ModelAndView�� request�� �����
	@RequestMapping("/hello.do") //��ɾ ���� �����ϴ� �޼ҵ�. �� hello.do�� �ҷ����� ����
	public ModelAndView hello() {
		
		String result="spring MVC Framework!";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", result);
		mav.setViewName("/hello");
		//view ������ ����
		
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
	
	
	//��� ����Ʈ ��������
	@RequestMapping("/bannerList.do")
	public ModelAndView bannerList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/bannerList");
		
		//���� ��� ������ ������
		List<BannerDTO> lists = adminDao.bannerList();
		mav.addObject("lists",lists);
		
		
		return mav;
	}
	
	//�߰��� ��ʸ���Ʈ ��������
	@RequestMapping("/addBannerList.do")
	public ModelAndView addBannerList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/addBannerList");
		
		//����߰��� viewstate Ȯ��
		List<BannerDTO> lists = adminDao.addBannerList();
		mav.addObject("lists",lists);
		
		return mav;
	}
	
	//��� �߰��ϱ�
	@RequestMapping("/addBanner.do")
	public ModelAndView addBanner(@RequestParam("m_code") String m_code) {
		ModelAndView mav = new ModelAndView();
		
		//banner���̺� �߰��ϱ�
		int result = adminDao.addBanner(m_code);
		
		if(result>=1){
			mav.setViewName("/admin/adminPopup");
			mav.addObject("msg", "��� �߰� �Ϸ�!");
		}
		return mav;
	}
	
	
	
	//��ʻ���
	@RequestMapping("/deleteBanner.do")
	public ModelAndView deleteBanner(@RequestParam("m_code") String m_code) {
		ModelAndView mav = new ModelAndView();
		
		//��ʻ���
		int result = adminDao.deleteBanner(m_code);
		
		if(result>=1){
			mav.setViewName("/admin/adminMsg");
			mav.addObject("msg", "��� ���� �Ϸ�");
			mav.addObject("goUrl", "bannerList.do");
		}
		
		return mav;
	}
}





