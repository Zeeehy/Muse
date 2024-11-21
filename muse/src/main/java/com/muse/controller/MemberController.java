package com.muse.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.muse.common.MailSendService;
import com.muse.member.model.MemberDAO;
import com.muse.member.model.MemberDTO;

@Controller
public class MemberController {
	
	@Autowired
	MemberDAO memberDao;
	@Autowired
	private MailSendService mailSender;
	
	
	
	// GET 요청 처리: 로그인 폼을 반환
    @RequestMapping(value = "/memberLogin.do", method = RequestMethod.GET)
    public String memberLoginForm(HttpServletRequest request, HttpSession session) {
    	 // 로그인 전 사용자가 요청한 URL을 세션에 저장
        String referer = request.getHeader("Referer");  // 이전 페이지 URL을 가져옴
        if (referer != null && !referer.contains("memberLogin.do") && !referer.contains("memberJoin.do")) { // 로그인 페이지나 회원가입 페이지로 오는 URL을 제외
            session.setAttribute("prevPage", referer);  // 세션에 이전 페이지 URL 저장
        }
        return "/member/memberLogin";
    }

    // POST 요청 처리: 로그인 처리 로직
    @RequestMapping(value = "/memberLogin.do", method = RequestMethod.POST)
    public ModelAndView memberLogin(@RequestParam("u_id") String u_id,@RequestParam("u_pwd") String u_pwd,HttpSession session) {
        
    	ModelAndView mav = new ModelAndView();
        // System.out.println("로그인 컨트롤러 시작");
        // 로그인 체크
        int loginResult = memberDao.loginCheck(u_id, u_pwd);
        
        // 로그인 결과에 따라 처리
        if(loginResult==1 || loginResult==2) {
			mav.addObject("goUrl", "memberLogin.do");
			mav.addObject("msg", "아이디 또는 비밀번호가 잘못되었습니다.");
			mav.setViewName("member/memberMsg");
		} else if(loginResult==3) {
			MemberDTO s_info=memberDao.getUserInfo(u_id);		
			session.setAttribute("s_id", u_id);
			session.setAttribute("s_name", s_info.getU_name());			
			session.setAttribute("s_mpass", s_info.getU_mpass());
			session.setAttribute("s_pr_code", s_info.getPr_code());
			session.setAttribute("s_rs_code", s_info.getRs_code());
			// 
			
			// 세션에서 값 가져오기
		    // String s_id = (String) session.getAttribute("s_id");
		    // String s_name = (String) session.getAttribute("s_name");
		    // int s_mpass =  (int) session.getAttribute("s_mpass");		
		    // String s_prcode = (String) session.getAttribute("s_pr_code");
		    // int s_rscode =  (int) session.getAttribute("s_rs_code");		
		    // 세션 값 확인을 위한 로그 출력
		    // System.out.println("세션에 저장된 ID: " + s_id);
		    // System.out.println("세션에 저장된 이름: " + s_name);
		    // System.out.println("세션에 저장된 멤버십여부: " + s_mpass);
		    // System.out.println("세션에 저장된 파트너여부: " + s_prcode);
		    // System.out.println("세션에 저장된 파트너 승인여부: " + s_rscode);
		
			// 로그인 후 이전 페이지로 리디렉션
	        String prevPage = (String) session.getAttribute("prevPage");
	        if (prevPage != null && !prevPage.isEmpty()) {
	        	 mav.addObject("goUrl", prevPage);
	        	 mav.addObject("msg", s_info.getU_name() + "님 환영합니다.");          
	        	 mav.setViewName("member/memberMsg");
	        } else {
	            mav.addObject("goUrl", "index.do");
	            mav.addObject("msg", s_info.getU_name() + "님 환영합니다.");
	            mav.setViewName("member/memberMsg");
	        }
		}
        
		return mav;
    }
    
    
    // 로그아웃 처리
    @RequestMapping(value = "/memberLogout.do")
    public ModelAndView memberLogoutForm(HttpSession session) {
    	
    	ModelAndView mav = new ModelAndView();
        // 세션 무효화: 세션에 저장된 모든 데이터를 삭제
        session.invalidate();  // 세션 무효화
 
        // 로그아웃 후, 홈 화면으로 리디렉션
        // 브라우저가 서버에 새롭게 요청을 보내, 클라이언트의 세션이나 쿠키 등이 갱신해야함 
        mav.addObject("goUrl", "index.do");
		mav.addObject("msg", "로그아웃 되셨습니다.");
		mav.setViewName("member/memberMsg");
        return mav;  // 로그아웃 후 index 페이지로 리디렉션
    
    }
    
    
    // GET 요청 처리: 회원가입 폼을 반환
    @RequestMapping(value = "/memberJoin.do", method = RequestMethod.GET)
    public String memberJoinForm() {
        return "/member/memberJoin";
    }

    
    // POST 요청 처리: 회원가입 처리 로직
    @RequestMapping(value = "/memberJoin.do", method = RequestMethod.POST)
    public ModelAndView memberJoin(@RequestParam("u_id") String u_id,@RequestParam("u_pwd") String u_pwd,
    		@RequestParam("u_name") String u_name,@RequestParam("u_email") String u_email,
    		@RequestParam("u_pnum") String u_pnum,@RequestParam(value = "u_age", defaultValue = "1") int u_age) {
    
    	ModelAndView mav = new ModelAndView();
    	// System.out.println("회원가입 컨트롤러 시작");
    	// DTO 객체 생성
        MemberDTO memberDTO = new MemberDTO(u_id, u_pwd, u_name, u_email, u_pnum, u_age);

        // 회원가입 서비스 메서드 호출
        int isJoinSuccess = memberDao.Join(memberDTO);

        if (isJoinSuccess == 1) {
        	mav.addObject("goUrl", "memberLogin.do");
            mav.addObject("msg", "회원가입을 축하드립니다!");
            mav.setViewName("member/memberMsg");
        } else {
        	mav.addObject("goUrl", "memberJoin.do");
            mav.addObject("msg", "회원가입에 실패하셨습니다.");
            mav.setViewName("member/memberMsg");
        }

        return mav;
    }
      

