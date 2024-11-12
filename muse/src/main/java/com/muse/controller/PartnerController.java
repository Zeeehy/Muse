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
	
	@RequestMapping("/insertCast.do")
	public ModelAndView insertCast(String ma_code,String mc_char,String m_code,String mo_date, String mo_time) {
		int result = partnerDao.insertCasting(ma_code, mc_char, m_code, mo_date, mo_time);
		System.out.println(result+"@@@@@@@@@@@@@@@@@@@@@@@@");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/partner/castAddForm");
	    return mav;
	}
	
	
}