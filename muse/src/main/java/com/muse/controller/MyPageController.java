package com.muse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.muse.myPage.model.MuseCalendarDAO;
import com.muse.myPage.model.MuseCalendarDTO;
import com.muse.myPage.model.MyPageUserDAO;
import com.muse.myPage.model.MyPageUserDTO;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageUserDAO myPageUserDao;
	
	@Autowired
	private MuseCalendarDAO museCalendarDao;
	
	/**마이페이지 메인*/
	@RequestMapping("/myPageMain.do")
	public String myPageMainForm() {
		return "/myPage/myPageMain";
	}
	
	/**마이페이지 회원정보수정*/
	@RequestMapping("/myPageInfoUpdate.do")
	public ModelAndView myPageInfoUpdateForm() {
		ModelAndView mav=new ModelAndView();
		
		MyPageUserDTO dto = myPageUserDao.getUserInfo("test");
		
		mav.addObject("user", dto);
		mav.setViewName("/myPage/myPageInfoUpdate");
		return mav;
	}
	
	@RequestMapping(value = "/myPageInfoUpdate.do", method=RequestMethod.POST)
	public ModelAndView myPageInfoUpdate(MyPageUserDTO dto) {
		ModelAndView mav=new ModelAndView();
		
		int result=myPageUserDao.updateUserInfo(dto);
		String msg=result>0?"회원정보수정 성공":"회원정보수정 실패";
		System.out.println(msg);
		mav.setViewName("/myPage/myPageMain");
		return mav;
	}
	
	/**마이페이지 비밀번호수정*/
	@RequestMapping("/myPagePwdUpdate.do")
	public String myPagePwdUpdateForm() {

		return "/myPage/myPagePwdUpdate";
	}
	
	@RequestMapping(value = "/myPagePwdUpdate.do", method=RequestMethod.POST)
	public ModelAndView myPagePwdUpdate(MyPageUserDTO dto) {
		ModelAndView mav=new ModelAndView();
		
		int result=myPageUserDao.updateUserPwd(dto);
		String msg=result>0?"비밀번호수정 성공":"비밀번호수정 실패";
		System.out.println(msg);
		mav.setViewName("/myPage/myPageMain");
		return mav;
	}
	
	/**마이페이지 뮤즈캘린더*/
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
