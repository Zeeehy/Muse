package com.muse.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.muse.main.model.BestReviewDTO;
import com.muse.main.model.MainDAO;
import com.muse.main.model.MusicalActorDTO;
import com.muse.main.model.MusicalDTO;
import com.muse.main.model.MusicalHallDTO;
import com.muse.main.model.TicketOpenDTO;


@Controller
public class MainController {
	
	@Autowired
	MainDAO mainDao;
	
	// 메인 화면 로딩
	@RequestMapping("/index.do")
	public ModelAndView main(@RequestParam(defaultValue = "1") int page) {
		
		int size = 10;
		ModelAndView mav = new ModelAndView();
				
		List<MusicalDTO> main_banner = mainDao.main_banner();
		List<TicketOpenDTO> main_ticketopen = mainDao.main_ticketopen();
		List<BestReviewDTO> main_bestreview = mainDao.main_bestreview();
		List<MusicalDTO> main_musicallist = mainDao.main_musicallist(page, size);

		// Model에 데이터를 담기
	    mav.addObject("main_banner", main_banner);
	    mav.addObject("main_ticketopen", main_ticketopen);
	    mav.addObject("main_bestreview", main_bestreview);
	    mav.addObject("main_musicallist", main_musicallist);
	    mav.addObject("currentPage", page);  // 현재 페이지 정보 추가
		
	    // 뷰  (index.jsp)
	    mav.setViewName("index");  
	    
		return mav;
	}
	
	
	// 추가 뮤지컬 데이터를 로드 (전체보기 버튼 클릭 시)
	@RequestMapping("/loadMoreMusicals.do")
	@ResponseBody
	public Map<String, Object> loadMoreMusicals(@RequestParam int page) {
	    int size = 10;
	    
	    // 추가 데이터를 가져옴
	    List<MusicalDTO> main_musicallist = mainDao.main_musicallist(page, size);

	    // JSON 응답을 위한 Map 설정
	    Map<String, Object> response = new HashMap<>();
	    response.put("main_musicallist", main_musicallist);
	    
	    return response; // 반환되는 객체는 자동으로 JSON 형태로 변환됨
	}
    
	
	// 뮤즈패스 페이지로 이동
	@RequestMapping("/musepass.do")
	public String musepass() {
		return "/musepass";
	}
	
	// 검색 결과 페이지로 이동
	@RequestMapping("/mainSearch.do")
	public ModelAndView searchResult(@RequestParam("searchWord") String searchWord) {
	    ModelAndView mav = new ModelAndView();

	    List<MusicalActorDTO> search_musical_actor = mainDao.search_ma(searchWord);        
	    List<MusicalHallDTO> search_musical_hall = mainDao.search_mh(searchWord);        
	    List<MusicalDTO> search_musical = mainDao.search_m(searchWord);
	    int count = mainDao.search_m_count(searchWord);
	  
	    // 결과 리스트가 null일 경우 빈 리스트로 초기화
	    if (search_musical_actor == null) search_musical_actor = new ArrayList<>();
	    if (search_musical_hall == null) search_musical_hall = new ArrayList<>();
	    if (search_musical == null) search_musical = new ArrayList<>();
	    
	    // 결과를 ModelAndView에 추가
	    mav.addObject("search_mh", search_musical_hall);
	    mav.addObject("search_ma", search_musical_actor);
	    mav.addObject("search_m", search_musical);
	    mav.addObject("count", count);

	    // 뷰 이름 설정
	    mav.setViewName("search/searchResult"); 
	    return mav;
	}

	
}
