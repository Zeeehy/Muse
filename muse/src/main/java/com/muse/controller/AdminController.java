package com.muse.controller;

import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.muse.admin.model.AdminDAO;
import com.muse.admin.model.AdminDTO;
import com.muse.admin.model.BannerDTO;
import com.muse.admin.model.MemberStatsDTO;
import com.muse.admin.model.MusicalDTO;
import com.muse.admin.model.OpenNoticeDTO;
import com.muse.admin.model.PartnerDTO;
import com.muse.admin.model.RequestListDTO;
import com.muse.admin.model.ServiceRequestDTO;
import com.muse.admin.model.StatsDTO;
import com.muse.rank.model.RankDTO;
import com.muse.review.model.MusicalReviewDTO;

@Controller
public class AdminController {


	@Autowired
	private AdminDAO adminDao;
	
	/*
	@RequestMapping("/adminIndex.do")
	public ModelAndView adminIndex() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/index");
		return mav;
	}
	*/
	
	@RequestMapping("/adminLogin.do")
	public ModelAndView goAdminLogin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/adminLogin");
		return mav;
	}
	
	
	@RequestMapping(value = "/adminLogin.do", method = RequestMethod.POST)
	public ModelAndView adminLogin(@RequestParam("a_id") String a_id, @RequestParam("a_pwd") String a_pwd,HttpSession session
			,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		int result = adminDao.goAdminLogin(a_id,a_pwd);
		
		if(result==1) {
			mav.addObject("msg","관리자님 환영합니다.");
			mav.addObject("goUrl","adminMain.do");
			mav.setViewName("admin/adminMsg");
			
			session.setAttribute("s_aid", a_id);
		}
		else {
			mav.addObject("msg","아이디 또는 비밀번호가 틀렸습니다.");
			mav.addObject("goUrl","adminLogin.do");
			mav.setViewName("admin/adminMsg");
		}
		
		return mav;
	}
	
	
	@RequestMapping("/adminLogout")
	public ModelAndView requiredLogin_adminLogout(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		session.invalidate();  // 세션 무효화
		mav.addObject("msg","관리자 로그아웃 완료");
		mav.addObject("goUrl","index.do");
		mav.setViewName("admin/adminMsg");
		
		return mav;
	}
	
	
	@RequestMapping("adminMain.do")
	public ModelAndView requiredLogin_adminMain(HttpSession session,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		List<RankDTO> rankWeekly = adminDao.getWeekRank();
		
		int ticketCount = adminDao.getTodayTicket();
		int ticketPrice = adminDao.getTodayPrice();
		int insertCount = adminDao.getInsertCount();
		int openCount = adminDao.getOpenCount();
		int openApply = adminDao.getOpenApply();
		int insertApply = adminDao.getInsertApply();
		
		mav.addObject("lists", rankWeekly);
		mav.addObject("cnt", ticketCount);
		mav.addObject("insertCnt", insertCount);
		mav.addObject("openCnt", openCount);
		mav.addObject("openApply", openApply);
		mav.addObject("insertApply", insertApply);
		mav.addObject("price", NumberFormat.getInstance().format(ticketPrice));
		mav.addObject("ticketPrice", ticketPrice);
		mav.setViewName("/admin/adminMain");
		return mav;
	}
	
	
	
	
	/*공연등록 승인 시작*/
	//오픈공지 리스트
	@RequestMapping("addRequestList.do")
	public ModelAndView requiredLogin_addRequestList(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		
		List<ServiceRequestDTO> lists = adminDao.addRequestList(0);
		
		mav.addObject("lists",lists);
		mav.setViewName("/admin/addRequestList");
		return mav;
	}
	
	@RequestMapping("addRequest.do")
	public ModelAndView requiredLogin_addRequest(@RequestParam("sr_code") String sr_code,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		MusicalDTO dto = adminDao.addRequest(sr_code);
		mav.addObject("dto",dto);
		
		
		mav.addObject("dto");
		mav.setViewName("/admin/addRequest");
		return mav;
	}
	
	@RequestMapping("addRequestEnd.do")
	public ModelAndView requiredLogin_addRequestEnd(@RequestParam("sr_code") String sr_code , @RequestParam("rs_code") int rs_code,HttpSession session
			,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		int result = adminDao.addRequestEnd(sr_code, rs_code);
		
		if(result==1) {
			mav.addObject("goUrl","addRequestList.do");
			
			mav.setViewName("/admin/adminMsg");
			
			if(rs_code==1) {
				mav.addObject("msg", "공연 등록 승인 완료!");
			}else {
				mav.addObject("msg", "공연 등록 거절 완료!");
			}
			
		}
		
		return mav;
	}
	/*공연등록 승인 끝*/
	
	
	
	
	
	/*오픈공지 승인 시작*/
	//오픈공지 리스트
	@RequestMapping("openRequestList.do")
	public ModelAndView requiredLogin_openRequestList(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		
		List<OpenNoticeDTO> lists = adminDao.openRequestList();
		
		mav.addObject("lists",lists);
		mav.setViewName("/admin/openRequestList");
		return mav;
	}
	
	//오픈공지 상세
	@RequestMapping("openRequest.do")
	public ModelAndView requiredLogin_openRequest(@RequestParam("on_code") String on_code,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		OpenNoticeDTO dto = adminDao.openRequest(on_code);
		mav.addObject("dto",dto);
		mav.setViewName("/admin/openRequest");
		return mav;
	}
	
	//오픈공지 승인, 거절
	@RequestMapping("openRequestEnd.do")
	public ModelAndView requiredLogin_openRequestEnd(@RequestParam("rs_code") int rs_code,
			@RequestParam("on_code") String on_code,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		int result = adminDao.openRequestEnd(on_code,rs_code);
		
		if(result>=1){
			mav.setViewName("/admin/adminMsg");
			
			if(rs_code==2) {
				mav.addObject("msg", "오픈공지 거절 완료");
			}
			else {
				//여기에 이제 뷰사이트도 변경해야함.
				
				mav.addObject("msg", "오픈공지 승인 완료");
			}
			mav.addObject("goUrl", "openRequestList.do");
			
		}
	
		return mav;
	}
	
	/*오픈공지 승인 끝*/
	
	


	
	
	
	/*공연등록 반영 시작*/
	//공연등록 반영 리스트
	@RequestMapping("addApplyList.do")
	public ModelAndView requiredLogin_addApplyList(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		List<ServiceRequestDTO> lists = adminDao.addApplyList();
		
		mav.addObject("lists",lists);
		
		
		mav.setViewName("/admin/addApplyList");
		return mav;
	}
	
	//공연등록 반영 홈페이지
	//공연등록 상세
	@RequestMapping("addApply.do")
	public ModelAndView requiredLogin_addApply(@RequestParam("sr_code") String sr_code,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		MusicalDTO dto = adminDao.addApply(sr_code);
		mav.addObject("dto",dto);
		mav.setViewName("/admin/addApply");
		return mav;
	}
	
	//공연등록 반영
	@RequestMapping("addApplyEnd.do")
	public ModelAndView requiredLogin_addApplyEnd(@RequestParam("m_code") String m_code,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		int result = adminDao.addApplyEnd(m_code);
		
		if(result>=1){
			mav.setViewName("/admin/adminMsg");
		
			mav.addObject("msg", "공연등록 반영 완료!");
			
			mav.addObject("goUrl", "addApplyList.do");
			
		}
	
		return mav;
	}
	
	
	/*공연등록 반영 끝*/
	
	
	
	
	
	
	/*오픈공지 반영 시작*/
	//오픈공지 반영 리스트
	@RequestMapping("openApplyList.do")
	public ModelAndView requiredLogin_openApplyList(HttpServletRequest request,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		List<OpenNoticeDTO> lists = adminDao.openApplyList();
		
		mav.addObject("lists",lists);
		
		
		mav.setViewName("/admin/openApplyList");
		return mav;
	}
	
	//오픈공지 반영 홈페이지
	//오픈공지 상세
	@RequestMapping("openApply.do")
	public ModelAndView requiredLogin_openApply(@RequestParam("on_code") String on_code,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		OpenNoticeDTO dto = adminDao.openApply(on_code);
		mav.addObject("dto",dto);
		mav.setViewName("/admin/openApply");
		return mav;
	}
	
	//오픈공지 반영
	@RequestMapping("openApplyEnd.do")
	public ModelAndView requiredLogin_openApplyEnd(@RequestParam("on_code") String on_code,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		int result = adminDao.openApplyEnd(on_code);
		
		if(result>=1){
			mav.setViewName("/admin/adminMsg");
		
			mav.addObject("msg", "오픈공지 반영 완료!");
			
			mav.addObject("goUrl", "openApplyList.do");
			
		}
	
		return mav;
	}
	
	
	/*오픈공지 반영 끝*/
	
	
	
	
	
	
	
	
	/*배너 등록 삭제 시작*/
	//배너 리스트 가져오기
	@RequestMapping("/bannerList.do")
	public ModelAndView requiredLogin_bannerList(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/bannerList");
		
		//기존 배너 있으면 들고오기
		List<BannerDTO> lists = adminDao.bannerList();
		mav.addObject("lists",lists);
		
		
		return mav;
	}
	
	//추가할 배너리스트 가져오기
	@RequestMapping("/addBannerList.do")
	public ModelAndView requiredLogin_addBannerList(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/addBannerList");
		
		//배너추가는 viewstate 확인
		List<BannerDTO> lists = adminDao.addBannerList();
		mav.addObject("lists",lists);
		
		return mav;
	}
	
	//배너 추가하기
	@RequestMapping("/addBanner.do")
	public ModelAndView requiredLogin_addBanner(@RequestParam("m_code") String m_code,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		//banner테이블에 추가하기
		int result = adminDao.addBanner(m_code);
		
		if(result>=1){
			mav.setViewName("/admin/adminPopup");
			mav.addObject("msg", "배너 추가 완료!");
		}
		return mav;
	}
	
	
	
	//배너삭제
	@RequestMapping("/deleteBanner.do")
	public ModelAndView requiredLogin_deleteBanner(@RequestParam("m_code") String m_code,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		//배너삭제
		int result = adminDao.deleteBanner(m_code);
		
		if(result>=1){
			mav.setViewName("/admin/adminMsg");
			mav.addObject("msg", "배너 삭제 완료");
			mav.addObject("goUrl", "bannerList.do");
		}
		
		return mav;
	}
	/*배너 등록 삭제 끝*/
	
	
	
	
	
	
	/* 불량리뷰관리 시작 */
	//리뷰리스트
	@RequestMapping("/adminReviewList.do")
	public ModelAndView requiredLogin_adminReviewList(HttpSession session,HttpServletRequest request
			,@RequestParam(value="cp", defaultValue="1")int cp) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/adminReviewList");
		
		int totalCnt=adminDao.getTotalCnt();
		int listsize=10; //  페이지에 리뷰
		int pagesize=5; // 이게 페이지의 페이징한
		
		String pagingStr=com.muse.admin.model.Paging.makePage("adminReviewList.do", totalCnt, listsize, pagesize, cp);

		
		List<MusicalReviewDTO> lists = adminDao.adminReviewList(cp, listsize);
		mav.addObject("lists",lists);
		mav.addObject("pagingStr",pagingStr);
		return mav;
	}
	

	
	
	
	
	
	//삭제, 상태 바꾸기
	@RequestMapping("adminDeleteReview.do")
	public ModelAndView  requiredLogin_adminDeleteReview(@RequestParam("mr_code") String mr_code,@RequestParam("mr_state") int mr_state,
			HttpSession session,HttpServletRequest request) {
		ModelAndView mav =new ModelAndView();
		
		
		int result = adminDao.adminDeleteReview(mr_code,mr_state);
		
		if(result ==1) {
			mav.setViewName("/admin/adminMsg");
			mav.addObject("goUrl","adminReviewList.do");
			mav.addObject("msg","해당 리뷰 차단 완료!");
		}else {
			mav.setViewName("/admin/adminMsg");
			mav.addObject("goUrl","adminReviewList.do");
			mav.addObject("msg","해당 리뷰 차단 실패!");
		}
		
		
		
		mav.addObject("goUrl", "adminReviewList.do");
		
		return mav;
	}
	
	
	// 불량리뷰 검색
	@RequestMapping("/adminSearchReviewList.do")
	public ModelAndView requiredLogin_adminSearchReviewList(HttpSession session,HttpServletRequest request,
			@RequestParam(value = "search_word", defaultValue = "") String search_word	) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/adminSearchReviewList");
		
		
		List<MusicalReviewDTO> lists = adminDao.adminSearchReviewList(search_word);
		mav.addObject("lists",lists);
		mav.addObject("search_word",search_word);
		return mav;
	}

	
	/* 불량리뷰관리 끝 */
	
	
	
	
	
	
	
	/* 파트너 리뷰관리 시작 */
	@RequestMapping("pReviewList.do")
	public ModelAndView requiredLogin_pReviewList(HttpSession session,HttpServletRequest request) {
		ModelAndView mav =new ModelAndView();
		
		List<RequestListDTO> lists = adminDao.pReviewList();
		mav.addObject("lists",lists);
		
		mav.setViewName("/admin/pReviewList");
		return mav;
	}
	
	
	//거절이면 bdr만 삭제
	@RequestMapping("pReview.do")
	public ModelAndView requiredLogin_pReview(@RequestParam("bdr_code") String bdr_code,
			@RequestParam("bdr_state") int bdr_state,HttpSession session,HttpServletRequest request) {
		ModelAndView mav =new ModelAndView();
		
		int result;
		
		//삭제
		if(bdr_state==1) {
			result = adminDao.pReview(bdr_code,1);
			
			//하고 리뷰 삭제하기
			int result1 = adminDao.pReviewDelete(bdr_code);
			
			if(result ==1 && result1==1) {
				mav.setViewName("/admin/adminMsg");
				mav.addObject("goUrl","pReviewList.do");
				mav.addObject("msg","해당 리뷰 삭제 완료!");
			}
		}
		//거절
		else {
			result = adminDao.pReview(bdr_code,2);
			
			if(result ==1 ) {
				mav.setViewName("/admin/adminMsg");
				mav.addObject("goUrl","pReviewList.do");
				mav.addObject("msg","해당 리뷰 삭제 요청 거절!");
			}
		}
		
		
		return mav;
	}
	/* 파트너 리뷰관리 끝 */
	
	
	
	/* 파트너 Qna관리 시작 삭제*/
	/*
	 * @RequestMapping("pQnAList.do") public ModelAndView pQnAList() { ModelAndView
	 * mav =new ModelAndView();
	 * 
	 * mav.setViewName("/admin/pQnAList"); return mav; }
	 */
	/* 파트너 Qna관리 시작 */
	
	
	
	/*제작사회원 리스트 시작*/
	//제작사회원 리스트 가져오기
	@RequestMapping("/partnerRequestList.do")
	public ModelAndView requiredLogin_partnerRequestList(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/partnerRequestList");
		
		//기존 배너 있으면 들고오기
		List<PartnerDTO> lists = adminDao.partnerRequestList();
		mav.addObject("lists",lists);
		
		
		return mav;
	}
	
	//제작사회원 상세
	@RequestMapping("/partnerRequest.do")
	public ModelAndView requiredLogin_partnerRequest(@RequestParam("pr_code") String pr_code,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		//기존 배너 있으면 들고오기
		PartnerDTO dto = adminDao.partnerRequest(pr_code);
		mav.addObject("dto",dto);
		
		mav.setViewName("/admin/partnerRequest");
		return mav;
	}
	
	
	//제작사회원 상태값 바꾸기
	@RequestMapping("/partnerRequestEnd.do")
	public ModelAndView requiredLogin_partnerRequestEnd(@RequestParam("rs_code") int rs_code,
											@RequestParam("pr_code") String pr_code,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		int result = adminDao.partnerRequestEnd(rs_code,pr_code);
		if(rs_code==1){
			
			mav.addObject("msg", "파트너 요청 승인");
			mav.setViewName("/admin/adminMsg");
			mav.addObject("goUrl", "partnerRequestList.do");
			
		}
		else if(rs_code==2) {
			mav.addObject("msg", "파트너 요청 거부");
			mav.setViewName("/admin/adminMsg");
			mav.addObject("goUrl", "partnerRequestList.do");
		}
		
		
		return mav;
	}
	
	/*제작사회원 리스트 끝*/
	
	
	
	/* 통계 시작*/
	// 회원 뮤즈패스 비율
	@RequestMapping("/musePassStats.do")
	public ModelAndView requiredLogin_musePassStats(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/musePassStats");
		
		HashMap<String,BigDecimal> map = adminDao.musePassStats();
		
		BigDecimal nopass = map.get("nopass");
		BigDecimal mpass = map.get("mpass");

		// 퍼센트 계산
		double nopassper = Math.round((nopass.doubleValue() / (nopass.doubleValue() + mpass.doubleValue())) * 1000) / 10.0;
		double mpassper = Math.round((mpass.doubleValue() / (nopass.doubleValue() + mpass.doubleValue())) * 1000) / 10.0;

		
		mav.addObject("nopassper", nopassper);
		mav.addObject("mpassper", mpassper);
		
		
		return mav;
	}
	
	//회원 증가량
	@RequestMapping("/memberStats.do")
	public ModelAndView requiredLogin_memberStats(HttpSession session,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		List<MemberStatsDTO> lists = adminDao.memberStats();
/*		
		for (MemberStatsDTO memberStats : lists) {
		    // MemberStatsDTO에서 필요한 값들 가져오기
		    String joinMonth = memberStats.getJoinMonth();  // 예: '2024-01'
		    Integer total = memberStats.getMemberTotal();        // 예: 회원 수
		    Integer museTotal = memberStats.getMuseTotal();       // 예: 회원 수

		    // 출력
		    System.out.println("가입월: " + joinMonth + ", 누적회원수: " + total+" , 뮤즈: "+museTotal);
		}
*/		
		
		
		mav.addObject("lists",lists);
		mav.setViewName("admin/memberStats");
		return mav;
	}
	
	// 파트너 통계
	@RequestMapping("/partnerStats.do")
	public ModelAndView requiredLogin_partnerStats(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		List<StatsDTO> lists = adminDao.partnerStats();
		
		
		mav.addObject("lists",lists);
		mav.setViewName("admin/partnerStats");
		return mav;
	}
	
	
	// 공연 랭킹
	@RequestMapping("/rankingStats.do")
	public ModelAndView requiredLogin_rankingStats(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		List<StatsDTO> lists = adminDao.rankingStats();
		
		
		mav.addObject("lists",lists);
		mav.setViewName("admin/rankingStats");
		return mav;
	}
	
	@RequestMapping("/rankingStatsTime.do")
	@ResponseBody
	public Map<String, Object> rankingStatsTime(@RequestParam String page) {
	    
		
		List<StatsDTO> lists  =null; 

		if(page.equals("oneday")) {
			lists = adminDao.rankingStatsTime(1);
		}else if(page.equals("oneweek")) {
			lists = adminDao.rankingStatsTime(7);
		}else if(page.equals("onemonth")) {
			lists = adminDao.rankingStatsTime(30);
		}else if(page.equals("all")) {
			lists = adminDao.rankingStats();
		}else {
			
		}
	    
	    // JSON 응답을 위한 Map 설정
	    Map<String, Object> response = new HashMap<>();
	    response.put("lists", lists);
	    
	    return response; // 반환되는 객체는 자동으로 JSON 형태로 변환됨
	}
	
	
	/* 통계 끝 */
	
}
