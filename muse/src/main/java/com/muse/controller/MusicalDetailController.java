package com.muse.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.muse.musicalDetail.model.MusicalDetailCastDTO;
import com.muse.musicalDetail.model.MusicalDetailDAO;
import com.muse.musicalDetail.model.MusicalDetailDTO;


@Controller
public class MusicalDetailController {
	
	@Autowired
	private MusicalDetailDAO musicalDetaildao;
	
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
		List<MusicalDetailCastDTO> actorByRound = musicalDetaildao.getRoundActor(paramMap);

		
		
		mav.addObject("mddto",mddto);
		mav.addObject("checkLikeMusical",checkLikeMusical);
		mav.addObject("countLike",countLike);
		mav.addObject("castings",castings);
		mav.addObject("dow_screen",dow_screen);
		mav.addObject("startTimes",startTimes);
		mav.addObject("actorByRound",actorByRound);
		mav.addObject("allChar",allChar);
		mav.setViewName("musicalDetail/musicalDetail");
		
		
		return mav;
	}
	

	public List<String> getDayOfWeeks(List<Date> screenDays) {
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
	
	public List<String> getSortedDayOfWeeks(List<Date> screenDays, boolean startWithSunday) {
        List<String> days = getDayOfWeeks(screenDays);
        
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
	
	@RequestMapping("/getCastingByRange.do")
	public ModelAndView getCastingByRange(@RequestParam String range_start, @RequestParam String range_end, @RequestParam String m_code) {
		
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 전달받는 날짜 형식에 맞게 수정하세요 (예: "yyyy-MM-dd")

	    try {
	        Date startDate = (Date) dateFormat.parse(range_start);
	        Date endDate = (Date) dateFormat.parse(range_end);
	        Map<String, Object> paramMap = new HashMap<String, Object>();
			
			paramMap.put("range_start", startDate);
			paramMap.put("range_end", endDate);
			paramMap.put("m_code", m_code);
			
			List<MusicalDetailCastDTO> actorByRound = musicalDetaildao.getRoundActor(paramMap);
			
			for(MusicalDetailCastDTO dto: actorByRound) {
				
				System.out.println(dto.toString());
			}
			

	    } catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
		mav.setViewName("parkJson");
		return mav;

	}
	
	
}
