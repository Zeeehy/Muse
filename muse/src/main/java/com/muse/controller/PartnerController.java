package com.muse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.muse.partner.model.ActorDTO;
import com.muse.partner.model.MusicalDTO;
import com.muse.partner.model.MusicalHallDTO;
import com.muse.partner.model.MusicalOptionDTO;
import com.muse.partner.model.PartnerDAO;

@Controller
public class PartnerController {

	
	@Autowired
	private PartnerDAO partnerDao;
	
	@RequestMapping("/partnerAddForm.do")
	public String partnerAddForm() {
		
		return "/partner/partnerAddForm";
	}
	
	@RequestMapping("/castAddForm.do")
	public String castAddForm() {
		
		return "/partner/castAddForm";
	}
	@RequestMapping("/ticetOpenForm.do")
	public String ticetOpenForm() {
		return"/partner/ticetOpenNotice";
	}
	@RequestMapping("/musicalOpenForm.do")
	public ModelAndView musicalAddForm() {
		
		ModelAndView mav = new ModelAndView();
		List<MusicalHallDTO> list = partnerDao.getMusicalHallList();
		mav.setViewName("/partner/musicalAddForm");
		mav.addObject("HallList", list);
		return mav;
	}
	
	@RequestMapping(value = "/seachActor.do", method = RequestMethod.GET)
	public ModelAndView seachActorPopup(@RequestParam String ma_name) {
		ModelAndView mav = new ModelAndView();
	    List<ActorDTO> list = partnerDao.SeachActorList(ma_name);
	    	mav.addObject("list",list);
		    mav.setViewName("parkJson");
	    
	    return mav;
	}
	
	@RequestMapping("/getMusicalList.do")
	public ModelAndView getMusicalList(@RequestParam String mh_code, 
			@RequestParam(defaultValue="")String seachMusical) {
			List<MusicalDTO> list = partnerDao.SeachMusicalList(mh_code, seachMusical);
			ModelAndView mav = new ModelAndView();
			
	    	mav.addObject("list",list);
		    mav.setViewName("parkJson");
		    return mav;
	}
	
	@RequestMapping("/MusicalDateSelect.do")
	public ModelAndView getDateSelect(@RequestParam String m_code) {
			MusicalDTO dto = partnerDao.getMusicalDateSelect(m_code);
			//List<MusicalOptionDTO> list = partnerDao.getMusicalDateSelcetOption(m_code);
			ModelAndView mav = new ModelAndView();
			mav.addObject("Datedto",dto);
			//mav.addObject("Datelist",list);
			mav.setViewName("parkJson");
		    return mav;
	}
	
	@RequestMapping("/dateList.do")
	public ModelAndView getDateSelectList(@RequestParam String m_code) {
		ModelAndView mav = new ModelAndView();
		List<MusicalOptionDTO> list = partnerDao.getMusicalDateSelcetOption(m_code);
		mav.addObject("Datelist",list);
		mav.setViewName("parkJson");
	    return mav;
	}
	
	@RequestMapping("/insertMusicalDateList.do")
	public ModelAndView insertMusicalDate(@RequestParam String m_code,
			@RequestParam String mo_date,
			@RequestParam String mo_time) {
		int result = partnerDao.insertMusicalDate(m_code, mo_date, mo_time);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("/partner/castAddForm");
	    return mav;
	}
	
	@RequestMapping("/searchTime1.do")
	public ModelAndView seachTime(String m_code, String mo_date ){
		ModelAndView mav = new ModelAndView();
		List<MusicalOptionDTO> list = partnerDao.getMusicalTimeSelcetOption(m_code, mo_date);
		mav.addObject("Timelist",list);
		System.out.println(list.size()+"################");
	    mav.setViewName("parkJson");
	    return mav;
	}
	//나중에 메인 생기면 반환값 int로 바꾸기
	@RequestMapping("/insertCast.do")
	public ModelAndView insertCast(String ma_code,String mc_char,String m_code,String mo_date, String mo_time) {
		int result = partnerDao.insertCasting(ma_code, mc_char, m_code, mo_date, mo_time);
		System.out.println(result+"@@@@@@@@@@@@@@@@@@@@@@@@");
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("parkJson");
	    return mav;
	}
	
	@RequestMapping("/insertOpenNotice.do")
	public ModelAndView insertOpenNotice(
	        @RequestParam("m_code") String m_code,
	        @RequestParam("rs_code") String rs_code,
	        @RequestParam("on_type") String on_type,
	        @RequestParam("on_openDate") String on_openDate,
	        @RequestParam("on_openTime") String on_openTime,
	        @RequestParam(value = "on_muse_openDate", required = false) String on_muse_openDate,
	        @RequestParam(value = "on_muse_openTime", required = false) String on_muse_openTime,
	        @RequestParam("on_info") String on_info,
	        @RequestParam("on_sale") String on_sale,
	        @RequestParam("on_content") String on_content,
	        @RequestParam("on_casting") String on_casting,
	        @RequestParam("on_etc") String on_etc) {

	    // 전달된 값들을 출력 (디버깅 용도)
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	    System.out.println("뮤지컬 코드 (m_code): " + m_code);
	    System.out.println("요청 상태 (rs_code): " + rs_code);
	    System.out.println("티켓 타입 (on_type): " + on_type);
	    System.out.println("티켓 오픈 시간 (on_openDate): " + on_openDate);
	    System.out.println("티켓 오픈 시간 (on_openTime): " + on_openTime);
	    System.out.println("뮤즈 패스 오픈 시간 (on_muse_open): " + on_muse_openDate);
	    System.out.println("뮤즈 패스 오픈 시간 (on_muse_openTime): " + on_muse_openTime);
	    System.out.println("공연 정보 (on_info): " + on_info);
	    System.out.println("할인 정보 (on_sale): " + on_sale);
	    System.out.println("공연 소개 (on_content): " + on_content);
	    System.out.println("캐스팅 (on_casting): " + on_casting);
	    System.out.println("기타 전달사항 (on_etc): " + on_etc);
	    
	    
	    
	    String open = on_openDate+" "+ on_openTime;
	    String museOpen = on_muse_openDate+" " +on_muse_openTime;
	    
	    int result = partnerDao.insertTicketNotice(m_code, rs_code, on_type, open, museOpen, on_info, on_sale, on_content, on_casting, on_etc);
	    System.out.println(result+"@@@@@@@@@@@@@@@@@@@@@@");
	    // ModelAndView 객체 생성 후 반환
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/partner/castAddForm");
	    return mav;
	}
	
	
}