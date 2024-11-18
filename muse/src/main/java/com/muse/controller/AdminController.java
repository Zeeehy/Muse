package com.muse.controller;

import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.muse.admin.model.AdminDAO;
import com.muse.admin.model.AdminDTO;
import com.muse.admin.model.BannerDTO;
import com.muse.admin.model.MusicalDTO;
import com.muse.admin.model.OpenNoticeDTO;
import com.muse.admin.model.PartnerDTO;
import com.muse.admin.model.RequestListDTO;
import com.muse.admin.model.ServiceRequestDTO;
import com.muse.review.model.MusicalReviewDTO;

@Controller
public class AdminController {


	@Autowired
	private AdminDAO adminDao;
	
	
	@RequestMapping("/adminIndex.do")
	public ModelAndView adminIndex() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/index");
		return mav;
	}
	
	
	@RequestMapping("/adminLogin.do")
	public ModelAndView goAdminLogin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/adminLogin");
		return mav;
	}
	
	
	@RequestMapping(value = "/adminLogin.do", method = RequestMethod.POST)
	public ModelAndView adminLogin(@RequestParam("a_id") String a_id, @RequestParam("a_pwd") String a_pwd,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		int result = adminDao.goAdminLogin(a_id,a_pwd);
		
		if(result==1) {
			mav.addObject("msg","관리자님 환영합니다.");
			mav.addObject("goUrl","addRequestList.do");
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
	public ModelAndView adminLogout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		session.invalidate();  // 세션 무효화
		mav.addObject("msg","관리자 로그아웃 완료");
		mav.addObject("goUrl","index.do");
		mav.setViewName("admin/adminMsg");
		
		return mav;
	}
	
	
	/*공연등록 승인 시작*/
	//오픈공지 리스트
	@RequestMapping("addRequestList.do")
	public ModelAndView addRequestList() {
		ModelAndView mav = new ModelAndView();
		
		
		List<ServiceRequestDTO> lists = adminDao.addRequestList(0);
		
		mav.addObject("lists",lists);
		mav.setViewName("/admin/addRequestList");
		return mav;
	}
	
	@RequestMapping("addRequest.do")
	public ModelAndView addRequest(@RequestParam("sr_code") String sr_code) {
		ModelAndView mav = new ModelAndView();
		
		MusicalDTO dto = adminDao.addRequest(sr_code);
		mav.addObject("dto",dto);
		
		
		mav.addObject("dto");
		mav.setViewName("/admin/addRequest");
		return mav;
	}
	
	@RequestMapping("addRequestEnd.do")
	public ModelAndView addRequestEnd(@RequestParam("sr_code") String sr_code , @RequestParam("rs_code") int rs_code) {
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
	public ModelAndView openRequestList() {
		ModelAndView mav = new ModelAndView();
		
		
		List<OpenNoticeDTO> lists = adminDao.openRequestList();
		
		mav.addObject("lists",lists);
		mav.setViewName("/admin/openRequestList");
		return mav;
	}
	
	//오픈공지 상세
	@RequestMapping("openRequest.do")
	public ModelAndView openRequest(@RequestParam("on_code") String on_code) {
		ModelAndView mav = new ModelAndView();
		
		OpenNoticeDTO dto = adminDao.openRequest(on_code);
		mav.addObject("dto",dto);
		mav.setViewName("/admin/openRequest");
		return mav;
	}
	
	//오픈공지 승인, 거절
	@RequestMapping("openRequestEnd.do")
	public ModelAndView openRequestEnd(@RequestParam("rs_code") int rs_code,
			@RequestParam("on_code") String on_code) {
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
	public ModelAndView addApplyList() {
		ModelAndView mav = new ModelAndView();
		
		List<ServiceRequestDTO> lists = adminDao.addApplyList();
		
		mav.addObject("lists",lists);
		
		
		mav.setViewName("/admin/addApplyList");
		return mav;
	}
	
	//공연등록 반영 홈페이지
	//공연등록 상세
	@RequestMapping("addApply.do")
	public ModelAndView addApply(@RequestParam("sr_code") String sr_code) {
		ModelAndView mav = new ModelAndView();
		
		MusicalDTO dto = adminDao.addApply(sr_code);
		mav.addObject("dto",dto);
		mav.setViewName("/admin/addApply");
		return mav;
	}
	
	//공연등록 반영
	@RequestMapping("addApplyEnd.do")
	public ModelAndView addApplyEnd(@RequestParam("m_code") String m_code) {
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
	public ModelAndView openApplyList() {
		ModelAndView mav = new ModelAndView();
		
		List<OpenNoticeDTO> lists = adminDao.openApplyList();
		
		mav.addObject("lists",lists);
		
		
		mav.setViewName("/admin/openApplyList");
		return mav;
	}
	
	//오픈공지 반영 홈페이지
	//오픈공지 상세
	@RequestMapping("openApply.do")
	public ModelAndView openApply(@RequestParam("on_code") String on_code) {
		ModelAndView mav = new ModelAndView();
		
		OpenNoticeDTO dto = adminDao.openApply(on_code);
		mav.addObject("dto",dto);
		mav.setViewName("/admin/openApply");
		return mav;
	}
	
	//오픈공지 반영
	@RequestMapping("openApplyEnd.do")
	public ModelAndView openApplyEnd(@RequestParam("on_code") String on_code) {
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
	public ModelAndView bannerList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/bannerList");
		
		//기존 배너 있으면 들고오기
		List<BannerDTO> lists = adminDao.bannerList();
		mav.addObject("lists",lists);
		
		
		return mav;
	}
	
	//추가할 배너리스트 가져오기
	@RequestMapping("/addBannerList.do")
	public ModelAndView addBannerList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/addBannerList");
		
		//배너추가는 viewstate 확인
		List<BannerDTO> lists = adminDao.addBannerList();
		mav.addObject("lists",lists);
		
		return mav;
	}
	
	//배너 추가하기
	@RequestMapping("/addBanner.do")
	public ModelAndView addBanner(@RequestParam("m_code") String m_code) {
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
	public ModelAndView deleteBanner(@RequestParam("m_code") String m_code) {
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
	public ModelAndView adminReviewList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/adminReviewList");
		
		List<MusicalReviewDTO> lists = adminDao.adminReviewList();
		mav.addObject("lists",lists);
		return mav;
	}
	
	//삭제, 상태 바꾸기
	@RequestMapping("adminDeleteReview.do")
	public ModelAndView adminDeleteReview(@RequestParam("mr_code") String mr_code,@RequestParam("mr_state") int mr_state) {
		ModelAndView mav =new ModelAndView();
		
		List<MusicalReviewDTO> lists = adminDao.adminReviewList();
		mav.addObject("lists",lists);
		
		mav.addObject("goUrl", "adminReviewList.do");
		
		return mav;
	}
	
	/* 불량리뷰관리 끝 */
	
	
	
	
	
	
	
	/* 파트너 리뷰관리 시작 */
	@RequestMapping("pReviewList.do")
	public ModelAndView pReviewList() {
		ModelAndView mav =new ModelAndView();
		
		List<RequestListDTO> lists = adminDao.pReviewList();
		mav.addObject("lists",lists);
		
		mav.setViewName("/admin/pReviewList");
		return mav;
	}
	
	
	//거절이면 bdr만 삭제
	@RequestMapping("pReview.do")
	public ModelAndView pReview(@RequestParam("bdr_code") String bdr_code,
			@RequestParam("bdr_state") int bdr_state) {
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
	public ModelAndView partnerRequestList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/partnerRequestList");
		
		//기존 배너 있으면 들고오기
		List<PartnerDTO> lists = adminDao.partnerRequestList();
		mav.addObject("lists",lists);
		
		
		return mav;
	}
	
	//제작사회원 상세
	@RequestMapping("/partnerRequest.do")
	public ModelAndView partnerRequest(@RequestParam("pr_code") String pr_code) {
		ModelAndView mav = new ModelAndView();
		
		//기존 배너 있으면 들고오기
		PartnerDTO dto = adminDao.partnerRequest(pr_code);
		mav.addObject("dto",dto);
		
		mav.setViewName("/admin/partnerRequest");
		return mav;
	}
	
	
	//제작사회원 상태값 바꾸기
	@RequestMapping("/partnerRequestEnd.do")
	public ModelAndView partnerRequestEnd(@RequestParam("rs_code") int rs_code,
											@RequestParam("pr_code") String pr_code) {
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
	public ModelAndView musePassStats() {
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
	public ModelAndView memberStats() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("admin/memberStats");
		return mav;
	}
	
	
	/* 통계 끝 */
	
}




