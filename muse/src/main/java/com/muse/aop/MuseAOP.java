package com.muse.aop;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.web.servlet.ModelAndView;

public class MuseAOP {
	//사용자도 모르는 사이에 YongAOP 가 실행되어야함.
	
	
	//ProceedingJoinPoint 얘가 있으면 Advice(공통관심사)로 인정
	//여기도 결과적으로 핵심기능을 호출해야함. 하지만 어떤걸 호출해야하는지 모르지만
	//ProceedingJoinPoint여기에 들어가있음
	public Object loginCheck(ProceedingJoinPoint jp) {
		
		HttpServletRequest request = null;
		
		for(Object temp:jp.getArgs()) {
			
			if(temp instanceof HttpServletRequest) {
				request=(HttpServletRequest)temp;
			}
			
		}
		//HttpServletRequest request = (HttpServletRequest) jp.getArgs()[0];
		
        //HttpServletRequest request = null;
       // HttpServletResponse response = null;
        HttpSession session=request.getSession();
		Object result=null;
		ModelAndView mav=null;
		
		
		 if (session.getAttribute("s_aid") == null) {
			 
			 
			 mav=new ModelAndView();
			 mav.setViewName("admin/adminMsg");
			 mav.addObject("msg", "관리자 로그인이 필요합니다!");
			 mav.addObject("goUrl", "adminLogin.do");
			 result=mav;
		 }else {
		 
			try {
				result=jp.proceed();
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
		
		return result;

	}
}
