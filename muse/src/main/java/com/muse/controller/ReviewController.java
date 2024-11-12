package com.muse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.muse.review.model.MusicalReviewDTO;
import com.muse.review.model.ReviewDAO;
import com.muse.review.model.SeatReviewDTO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewDAO reviewDao;
	
	@RequestMapping("/srIndex.do")
	public String index() {
		return "/review/srIndex";
	}
	
	@RequestMapping("/srsearchresult.do")
	public ModelAndView srsearchresult(@RequestParam(value = "searchTag") String searchTag,
			@RequestParam(value = "searchWord") String searchWord) {
		ModelAndView mav= new ModelAndView();
		
		List<SeatReviewDTO> list = reviewDao.srSearchResult(searchTag,searchWord);
		
		mav.addObject("list", list);
		mav.addObject("searchTag", searchTag);
		mav.addObject("searchWord", searchWord);
		mav.setViewName("review/srSearchResult");
		return mav;
	}
	
	@RequestMapping("/srShow.do")
	public ModelAndView srShow(@RequestParam(value = "mh_code") String mh_code,
								@RequestParam(value = "m_code", required = false) String m_code	) {
		ModelAndView mav = new ModelAndView();
		
		// 공연장검색이면 그냥 공연명 null로
	    if (m_code == null) {
	        m_code = ""; 
	    }
		
		
		mav.setViewName("review/srShow");
		mav.addObject("", mav);
		return mav;
	}
	
	
	// --------------------- 좌석리뷰 작성 시작----------------------//
	@RequestMapping("/srWrite.do")
	public ModelAndView srWrite(@RequestParam(value = "bd_code", required = false) String bd_code, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		//로그인 한 사람의 아이디와 예매한 아이디가 같은지.
		String s_id = (String) session.getAttribute("s_id");
		
		
		//b_code 없으면 메인으로 보내기
		if(bd_code==null || bd_code.length()==0) {
			mav.setViewName("/review/reviewMsg");
			mav.addObject("goUrl", "index.do");
			mav.addObject("msg", "잘못된 경로입니다.");
		}
		else {
			String w_id = reviewDao.getWriterIdByBdCode(bd_code);
			
			// 로그인한 아이디와 예매아이디가 같으면 
			if(w_id.equals(s_id)) {
				mav.setViewName("/review/srWrite");
				
				//공연정보 가져오기
				SeatReviewDTO dto = reviewDao.srWrite(bd_code);
				String sr_seat = dto.getS_floor()+"층 "+dto.getS_section()+"구역 "+dto.getS_row()+"열 "+dto.getS_position()+"번";
				dto.setSr_seat(sr_seat);
				mav.addObject("dto", dto);
				
			}else {
				//로그인한 아이디와 해당 공연 예매한 사람이 다르면 팝업으로 돌려보내기
				mav.setViewName("/review/reviewMsg");
				mav.addObject("goUrl", "index.do");
				mav.addObject("msg", "공연을 예매한 회원이 아닙니다.");
			}
			
		}
		
		return mav;
	}
	
	
	@Transactional
	@RequestMapping("/srWriteEnd.do")
	public ModelAndView srWriteEnd(@RequestParam(value = "sr_content") String sr_content,
			@RequestParam(value = "sr_score") double sr_score,
			@RequestParam(value = "bd_code") String bd_code,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		SeatReviewDTO dto = new SeatReviewDTO();
		dto.setSr_content(sr_content);
		dto.setSr_score(sr_score);
		dto.setBd_code(bd_code);
		
		int result = reviewDao.srWriteEnd(dto);
		int mr_code = reviewDao.getSr_code();
		
		
		//회원이면 600, 일반회원은 300
		String s_id = (String) session.getAttribute("s_id");
		
		if(result>=1) {
			int s_mpass = (int) session.getAttribute("s_mpass");
			
			int result1;
			
			//멤버쉽가입ok
			if(s_mpass==1) {
				result1 = reviewDao.addPoint(s_id,"sr_"+mr_code,600);
				mav.addObject("msg", "리뷰작성 완료! (멤버십회원 포인트 600점 적립)");
			}else {
				result1 = reviewDao.addPoint(s_id,"sr_"+mr_code,300);
				mav.addObject("msg", "리뷰작성 완료! (일반회원 포인트 300점 적립)");

			}
			
			mav.setViewName("review/reviewMsg");
			mav.addObject("goUrl", "index.do");
			
		}
		else {
			
		}
		
		
		
		return mav;
	}
	
	// --------------------- 좌석리뷰 작성 끝----------------------//
	
	
	
	
	// --------------------- 공연리뷰 작성 시작----------------------//
	
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
			
			// 로그인한 아이디와 예매아이디가 같으면 
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
			
		}
		
		return mav;
	}
	
	
	
	
	//리뷰 등록시 뮤즈패스 가입여부를 기준으로 포인트주기
	@Transactional
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
		int mr_code = reviewDao.getMr_code();
		
		//회원이면 600, 일반회원은 300
		String s_id = (String) session.getAttribute("s_id");
		
		if(result>=1) {
			int s_mpass = (int) session.getAttribute("s_mpass");
			
			int result1;
			
			//멤버쉽가입ok
			if(s_mpass==1) {
				result1 = reviewDao.addPoint(s_id,"mr_"+mr_code,600);
				mav.addObject("msg", "리뷰작성 완료! (멤버십회원 포인트 600점 적립)");
			}else {
				result1 = reviewDao.addPoint(s_id,"mr_"+mr_code,300);
				mav.addObject("msg", "리뷰작성 완료! (일반회원 포인트 300점 적립)");

			}
			
			mav.setViewName("review/reviewMsg");
			mav.addObject("goUrl", "index.do");
			
		}
		else {
			
		}
		
		
		return mav;
	}
	// --------------------- 공연리뷰 작성 끝 ----------------------//
}
