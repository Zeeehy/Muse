package com.muse.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.muse.partner.model.ActorDTO;
import com.muse.partner.model.MusicalDTO;
import com.muse.partner.model.MusicalHallDTO;
import com.muse.partner.model.MusicalOptionDTO;
import com.muse.partner.model.MusicalReviewDTO;
import com.muse.partner.model.PartnerDAO;
import com.muse.partner.model.PartnerDTO;
import com.muse.partner.model.SeatGradeDTO;
import com.muse.partner.model.ServiceRequestDTO;
import com.muse.reserv.model.ReservDAO;
import com.muse.seat.model.SeatDTO;
import com.muse.seat.model.SeatLayoutDAO;
import com.muse.seat.model.SeatLayoutDTO;
@Controller
public class PartnerController {

	
	private static final String String = null;
	@Autowired
	private PartnerDAO partnerDao;
	@Autowired
	private SeatLayoutDAO seatLayoutDAO;
	
	@RequestMapping("/partnerAddForm.do")
	public ModelAndView partnerAddForm(
			@RequestParam(value="s_pr_code",required = false, defaultValue = "no")String pr_code) {
		System.out.println(pr_code+"@@@@@@@@@@@@@@@@@");
		
		PartnerDTO DTO = partnerDao.getPartnerInfo(pr_code);
		//System.out.println(DTO.getRs_code()+"@###################");
		ModelAndView mav = new ModelAndView();
		String msg= "";
		if(DTO ==null) {
			msg="파트너 신청을 해주세요";
		}else if(DTO.getRs_code()==2) {
					msg="관리자에게 문의하세요.";
				}else if(DTO.getRs_code()==0) {
					msg="승인 대기중입니다.";
				}


		mav.addObject("dto", DTO);
		mav.setViewName("/partner/partnerAddForm");
		mav.addObject("msg", msg);
		return mav;
	}
	
	
	@RequestMapping("/reviewDeleteForm.do")
	public ModelAndView reviewDelete(@RequestParam(value="pr_code") String pr_code) {
		List<MusicalReviewDTO> list = partnerDao.seachReview(pr_code);
		System.out.println("123");
		System.out.println(pr_code);
		System.out.println(list.size());
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("/partner/reviewDelete");
		return mav;
	}
	
	@RequestMapping("/castAddForm.do")
	public String castAddForm() {
		
		return "/partner/castAddForm";
	}
	@RequestMapping("/ticetOpenForm.do")
	public ModelAndView ticetOpenForm(@RequestParam(
			value="pr_code",
			defaultValue = "no")String pr_code) {
		
		ModelAndView mav = new ModelAndView();
		PartnerDTO dto = partenrInfo(pr_code);
		mav.addObject("dto", dto);
		mav.setViewName("/partner/ticetOpenNotice");
		return mav;
	}
	
	@RequestMapping("/partnerMainForm.do")
	public ModelAndView partnerMain(@RequestParam(value="s_pr_code", defaultValue = "no") String pr_code) {
		ModelAndView mav =new ModelAndView();
		mav.addObject("pr_code", pr_code);
		mav.setViewName("/partner/partnerMainForm");
		return mav;
	}
	@RequestMapping("/musicalSeatAddForm.do")
	public ModelAndView musicalSeatForm() {
		ModelAndView mav = new ModelAndView();
		List<SeatLayoutDTO> layout = seatLayoutDAO.seatLayoutSelect();
		List<String> section = seatLayoutDAO.sectionSelect();
		List<Integer> floor = seatLayoutDAO.bindByallFloorSelect();
		Map<Integer,Integer> max_rowMap= seatLayoutDAO.max_rowSelect(); 
		List<SeatDTO> seatList = seatLayoutDAO.getRealSeat();
		List<SeatGradeDTO> seatGradeList = partnerDao.selectSeatGrade();
		
		
		String jsonLayout = new Gson().toJson(layout);
		String jsonSection =  new Gson().toJson(section); 
		String jsonFloor = new Gson().toJson(floor);
		String jsonMax_rowMap = new Gson().toJson(max_rowMap);
		String jseatList =  new Gson().toJson(seatList);
		String jseatGradeList = new Gson().toJson(seatGradeList);
		
		mav.addObject("layouts",jsonLayout);
		mav.addObject("section",jsonSection);
		mav.addObject("floor",jsonFloor);
		mav.addObject("max_rowMap",jsonMax_rowMap);
		mav.addObject("seatList",jseatList);

		mav.addObject("seatGradeList",jseatGradeList);//좌석 등급 가져오는 리스트
		mav.setViewName("/partner/musicalSeatAddForm");
		return mav;
	}
	

