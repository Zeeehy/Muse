package com.muse.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.muse.review.model.MusicalReviewDTO;
import com.muse.review.model.ReviewDAO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewDAO reviewDao;
	
	@RequestMapping("/srIndex.do")
	public String index() {
		return "/review/srIndex";
	}
	
	@RequestMapping("/mrWrite.do")
	public ModelAndView mrWrite(@RequestParam(value = "b_code", required = false) String b_code, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		//로그인 한 사람의 아이디와 예매한 아이디가 같은지.
		String s_id = (String) session.getAttribute("s_id");
		
		
		//b_code 없으면 메인으로 보내기
		if(b_code==null || b_code.length()==0) {
			mav.setViewName("/review/reviewMsg");
			mav.addObject("goUrl", "index.do");
			mav.addObject("msg", "잘못된 경로입니다.");
		}
		else {
			String w_id = reviewDao.getWriterId(b_code);
			
			//공연정보 가져오기
			MusicalReviewDTO dto = reviewDao.mrWrite(b_code);
			mav.addObject("dto", dto);
			mav.setViewName("/review/mrWrite");
		}
		
		
		/*// 로그인되면 해보기
		if(w_id.equals(s_id)) {
			mav.setViewName("/review/mrWrite");
			
			//공연정보 가져오기
			MusicalReviewDTO dto = reviewDao.mrWrite(b_code);
			mav.addObject("dto", dto);
			
		}else {
			//로그인한 아이디와 해당 공연 예매한 사람이 다르면 팝업으로 돌려보내기
			mav.setViewName("/review/reviewMsg");
			mav.addObject("goUrl", "index.do");
			mav.addObject("msg", "공연을 예매한 회원이 아닙니다.");
		}
		*/
		
		return mav;
	}
	
	//리뷰 등록시 뮤즈패스 가입여부를 기준으로 포인트주기
	@RequestMapping("/mrWriteEnd.do")
	public ModelAndView mrWriteEnd(@RequestParam(value = "mr_title") String mr_title,
			@RequestParam(value = "mr_score") double mr_score,
			@RequestParam(value = "mr_content") String mr_content,
			@RequestParam(value = "b_code") String b_code,HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		MusicalReviewDTO dto = new MusicalReviewDTO();
		dto.setMr_title(mr_title);
		dto.setMr_score(mr_score);
		dto.setMr_content(mr_content);
		dto.setB_code(b_code);
		
		//리뷰작성
		int result = reviewDao.mrWriteEnd(dto);
		
		
		//회원이면 600, 일반회원은 300
		String s_id = (String) session.getAttribute("s_id");
		//int result1 = reviewDao.mrWritePoint(s_id);
		
		
		if(result>=1) {
			mav.setViewName("review/reviewMsg");
			mav.addObject("goUrl", "index.do");
			mav.addObject("msg", "리뷰작성 완료!");
		}
		else {
		}
		
		return mav;
	}
	
}
