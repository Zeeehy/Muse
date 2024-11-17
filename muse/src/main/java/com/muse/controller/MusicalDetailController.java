package com.muse.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.muse.admin.model.PartnerDTO;
import com.muse.musicalDetail.model.MusicalDetailCastDTO;
import com.muse.musicalDetail.model.MusicalDetailDAO;
import com.muse.musicalDetail.model.MusicalDetailDTO;
import com.muse.partner.model.MusicalHallDTO;
import com.muse.reserv.model.ReservDAO;
import com.muse.review.model.MusicalReviewDTO;


@Controller
public class MusicalDetailController {
	
	@Autowired
	private MusicalDetailDAO musicalDetaildao;
	
	@Autowired
	private ReservDAO reservDAO;
	
	private static final String[] DAY_NAMES = {
	        "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"
	    };

	@RequestMapping("/musicalDetail.do")
	public ModelAndView musicalDetail(@RequestParam String m_code,HttpSession session) {
		
		
		ModelAndView mav = new ModelAndView();
		
		String s_id = (String) session.getAttribute("s_id")==null?"0":(String) session.getAttribute("s_id");
		
		MusicalDetailDTO mddto = musicalDetaildao.getMusicalBasicInfo(m_code);
		
		int checkLikeMusical = musicalDetaildao.checkLikeMusical(m_code,s_id );
		
		int countLike = musicalDetaildao.countLikeMusical(m_code);
		
		List<MusicalDetailCastDTO> castings = musicalDetaildao.getCastingWithLike(m_code, s_id);
		
		List<Date> screenDays = musicalDetaildao.getScreenDay(m_code);
		List<String> dow_screen =getSortedDayOfWeeks(screenDays, false);
		
		List<String> startTimes = musicalDetaildao.getStartTime(m_code);
		
		List<String> allChar = musicalDetaildao.getAllChar(m_code);
				
		Map paramMap = new HashMap<String,String>();
		paramMap.put("m_code", m_code);
		paramMap.put("u_id", s_id);
		List<MusicalDetailCastDTO> actorByRound = musicalDetaildao.getRoundActor(paramMap);
		List<Date> getRoundDOW = musicalDetaildao.getRoundDOW(paramMap); 
		
		List<String> dows = getDayOfWeeks(getRoundDOW);
		
		for(int i=0; i<dows.size(); i++) {
			actorByRound.get(i).setDow(dows.get(i));
		}
		
		int countReview = musicalDetaildao.countMusicalReview(m_code);
		double reviewAVG = musicalDetaildao.getMusicalReviewAVG(m_code);
		
		List<MusicalReviewDTO> reviews = musicalDetaildao.getMusicalReviews(paramMap);
		
		PartnerDTO pdto = musicalDetaildao.getPartnerInfoByMusical(m_code);
		
		MusicalHallDTO mhdto = musicalDetaildao.getMusicalHallInfo(m_code);
		
		List priceList = reservDAO.getMusicalPrice(m_code);
		
		mav.addObject("mddto",mddto);
		mav.addObject("checkLikeMusical",checkLikeMusical);
		mav.addObject("countLike",countLike);
		mav.addObject("castings",castings);
		mav.addObject("dow_screen",dow_screen);
		mav.addObject("startTimes",startTimes);
		mav.addObject("actorByRound",actorByRound);
		mav.addObject("allChar",allChar);
		mav.addObject("countReview",countReview);
		mav.addObject("reviewAVG",reviewAVG);
		mav.addObject("reviews",reviews);
		mav.addObject("pdto",pdto);
		mav.addObject("mhdto",mhdto);
		mav.addObject("priceList",priceList);
		
		mav.setViewName("musicalDetail/musicalDetail");
		
		
		return mav;
	}
	

	public List<String> getUniqueDayOfWeeks(List<Date> screenDays) {
        // LinkedHashSet을 사용하여 중복 제거와 입력 순서 유지
        Set<String> uniqueDays = new LinkedHashSet<>();
        
        for (Date sqlDate : screenDays) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(sqlDate);
            
            // Calendar.DAY_OF_WEEK는 일요일이 1부터 시작하므로 1을 빼줍니다
            int dayIndex = calendar.get(Calendar.DAY_OF_WEEK) - 1;
            uniqueDays.add(DAY_NAMES[dayIndex]);
        }
        
