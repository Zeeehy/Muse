package com.muse.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.muse.rank.model.RankDAO;
import com.muse.rank.model.RankDTO;


@Controller
public class RankController {
	
	@Autowired
	RankDAO rankDao;
	
	// 랭킹 페이지 처음 로딩
	@RequestMapping("/rank.do")
	public ModelAndView rankList() {
				
		ModelAndView mav = new ModelAndView();
		List<RankDTO> rank_daily = rankDao.getdailyRankList();
		mav.addObject("d_rank", rank_daily);
	    mav.setViewName("rank/rank");  
	    
		return mav;
	}
	
	// 에이작스 처리 - 일간
	@RequestMapping("/rankDaily.do")
	@ResponseBody
	public Map<String, Object> rankDailyList() {
	    List<RankDTO> rankDaily = rankDao.getdailyRankList();  // 일간 랭킹을 가져오는 DAO 호출
	    // JSON 응답을 위한 Map 설정
	    Map<String, Object> response = new HashMap<>();
	    response.put("daily", rankDaily);	    
	    return response;  // JSON 형식으로 반환
	}

	// 에이작스 처리 - 주간 
	@RequestMapping("/rankWeekly.do")
	@ResponseBody
	public Map<String, Object> rankWeeklyList() {
	    List<RankDTO> rankWeekly = rankDao.getweeklyRankList();  // 주간 랭킹을 가져오는 DAO 호출
	    // System.out.println("rankWeekly: " + rankWeekly);
	    // JSON 응답을 위한 Map 설정
	    Map<String, Object> response = new HashMap<>();	    
	    response.put("weekly", rankWeekly);	 
	    return response;  // JSON 형식으로 반환
	}

	// 에이작스 처리 - 월간 
	@RequestMapping("/rankMonthly.do")
	@ResponseBody
	public Map<String, Object> rankMonthlyList() {
	    List<RankDTO> rankMonthly = rankDao.getmonthlyRankList();  // 월간 랭킹을 가져오는 DAO 호출
	    // JSON 응답을 위한 Map 설정
	    Map<String, Object> response = new HashMap<>();	    
	    response.put("monthly", rankMonthly);	 
	    return response;  // JSON 형식으로 반환
	}

}
