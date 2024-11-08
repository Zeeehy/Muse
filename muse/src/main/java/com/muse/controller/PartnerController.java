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
}