    // GET 요청 처리: 아이디 중복체크
    @RequestMapping(value = "/checkIdDuplicate.do", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public ResponseEntity<Map<String, Integer>> checkIdDuplicate(@RequestParam("u_id") String u_id) {
        int checkIdResult = memberDao.idCheck(u_id);  // ID 중복 체크

        Map<String, Integer> response = new HashMap<>();
        response.put("exists", checkIdResult);

        // ResponseEntity로 응답 반환 (JSON 형식으로 반환)
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
    
    
    // POST 요청 처리: 비밀번호 중복체크
    @RequestMapping(value = "/checkPwdDuplicate.do", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public ResponseEntity<Map<String, Integer>> checkPwdDuplicate(@RequestBody Map<String, String> requestBody) {
        String u_pwd = requestBody.get("u_pwd");  // 비밀번호를 받아오기

        int checkPwdResult = memberDao.pwdCheck(u_pwd);  // 비밀번호 중복 체크

        Map<String, Integer> response = new HashMap<>();
        response.put("exists", checkPwdResult);

        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    
    // 아이디 비번 찾기 페이지 이동 
    @RequestMapping(value = "/findinfo.do")
    public ModelAndView findinfo() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("member/findIdPwd");
        return mav;
    }
    
    
    // 비밀번호 찾기 - 아이디 확인 
    @RequestMapping(value = "/findPwd_idcheck.do")
    public ModelAndView findPwd_idcheck(@RequestParam("u_id") String u_id,HttpServletRequest request) {
    	String refererUrl = request.getHeader("Referer"); // 이전 페이지 URL 가져오기
        ModelAndView mav = new ModelAndView();
        
        int isFindIdSuccess = memberDao.find_idCheck(u_id);
        if (isFindIdSuccess == 1) {
        	mav.addObject("goUrl", "pwdemail.do");
            mav.addObject("msg", "유효한 아이디입니다!");
            mav.setViewName("member/memberMsg");
        } else {
        	mav.addObject("goUrl",  refererUrl);
            mav.addObject("msg", "아이디가 유효하지 않습니다.");
            mav.setViewName("member/memberMsg");
        }
        return mav;
    }
    
    // 비밀번호 찾기 - 비밀번호 재설정 페이지 이동 
    @RequestMapping(value = "/pwdemail.do")
    public ModelAndView pwdEmailForm() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("member/pwdEmail");
        return mav;
    }  
    

    // 비밀번호 찾기 - 이메일 인증 
    @RequestMapping(value = "/findPwd_emailcheck.do")
    public ModelAndView findPwd_emailcheck() {
        ModelAndView mav = new ModelAndView();
        	
        mailSender.joinIdEmail("wlskrkflfk333@gmail.com");
        
        mav.addObject("goUrl", "pwdReset.do");
        mav.addObject("msg", "인증 되었습니다!");
        mav.setViewName("member/memberMsg");

        return mav;
    }
   
    
    // 비밀번호 찾기 - 비밀번호 재설정 페이지 이동 
    @RequestMapping(value = "/pwdReset.do")
    public ModelAndView pwdResetForm() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("member/pwdReset");
        return mav;
    }  
    
}
