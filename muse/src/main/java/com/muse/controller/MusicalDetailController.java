package com.muse.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.muse.musicalDetail.model.MusicalDetailDAO;
import com.muse.musicalDetail.model.MusicalDetailDTO;


@Controller
public class MusicalDetailController {
	
	@Autowired
	private MusicalDetailDAO musicalDetaildao;


	@RequestMapping("/musicalDetail.do")
	public ModelAndView musicalDetail(@RequestParam String m_code,HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		String s_id = (String) session.getAttribute("s_id")==null?"0":(String) session.getAttribute("s_id");
		
		MusicalDetailDTO mddto = musicalDetaildao.getMusicalBasicInfo(m_code);
		
		int checkLikeMusical = musicalDetaildao.checkLikeMusical(m_code,s_id );
		
		int countLike = musicalDetaildao.countLikeMusical(m_code);
		
		mav.addObject("mddto",mddto);
		mav.addObject("checkLikeMusical",checkLikeMusical);
		mav.addObject("countLike",countLike);
		mav.setViewName("musicalDetail/musicalDetail");
		
		return mav;
	}
	
	@RequestMapping("/changeLikeMusical.do")
	public ModelAndView changeLikeMusical(@RequestParam String m_code, @RequestParam int checkLikeMusical, HttpSession session) {
		System.out.println("changeLike분기");
		ModelAndView mav = new ModelAndView();
		
		String u_id = (String)session.getAttribute("s_id");
		
		System.out.println(m_code);
		System.out.println(u_id);
		
		// 0일 때 1로 옴
		// 미등록일때 1로 옴
		if(checkLikeMusical==1) {
			System.out.println("등록분기");

			musicalDetaildao.insertLikeMusical(m_code, u_id);
		} else {
			System.out.println("삭제분기");
			musicalDetaildao.deleteLikeMusical(m_code, u_id);
		}
		
		int countLike = musicalDetaildao.countLikeMusical(m_code);
		mav.addObject("countLike",countLike);
		
		mav.setViewName("parkJson");
		
		return mav;
	}
	
	
	
}
