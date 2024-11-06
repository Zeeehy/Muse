package com.muse.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.muse.member.model.MemberDAO;
import com.muse.member.model.MemberDTO;

@Controller
public class MemberController {
	
	@Autowired
	MemberDAO memberDao;
	
	// GET 요청 처리: 로그인 폼을 반환
    @RequestMapping(value = "/memberLogin.do", method = RequestMethod.GET)
    public String memberLoginForm() {
        return "/member/memberLogin";
    }

    // POST 요청 처리: 로그인 처리 로직
    @RequestMapping(value = "/memberLogin.do", method = RequestMethod.POST)
    public ModelAndView memberLogin(@RequestParam("u_id") String u_id, 
    												 @RequestParam("u_pwd") String u_pwd,
    												 HttpSession session) {
        
    	ModelAndView mav = new ModelAndView();
        // System.out.println("로그인 컨트롤러 시작");
        // 로그인 체크
        int loginResult = memberDao.loginCheck(u_id, u_pwd);
        
        // 로그인 결과에 따라 처리
        if(loginResult==1 || loginResult==2) {
			mav.addObject("goUrl", "login.do");
			mav.addObject("msg", "아이디 또는 비밀번호가 잘못되었습니다.");
			mav.setViewName("member/memberMsg");
		} else if(loginResult==3) {
			MemberDTO s_info=memberDao.getUserInfo(u_id);		
			session.setAttribute("s_id", u_id);
			session.setAttribute("s_name", s_info.getU_name());			
			session.setAttribute("s_mpass", s_info.getU_mpass());
			
			// 세션에서 값 가져오기
		    String s_id = (String) session.getAttribute("s_id");
		    String s_name = (String) session.getAttribute("s_name");
		    int s_mpass =  (int) session.getAttribute("s_mpass");
		    
		    // 세션 값 확인을 위한 로그 출력
		    System.out.println("세션에 저장된 ID: " + s_id);
		    System.out.println("세션에 저장된 이름: " + s_name);
		    System.out.println("세션에 저장된 멤버십여부: " + s_mpass);
		
			mav.addObject("goUrl", "index.do");
			mav.addObject("msg", s_info.getU_name()+"님 환영합니다.");
			mav.setViewName("member/memberMsg");
		
		}
		return mav;
    }
    
    
    // 로그아웃 처리
    @RequestMapping(value = "/memberLogout.do")
    public String memberLogoutForm(HttpSession session) {
        // 세션 무효화: 세션에 저장된 모든 데이터를 삭제
        session.invalidate();  // 세션 무효화
 
        // 로그아웃 후, 홈 화면으로 리디렉션
        // 브라우저가 서버에 새롭게 요청을 보내, 클라이언트의 세션이나 쿠키 등이 갱신해야함 
        return "redirect:/index.do";  // 로그아웃 후 index 페이지로 리디렉션
    }
    
}