        return new ArrayList<>(uniqueDays);
    }
	
	public List<String> getDayOfWeeks(List<Date> screenDays) {
	    List<String> days = new ArrayList<>();
	    
	    for (Date sqlDate : screenDays) {
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(sqlDate);
	        
	        // Calendar.DAY_OF_WEEK는 일요일이 1부터 시작하므로 1을 빼줍니다
	        int dayIndex = calendar.get(Calendar.DAY_OF_WEEK) - 1;
	        days.add(DAY_NAMES[dayIndex]);
	    }
	    
	    return days;
	}
	
	public List<String> getSortedDayOfWeeks(List<Date> screenDays, boolean startWithSunday) {
        List<String> days = getUniqueDayOfWeeks(screenDays);
        
        // 요일 정렬을 위한 비교자
        Comparator<String> comparator = (day1, day2) -> {
            int index1 = Arrays.asList(DAY_NAMES).indexOf(day1);
            int index2 = Arrays.asList(DAY_NAMES).indexOf(day2);
            
            if (!startWithSunday) {
                // 월요일부터 정렬하는 경우 인덱스 조정
                index1 = (index1 + 6) % 7;
                index2 = (index2 + 6) % 7;
            }
            
            return Integer.compare(index1, index2);
        };
        
        Collections.sort(days, comparator);
        return days;
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
	
	@RequestMapping("/changeLikeActor.do")
	public ModelAndView changeLikeActor(@RequestParam String ma_code, @RequestParam String is_liked, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String u_id = (String)session.getAttribute("s_id");
		
		System.out.println(ma_code);
		System.out.println(u_id);
		System.out.println(is_liked);
		// 0일 때 1로 옴
		// 미등록일때 1로 옴
		if(is_liked.equals("N")) {
			System.out.println("등록분기");

			musicalDetaildao.insertLikeActor(ma_code, u_id);
		} else {
			System.out.println("삭제분기");
			musicalDetaildao.deleteLikeActor(ma_code, u_id);
		}
		
		
		mav.setViewName("parkJson");
		
		return mav;
	}
	
	@RequestMapping("/changeLikeReview.do")
	public ModelAndView changeLikeReview( @RequestParam String mr_code, @RequestParam String checkLike,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String u_id = (String)session.getAttribute("s_id");
		
		System.out.println(mr_code);
		System.out.println(u_id);
		System.out.println(checkLike);
		// 0일 때 1로 옴
		// 미등록일때 1로 옴
		
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("u_id", u_id);
		paramMap.put("mr_code", mr_code);
		if(checkLike.equals("N")) {
			System.out.println("등록분기");

			musicalDetaildao.insertLikeMusicalReview(paramMap);
		} else {
			System.out.println("삭제분기");
			musicalDetaildao.deleteLikeMusicalReview(paramMap);
		}
		
		int result = musicalDetaildao.countLikeMusicalReview(mr_code);
		
		mav.addObject("result",result);
		
		mav.setViewName("parkJson");
		
		return mav;
	}
	
	
	@RequestMapping("/getCastingByRange.do")
	@ResponseBody  // JSON 응답을 위해 추가
	public Map<String, Object> getCastingByRange(@RequestParam String range_start, 
	                                           @RequestParam String range_end, 
	                                           @RequestParam String m_code) {
	    Map<String, Object> result = new HashMap<>();
	    
	    try {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        java.sql.Date startDate = new java.sql.Date(dateFormat.parse(range_start).getTime());
	        java.sql.Date endDate = new java.sql.Date(dateFormat.parse(range_end).getTime());
	        
	        
	        Map<String, Object> paramMap = new HashMap<>();
	        paramMap.put("range_start", startDate);
	        paramMap.put("range_end", endDate);
	        paramMap.put("m_code", m_code);
	        

	        // 캐스팅 정보 조회
	        List<MusicalDetailCastDTO> actorByRound = musicalDetaildao.getRoundActor(paramMap);

	        List<Date> getRoundDOW = musicalDetaildao.getRoundDOW(paramMap); 

	        // 요일 정보 설정
	        List<String> dows = getDayOfWeeks(getRoundDOW);
	        
	        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");

	        for(int i=0; i<dows.size(); i++) {
	            actorByRound.get(i).setDow(dows.get(i));
	            
	            Date currentDate = actorByRound.get(i).getMo_date();
	            java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
	            
	            actorByRound.get(i).setMo_date(sqlDate);
	        }
	        
	        // 역할 목록 조회 (추가 필요)
	        List<String> allChar = musicalDetaildao.getAllChar(m_code); // 이 메서드는 구현 필요
	        
	        // 결과 맵에 데이터 추가
	        result.put("actorByRound", actorByRound);
	        result.put("allChar", allChar);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        result.put("error", "데이터 조회 중 오류가 발생했습니다.");
	    }
	    
	    return result;
	}
	
	@RequestMapping("/getRounds.do")
	@ResponseBody  // JSON 응답을 위해 추가
	public List<String> getRounds(@RequestParam String m_code, 
	                                           @RequestParam String mo_date) {
		Map<String, Object> paramMap = new HashMap<>();

	    paramMap.put("mo_date", mo_date);
	    paramMap.put("m_code", m_code);
	    System.out.println(mo_date);
	    System.out.println(m_code);
        List<String> getRound = musicalDetaildao.getRound(paramMap);
	    
	    return getRound;
	}
	
	
	@RequestMapping("/getSelectedMusicalOption.do")
	@ResponseBody  // JSON 응답을 위해 추가
	public Map<String, Object> getSelectedMusicalOption(@RequestParam String m_code, 
	                                           @RequestParam String mo_date,
	                                           @RequestParam String mo_time) {
		Map<String, Object> paramMap = new HashMap<>();

	    paramMap.put("mo_date", mo_date);
	    paramMap.put("mo_time", mo_time);
	    paramMap.put("m_code", m_code);
	    

		List<String> getActors = musicalDetaildao.getSelectedRoundActors(paramMap);
		System.out.println("gsmo");
		System.out.println(getActors.size());
		
		 Map<String, Object> params = new HashMap<>();
	     params.put("selectedDate", mo_date);
	     params.put("selectedTime", mo_time);
	     params.put("m_code", m_code);
	    
	     Map<String,Integer> getRemainseats = reservDAO.getRemainingSeat(params);
	     System.out.println(reservDAO.getRemainingSeat(params).size());
	     
	     Map<String, Object> result = new HashMap<>();
	     result.put("actors", getActors);
	     result.put("seats", getRemainseats);
	    
	    return result;
	}
	
	
	
	
}
