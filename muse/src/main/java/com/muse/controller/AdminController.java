package com.muse.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.muse.admin.model.AdminDAO;
import com.muse.admin.model.AdminDTO;
import com.muse.admin.model.BannerDTO;
import com.muse.admin.model.OpenNoticeDTO;
import com.muse.admin.model.PartnerDTO;
import com.muse.review.model.MusicalReviewDTO;

@Controller
public class AdminController {


	@Autowired
	private AdminDAO adminDao;
	
	
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
	
	
	//ModelAndView는 request와 비슷함
	@RequestMapping("/hello.do") //명령어에 의해 진입하는 메소드. 즉 hello.do가 불러지면 실행
	public ModelAndView hello() {
		
		String result="spring MVC Framework!";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", result);
		mav.setViewName("/hello");
		//view 페이지 저장
		
		return mav;
	}
	
	
	@RequestMapping("/adminIndex.do")
	public ModelAndView adminIndex() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/index");
		return mav;
	}
	
	
	@RequestMapping("/adminLogin.do")
	public ModelAndView goAdminLogin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/login");
		return mav;
	}
	
	
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
	
	
	/* 불량리뷰관리 */
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
		
		int result = adminDao.adminDeleteReview(mr_code,mr_state);
		
		mav.addObject("msg", "리뷰 상태 변경 완료!");
		mav.setViewName("/admin/adminMsg");
		mav.addObject("goUrl", "adminReviewList.do");
		
		return mav;
	}
	
	
	
	
	
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
	
	
	
	
	//통계
	@RequestMapping("/musePassStats.do")
	public ModelAndView musePassStats() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/musePassStats");
		
		
		return mav;
	}
	
	
	
}




