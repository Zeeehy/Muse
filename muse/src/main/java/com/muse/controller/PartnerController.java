package com.muse.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.muse.member.model.MemberDAO;
import com.muse.member.model.MemberDTO;
import com.muse.partner.model.ActorDTO;
import com.muse.partner.model.BbsDeleteRequestDTO;
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
	private String Dpr_code ="no";
	private String mainUrl = "partnerMainForm.do?pr_code="+Dpr_code+"&u_id=no&getMusicalList=0&isFutureDate=0";
			
@Autowired
	MemberDAO memberDao;
	
	@RequestMapping("/partnerAddForm.do")
	public ModelAndView partnerAddForm(
			@RequestParam(value="pr_code",required = false, defaultValue = "no")String pr_code,
			@RequestParam(value="u_id",defaultValue = "no")String u_id,
			HttpSession session) {
		
		//MemberDTO MemberDto = partnerDao.getusersInfo(u_id);
		PartnerDTO DTO = partnerDao.getPartnerInfo(pr_code);
		
		System.out.println(pr_code+"@@@@@@@@@@@@@@@@@");
		ModelAndView mav = new ModelAndView();
		
		//mav.addObject("mdto", MemberDto);
		mav.addObject("dto", DTO);
		mav.setViewName("/partner/partnerAddForm");
		return mav;
	}
	@RequestMapping("/musicalUpdateForm.do")
	public ModelAndView musicalUpdateForm(
			@RequestParam(value="m_code")String m_code,
			@RequestParam(value="pr_code")String pr_code) {
		System.out.println("진입");
		 MusicalDTO updatedto = partnerDao.selectAllMusical(m_code);
		List<MusicalDTO> list = partnerDao.selectAllmh();
		PartnerDTO dto = partenrInfo(pr_code);

		ModelAndView mav = new ModelAndView();
		mav.addObject("updatedto", updatedto);
		
		mav.addObject("dto", dto);
		mav.addObject("list", list); //뮤지컬 홀 리스트
		System.out.println(updatedto.getM_endDate()+"@@@@@@@@@@@@");
		mav.setViewName("/partner/musicalUpdateForm");
		return mav;
	}
	
	@RequestMapping(value = "/updateMusicalInfo.do", method = RequestMethod.POST)
	public ModelAndView updateMusical(MusicalDTO dto,
			@RequestParam(value="m_posterfile1")MultipartFile m_posterfile1, 
			@RequestParam(value="m_detailImgfile1")MultipartFile m_detailImgfile1,
			HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		System.out.println("mh_code: " + dto.getMh_code());
        System.out.println("pr_code: " + dto.getPr_code());
        System.out.println("m_startDate: " + dto.getM_startDate());
        System.out.println("m_endDate: " + dto.getM_endDate());
        System.out.println("m_time: " + dto.getM_time());
        System.out.println("m_inTime: " + dto.getM_inTime());
        System.out.println("m_maxTicet: " + dto.getM_maxTicket());
        System.out.println("m_age: " + dto.getM_age());
        System.out.println("m_openDate: " + dto.getM_openDate());
        System.out.println("m_openTime: " + dto.getM_openTime());
        System.out.println("m_notice: " + dto.getM_notice());
        System.out.println("m_calender: " + dto.getM_calendar());
        System.out.println("m_single: " + dto.getM_single());
        System.out.println("m_viewState: " + dto.getM_viewState());
        System.out.println("m_ref: " + dto.getM_ref());
        
        String savePath = req.getSession().getServletContext().getRealPath("/resources/img/musical/");
        File dir = new File(savePath);//musical폴더
        System.out.println(dir.getPath()+"경로@@@@@@@@@@@@@@@@@");
        
        try {
        	 if(!m_posterfile1.isEmpty()) {
            	 String m_poster = m_posterfile1.getOriginalFilename();
                 String posterPath = dir + File.separator + m_poster;
                 m_posterfile1.transferTo(new File(posterPath));
                 System.out.println("포스터 이미지 이름:"+m_poster);
                 dto.setM_poster(m_poster);
            }
            
            if(!m_detailImgfile1.isEmpty()) {
            	String m_detailImg = m_detailImgfile1.getOriginalFilename();
                String detailImgPath = dir + File.separator + m_detailImg;
                m_detailImgfile1.transferTo(new File(detailImgPath));
                System.out.println("디테일 이미지 이름:"+m_detailImg);
                dto.setM_detailImg(m_detailImg);
            }
		} catch (IOException e) {
			e.printStackTrace();
			
		}
       
        System.out.println("m_poster: " + dto.getM_poster());
        System.out.println("m_detailImg: " + dto.getM_detailImg());
        System.out.println(dto.getM_code());
        dto.setM_ref(Integer.parseInt(dto.getM_code().replace("m_", "")));//수정일떄의 ref코드
        System.out.println(dto.getM_ref()+"파싱된 ref의 값@@@@@@@@@@@@@@@");
        int result = partnerDao.insertMusical(dto);
        String m_code= partnerDao.MaxMcode();
        ServiceRequestDTO Srdto = new ServiceRequestDTO();
        Srdto.setM_code(m_code);
        Srdto.setRs_code(0);
        Srdto.setRs_etc("정보 수정");
        Srdto.setRt_code(1);
        
        int sr_result = partnerDao.InsertServiceRequest(Srdto);
        
        System.out.println(m_code+"파라미터로 넘겨온 m_cdoe");
        System.out.println("뮤지컬 테이블 인설트"+result);
        System.out.println("서비스 리퀘스트 테이블 인설트"+sr_result);
        String msg = "";
        String goUrl = "";
		if(result==1||sr_result==1) {
			msg="뮤지컬 등록 완료";
			goUrl = mainUrl;
			mav.addObject("goUrl", goUrl);
			mav.addObject("msg", msg);
		}else if(sr_result==0||result==0) {
			msg="뮤지컬 등록 오류";
			goUrl = mainUrl;
			mav.addObject("goUrl", goUrl);
			mav.addObject("msg",msg);
		}
		
		
		
		mav.setViewName("/member/memberMsg");
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
	public ModelAndView partnerMain(@RequestParam(value="pr_code", defaultValue = "no") String pr_code,
			@RequestParam(value="u_id", defaultValue = "no") String u_id,
			@RequestParam(value="getMusicalList",defaultValue="0")String getMusicalList,
			@RequestParam(value="isFutureDate",defaultValue="0")String isFutureDate) {
		
		List<MusicalDTO> list = partnerDao.getMusicalList(pr_code,getMusicalList); //판매 현황
		List<MusicalDTO> Statelist = partnerDao.getReqeustList(pr_code,isFutureDate); //요청 현황
		System.out.println(pr_code+"@@@@@@@메인 pr코드");
		System.out.println(isFutureDate+"요청 현황 상태값 확인");
		ModelAndView mav =new ModelAndView();
		mav.addObject("pr_code", pr_code);
		mav.addObject("list", list);
		System.out.println(Statelist.size()+"배열 사이즈@@@@@@@@@@@@@@@@@@@@");
		
		
		mav.addObject("statelist", Statelist);
		
		MemberDTO MemberDto = partnerDao.getusersInfo(u_id);
		mav.addObject("mdto", MemberDto);
		if(pr_code.equals("no")) {

			mav.setViewName("/partner/partnerMainForm");
		}else {
			mav.addObject("getMusicalList", getMusicalList);
			mav.addObject("isFutureDate", isFutureDate);
			mav.setViewName("/partner/partnerMainForm");
		};
		
		return mav;
	}
	
	@RequestMapping("/musicalSeatAddForm.do")
	public ModelAndView musicalSeatForm(
			@RequestParam(value="mh_code", defaultValue = "") String mh_code,
			@RequestParam(value="m_name",defaultValue = "")String m_name,
			@RequestParam(value="m_code",defaultValue = "")String m_code) {
		ModelAndView mav = new ModelAndView();
		SeatDTO sDTO = partnerDao.selectLayout(mh_code);
		System.out.println(m_name+"@#@#@#@#@#@#");
		int mhl_code = 0;
		if(sDTO!=null) {
			mhl_code=sDTO.getMhl_code();
		}
		System.out.println("mhl_code"+mhl_code);
		List<SeatLayoutDTO> layout = partnerDao.seatLayoutSelectPartner(mhl_code);
		List<String> section = partnerDao.sectionSelectPartner(mhl_code);
		List<Integer> floor = partnerDao.bindByallFloorSelectPartner(mhl_code);
		Map<Integer,Integer> max_rowMap= partnerDao.max_rowSelectPartner(mhl_code); 
		List<SeatDTO> seatList = partnerDao.getRealSeatPartner();
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
		//mav.setViewName("parkJson");
		mav.setViewName("partner/musicalSeatAddForm");
		mav.addObject("m_name", m_name);
		mav.addObject("m_code", m_code);
		mav.addObject("mhl_code", mhl_code);
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
	public ModelAndView getMusicalList(@RequestParam(defaultValue="") String pr_code, 
			@RequestParam(defaultValue="")String seachMusical,
			@RequestParam(defaultValue="")String state) {
			List<MusicalDTO> list = partnerDao.SeachMusicalList(pr_code, seachMusical,state);
			ModelAndView mav = new ModelAndView();
			
			System.out.println(list.size());
			
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
		mav.setViewName("parkJson");
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
		System.out.println("@@@@@@@@@@@@@@@@@@");
		System.out.println(ma_code);
		System.out.println(mc_char);
		System.out.println(mo_date);
		System.out.println(m_code);
		System.out.println(mo_time);
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
	    String msg="";
		String goUrl ="";
		ModelAndView mav = new ModelAndView();
		if(result>=1) {
			msg = "오픈 등록 신청 완료";
			goUrl = mainUrl;
			mav.addObject("msg", msg);
			mav.addObject("goUrl", goUrl);
			
		}else {
			msg = "오픈 등록 신청 실패";
			goUrl = "insertOpenNotice.do";
			mav.addObject("msg", msg);
			mav.addObject("goUrl", goUrl);
		}
		mav.setViewName("/member/memberMsg");
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
				/*
				 * System.out.println(seatData.toString()); System.out.println(seatData[0]);
				 * System.out.println(seatData[1]); System.out.println(seatData[2]);
				 * System.out.println(seatData[3]); System.out.println(seatData[4]);
				 * System.out.println(seatData[5]); System.out.println(seatData[6]);
				 */
				
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
	public ModelAndView insertMusical(MusicalDTO dto,
			@RequestParam(value="m_posterfile")MultipartFile m_posterfile, 
			@RequestParam(value="m_detailImgfile")MultipartFile m_detailImgfile,
			HttpServletRequest req) {
		
		System.out.println("mh_code: " + dto.getMh_code());
        System.out.println("pr_code: " + dto.getPr_code());
        System.out.println("m_startDate: " + dto.getM_startDate());
        System.out.println("m_endDate: " + dto.getM_endDate());
        System.out.println("m_time: " + dto.getM_time());
        System.out.println("m_inTime: " + dto.getM_inTime());
        System.out.println("m_maxTicet: " + dto.getM_maxTicket());
        System.out.println("m_age: " + dto.getM_age());
        System.out.println("m_openDate: " + dto.getM_openDate());
        System.out.println("m_openTime: " + dto.getM_openTime());
        System.out.println("m_notice: " + dto.getM_notice());
        System.out.println("m_calender: " + dto.getM_calendar());
        System.out.println("m_single: " + dto.getM_single());
        System.out.println("m_viewState: " + dto.getM_viewState());
        System.out.println("m_ref: " + dto.getM_ref());
        
        String savePath = req.getSession().getServletContext().getRealPath("/resources/img/musical/");
        File dir = new File(savePath);//musical폴더
        System.out.println(dir.getPath()+"경로@@@@@@@@@@@@@@@@@");
        
        try {
        	 if(!m_posterfile.isEmpty()) {
            	 String m_poster = m_posterfile.getOriginalFilename();
                 String posterPath = dir + File.separator + m_poster;
                 m_posterfile.transferTo(new File(posterPath));
                 System.out.println("포스터 이미지 이름:"+m_poster);
                 dto.setM_poster(m_poster);
            }
            
            if(!m_detailImgfile.isEmpty()) {
            	String m_detailImg = m_detailImgfile.getOriginalFilename();
                String detailImgPath = dir + File.separator + m_detailImg;
                m_detailImgfile.transferTo(new File(detailImgPath));
                System.out.println("디테일 이미지 이름:"+m_detailImg);
                dto.setM_detailImg(m_detailImg);
            }
		} catch (IOException e) {
			e.printStackTrace();
			
		}
       
        System.out.println("m_poster: " + dto.getM_poster());
        System.out.println("m_detailImg: " + dto.getM_detailImg());
        
        
        dto.setM_ref(0);
        int result = partnerDao.insertMusical(dto);
        String m_code= partnerDao.MaxMcode();
        ServiceRequestDTO Srdto = new ServiceRequestDTO();
        Srdto.setM_code(m_code);
        Srdto.setRs_code(0);
        Srdto.setRt_code(0);
        Srdto.setRs_etc("신규 등록");
        int sr_result = partnerDao.InsertServiceRequest(Srdto);
        
        System.out.println(m_code+"파라미터로 넘겨온 m_cdoe");
        System.out.println("뮤지컬 테이블 인설트"+result);
        System.out.println("서비스 리퀘스트 테이블 인설트"+sr_result);
        String msg = "";
        String goUrl = "";
		ModelAndView mav = new ModelAndView();
		if(result==1||sr_result==1) {
			msg="뮤지컬 등록 완료";
			goUrl = mainUrl;
			mav.addObject("goUrl", goUrl);
			mav.addObject("msg", msg);
		}else if(sr_result==0||result==0) {
			msg="뮤지컬 등록 오류";
			goUrl = mainUrl;
			mav.addObject("goUrl", goUrl);
			mav.addObject("msg",msg);
		}
		
		mav.setViewName("/member/memberMsg");
		return mav;
	}
	@RequestMapping("/partnerInsert.do")
	public ModelAndView partnerInsert(PartnerDTO DTO) {
		int result = partnerDao.partnerInsert(DTO);
		System.out.println(result+"@@@@@@@@@@");
		String msg="";

		String goUrl ="index.do";
		ModelAndView mav = new ModelAndView();
		if(result>=1) {
			msg = "파트너 등록 신청 완료";
			mav.addObject("msg", msg);
			mav.addObject("goUrl", goUrl);
			
		}else {
			msg = "파트너 등록 신청 실패";
			mav.addObject("msg", msg);
			mav.addObject("goUrl", goUrl);
		}
		mav.setViewName("/member/memberMsg");
		return mav;
	}
	
	public PartnerDTO partenrInfo(String pr_code) {
		PartnerDTO DTO = partnerDao.getPartnerInfo(pr_code);
		return DTO;
	}

	@RequestMapping("/deleteReviewAction.do")
	public ModelAndView deleteReviewAction(
	        @RequestParam(value = "mr_code") String mr_code,
	        @RequestParam(value = "mr_title") String mr_title,  // 제목
	        @RequestParam(value = "u_id") String u_id,          // 작성자
	        @RequestParam(value = "mr_date") String mr_date,
	        @RequestParam(value= "pr_code")String pr_code) {
		System.out.println("리뷰삭제페이지이동 컨트롤러메서드진입확인");
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	@RequestMapping("/serchMusical.do")
	public ModelAndView serchMusicalReview() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	@RequestMapping("/getmusicalReview.do")
	public ModelAndView getmusicalReview(
			@RequestParam(value="s_pr_code") String pr_code,
			@RequestParam(value = "m_code",defaultValue="")String m_code) {
		ModelAndView mav = new ModelAndView();
		System.out.println(m_code+"@@@@@@@@@@@@@@");
		List<MusicalReviewDTO> list = partnerDao.seachMusicalReview(pr_code,m_code);
		
		System.out.println(pr_code);
		System.out.println("해당 뮤지컬 리스트 사이즈"+list.size());
		PartnerDTO DTO = partnerDao.getPartnerInfo(pr_code);
		mav.addObject("dto", DTO);
		mav.addObject("list", list);
		mav.setViewName("parkJson");
		return mav;
	}
	@RequestMapping("/deleteReviewForm.do")
	public ModelAndView deleteReview(MusicalReviewDTO DTO) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/partner/deleteReviewForm");
		mav.addObject("dto", DTO);
		return mav;
	}
	@RequestMapping("/bestViewOK.do")
	public ModelAndView bestViewOK(@RequestParam(value="mr_code") String mr_code) {

		ModelAndView mav = new ModelAndView();
		int result = partnerDao.updateBestReveiw(mr_code);
		if(result>=1)mav.addObject("result",result);
		System.out.println(result+"뭔가 바뀜");
		mav.addObject("mr_code",mr_code);

		mav.setViewName("parkJson");
		return mav;
	}
	@RequestMapping("/deleteReviewRe.do")
	public ModelAndView deleteReviewRe(BbsDeleteRequestDTO dto,
		@RequestParam(value="mr_code")String mr_code) {
		dto.setBdr_key(mr_code);
		int result = partnerDao.deleteReviewRe(dto);
		ModelAndView mav =new ModelAndView();
	 	String msg ="";
	 	String goUrl="";
		if(result==1) {
			msg="리뷰 삭제 요청 성공";

		 	goUrl="reviewDeleteForm.do?pr_code="+dto.getPr_code();
			mav.addObject("msg", msg);
			mav.addObject("goUrl", goUrl);
		}else {
			msg="리뷰 삭제 요청 실패";

		 	goUrl="reviewDeleteForm.do?pr_code="+dto.getPr_code();
		 	mav.addObject("msg", msg);
		 	mav.addObject("goUrl", goUrl);
		}
		mav.setViewName("/member/memberMsg");
		return mav;
	}
	@RequestMapping(value = "/partnerLogin.do", method = RequestMethod.POST)
	public ModelAndView partnerLogin(@RequestParam("u_id") String u_id,
									@RequestParam("u_pwd") String u_pwd,
									HttpSession session) {
		ModelAndView mav =new ModelAndView();
		
		  int loginResult = memberDao.loginCheck(u_id, u_pwd);

		
	        // 로그인 결과에 따라 처리
	        if(loginResult==1 || loginResult==2) {
				mav.addObject("goUrl", "partnerLogin.do");
				mav.addObject("msg", "아이디 또는 비밀번호가 잘못되었습니다.");
				mav.setViewName("member/memberMsg");
			} else if(loginResult==3) {
				MemberDTO s_info=memberDao.getUserInfo(u_id);		
				session.setAttribute("p_s_id", u_id);
				Dpr_code=s_info.getPr_code();
				session.setAttribute("s_pr_code", s_info.getPr_code());
				session.setAttribute("s_rs_code", s_info.getRs_code());
				PartnerDTO DTO = partnerDao.getPartnerInfo(s_info.getPr_code());
				String msg="";
				String goUrl="";
				if(DTO!=null) {
					if(DTO.getRs_code()==0){
						msg="파트너 승인 대기중입니다.";
						goUrl="index.do";
					}else if(DTO.getRs_code()==2) {
						msg="파트너 승인이 반려되었습니다.";
						goUrl="index.do";
					}else if(DTO.getRs_code()==1){
						session.setAttribute("pr_name", DTO.getPr_name());
						System.out.println("rscode상태"+DTO.getRs_code());
						mav.addObject("dto", DTO);
						msg=DTO.getPr_name()+"님 환영합니다.";
						goUrl=mainUrl;
					}


					mav.addObject("msg", msg);
					mav.addObject("goUrl", goUrl);
					mav.setViewName("/member/memberMsg");
				}else if(DTO==null){
					MemberDTO MemberDto = partnerDao.getusersInfo(u_id);
					mav.addObject("mdto", MemberDto);
					mav.setViewName("/partner/partnerAddForm");
				}
				
		        
			}
		return mav;
	}
	
	 @RequestMapping(value = "/partnerLogin.do", 
			 method = RequestMethod.GET)
	    public String partnerLoginForm(HttpServletRequest request, HttpSession session) {

		 
	        return "/partner/partnerLogin";
	    }
	 
	 @RequestMapping("/insertSeatPriceSeat.do")
	 public ModelAndView insertSeatPriceSeat( 
			 	@RequestParam("m_code") String m_code,
			    @RequestParam("sg_code1") String sgCode1,
			    @RequestParam("sp_price1") int spPrice1,
			    @RequestParam("sg_code2") String sgCode2,
			    @RequestParam("sp_price2") int spPrice2,
			    @RequestParam("sg_code3") String sgCode3,
			    @RequestParam("sp_price3") int spPrice3,
			    @RequestParam("sg_code4") String sgCode4,
			    @RequestParam("sp_price4") int spPrice4) {
		 	sgCode1 = "sg_1";
		 	sgCode2 = "sg_2";
		 	sgCode3 = "sg_3";
		 	sgCode4 = "sg_4";
		 	
		 	int result = 0;
		 	String msg ="";
		 	String goUrl="";
		 	SeatGradeDTO DTO = new SeatGradeDTO();

		 	DTO.setM_code(m_code);
		 	
		 	
		 	DTO.setSg_code(sgCode1);
		 	DTO.setSp_price(spPrice1);
		 	result+= partnerDao.insertSeatPrice(DTO);
		 	DTO.setSg_code(sgCode2);
		 	DTO.setSp_price(spPrice2);

		 	result+= partnerDao.insertSeatPrice(DTO);
		 	DTO.setSg_code(sgCode3);
		 	DTO.setSp_price(spPrice3);
		 	result+= partnerDao.insertSeatPrice(DTO);
		 	
		 	DTO.setSg_code(sgCode4);
		 	DTO.setSp_price(spPrice4);
		 	result+= partnerDao.insertSeatPrice(DTO);
		 	System.out.println(result+"insert값");
		 	if(result==4) {
		 		msg="좌석 등급별 가격 설정 완료";
		 		goUrl = mainUrl;
		 	}else {
		 		msg="가격 등록 오류";
		 		goUrl = "musicalSeatAddForm.do";
		 	}
		 
		 
		 	ModelAndView mav =new ModelAndView();

			mav.addObject("msg", msg);
			mav.addObject("goUrl", goUrl);
			mav.setViewName("/member/memberMsg");
			return mav;
	 }
}