	//뮤지컬 등록 폼으로 가기
	@RequestMapping("/musicalOpenForm.do")
	public ModelAndView musicalAddForm(String pr_code) {
		System.out.println(pr_code+"@@@@@@@@@@@@@@@@@");	
		ModelAndView mav = new ModelAndView();
		List<MusicalHallDTO> list = partnerDao.getMusicalHallList();
		PartnerDTO dto = partenrInfo(pr_code);
		mav.addObject("dto", dto);
		mav.addObject("HallList", list);
		mav.setViewName("/partner/musicalAddForm");
		return mav;
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
	public ModelAndView getMusicalList(@RequestParam String pr_code, 
			@RequestParam(defaultValue="")String seachMusical) {
			List<MusicalDTO> list = partnerDao.SeachMusicalList(pr_code, seachMusical);
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
	//나중에 메인 생기면 반환값 int로 바꾸기
	@RequestMapping("/insertCast.do")
	public ModelAndView insertCast(String ma_code,String mc_char,String m_code,String mo_date, String mo_time) {
		int result = partnerDao.insertCasting(ma_code, mc_char, m_code, mo_date, mo_time);
		System.out.println(result+"@@@@@@@@@@@@@@@@@@@@@@@@");
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("parkJson");
	    return mav;
	}
	
	@RequestMapping("/insertOpenNotice.do")
	public ModelAndView insertOpenNotice(
	        @RequestParam("m_code") String m_code,
	        @RequestParam("rs_code") String rs_code,
	        @RequestParam("on_type") String on_type,
	        @RequestParam("on_openDate") String on_openDate,
	        @RequestParam("on_openTime") String on_openTime,
	        @RequestParam(value = "on_muse_openDate", required = false) String on_muse_openDate,
	        @RequestParam(value = "on_muse_openTime", required = false) String on_muse_openTime,
	        @RequestParam("on_info") String on_info,
	        @RequestParam("on_sale") String on_sale,
	        @RequestParam("on_content") String on_content,
	        @RequestParam("on_casting") String on_casting,
	        @RequestParam("on_etc") String on_etc) {

	    // 전달된 값들을 출력 (디버깅 용도)
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	    System.out.println("뮤지컬 코드 (m_code): " + m_code);
	    System.out.println("요청 상태 (rs_code): " + rs_code);
	    System.out.println("티켓 타입 (on_type): " + on_type);
	    System.out.println("티켓 오픈 시간 (on_openDate): " + on_openDate);
	    System.out.println("티켓 오픈 시간 (on_openTime): " + on_openTime);
	    System.out.println("뮤즈 패스 오픈 시간 (on_muse_open): " + on_muse_openDate);
	    System.out.println("뮤즈 패스 오픈 시간 (on_muse_openTime): " + on_muse_openTime);
	    System.out.println("공연 정보 (on_info): " + on_info);
	    System.out.println("할인 정보 (on_sale): " + on_sale);
	    System.out.println("공연 소개 (on_content): " + on_content);
	    System.out.println("캐스팅 (on_casting): " + on_casting);
	    System.out.println("기타 전달사항 (on_etc): " + on_etc);
	    
	    
	    
	    String open = on_openDate+" "+ on_openTime;
	    String museOpen = on_muse_openDate+" " +on_muse_openTime;
	    
	    int result = partnerDao.insertTicketNotice(m_code, rs_code, on_type, open, museOpen, on_info, on_sale, on_content, on_casting, on_etc);
	    System.out.println(result+"@@@@@@@@@@@@@@@@@@@@@@");
	    // ModelAndView 객체 생성 후 반환
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/partner/castAddForm");
	    return mav;
	}
	
	@RequestMapping(value="/insertSeat.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> processSeats(@RequestBody Map<String, List<Object[]>> request) {
	    List<Object[]> seats = request.get("seats");
	    //int i=0;
	    List<SeatDTO> seatList = new ArrayList<>();
	    
	    for(Object[] seatData : seats) {
	    		//i++;
		       System.out.println(seatData.toString());
		       System.out.println(seatData[0]);
		       System.out.println(seatData[1]);
		       System.out.println(seatData[2]);
		       System.out.println(seatData[3]);
		       System.out.println(seatData[4]);
		       System.out.println(seatData[5]);
		       System.out.println(seatData[6]);
				
				  SeatDTO seatDTO = new SeatDTO();
				  seatDTO.setSg_code(String.valueOf(seatData[0])); // sg_code
				  seatDTO.setM_code(String.valueOf(seatData[1]));// m_code
				  seatDTO.setMhl_code(Integer.parseInt(String.valueOf(seatData[2]))); //뮤지컬 홀 레이아웃 코드
				  seatDTO.setS_section(String.valueOf(seatData[3])); // section
				  seatDTO.setS_position(Integer.parseInt(String.valueOf(seatData[4]))); //몇번째인지
				  seatDTO.setS_row(Integer.parseInt(String.valueOf(seatData[5]))); //
				  seatDTO.setS_floor(Integer.parseInt(String.valueOf(seatData[6])));
				  seatList.add(seatDTO);
				  System.out.println(seatDTO);
	    }
	    int result = partnerDao.insertSelectSeats(seatList);
	    System.out.println(result+"결과값!!!!!!!!!!!!!!");
	    // seatList 처리 로직
	    
	    return ResponseEntity.ok().body("Success");
	}
	
	@RequestMapping("/insertMusical.do")
	public ModelAndView insertMusical(MusicalDTO dto) {
		
        System.out.println("mh_code: " + dto.getMh_code());
        System.out.println("pr_code: " + dto.getPr_code());
        System.out.println("m_title: " + dto.getM_title());
        System.out.println("m_startDate: " + dto.getM_startDate());
        System.out.println("m_endDate: " + dto.getM_endDate());
        System.out.println("m_time: " + dto.getM_time());
        System.out.println("m_inTime: " + dto.getM_inTime());
        System.out.println("m_maxTicet: " + dto.getm_maxTicket());
        System.out.println("m_age: " + dto.getM_age());
        System.out.println("m_openDate: " + dto.getM_openDate());
        System.out.println("m_openTime: " + dto.getM_openTime());
        System.out.println("m_notice: " + dto.getM_notice());
        System.out.println("m_poster: " + dto.getM_poster());
        System.out.println("m_detailImg: " + dto.getM_detailImg());
        System.out.println("m_calender: " + dto.getm_calendar());
        System.out.println("m_single: " + dto.getM_single());
        System.out.println("m_viewState: " + dto.getM_viewState());
        System.out.println("m_ref: " + dto.getM_ref());
        
        int result = partnerDao.insertMusical(dto);
        int code = partnerDao.seachCode("m_code", "musical");
        ServiceRequestDTO Srdto = new ServiceRequestDTO();
        Srdto.setM_code("m_"+code);
        Srdto.setRs_code(0);
        Srdto.setRt_code(0);
        
        int sr_result = partnerDao.InsertServiceRequest(Srdto);
        
        
        
        System.out.println("결과@@@@@@@@@@@@@@@"+result);
        System.out.println("결과@@@@@@@@@@@@@@@"+sr_result+"@@@@@@@@@@@@@@@@@한번에가자");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/partner/partnerMainForm");
		return mav;
	}
	@RequestMapping("/partnerInsert.do")
	public ModelAndView partnerInsert(PartnerDTO DTO) {
		int result = partnerDao.partnerInsert(DTO);
		System.out.println(result+"@@@@@@@@@@");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/partner/partnerMainForm");
		return mav;
	}
	
	public PartnerDTO partenrInfo(String pr_code) {
		PartnerDTO DTO = partnerDao.getPartnerInfo(pr_code);
		return DTO;
	}
	/*
	 * @RequestMapping() public ModelAndView reviewDeleteForm() { ModelAndView mav =
	 * new ModelAndView(); return mav; }
	 */
	@RequestMapping("/deleteReviewAction.do")
	public ModelAndView deleteReviewAction() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	

}