package com.muse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.muse.myPage.model.MuseCalendarDAO;
import com.muse.myPage.model.MuseCalendarDTO;

@Controller
public class MyPageController {
	
	@Autowired
	private MuseCalendarDAO museCalendarDao;
	
	@RequestMapping("/myPageMain.do")
	public String myPageMainForm() {
		return "/myPage/myPageMain";
	}
	
	@RequestMapping("/myPageUserUpdate.do")
	public String myPageUserUpdateForm() {
		return "/myPage/myPageUserUpdate";
	}
	
	@RequestMapping(value = "/myPageMuseCalendar.do", method = RequestMethod.GET)
	public ModelAndView myPageMuseCalendarForm() {
		ModelAndView mav=new ModelAndView();
		List<MuseCalendarDTO> calendar = museCalendarDao.getCalendar();
		if (calendar == null) {
	        System.out.println("calendarList is null");
	    }
		mav.addObject("calendarList", calendar);
		
		for(int i=0; i<calendar.size(); i++) {
			System.out.println(calendar.get(i));
		}
		
		mav.setViewName("/myPage/myPageMuseCalendar");
		return mav;
	}

}
