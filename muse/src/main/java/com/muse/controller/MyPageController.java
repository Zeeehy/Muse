package com.muse.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.muse.myPage.model.MPassDAO;
import com.muse.myPage.model.MPassDTO;
import com.muse.myPage.model.MuseCalendarDAO;
import com.muse.myPage.model.MuseCalendarDTO;
import com.muse.myPage.model.MuseCastDAO;
import com.muse.myPage.model.MyBookingDetailDAO;
import com.muse.myPage.model.MyBookingDetailDTO;
import com.muse.myPage.model.MyBookingListDAO;
import com.muse.myPage.model.MyBookingListDTO;
import com.muse.myPage.model.MyLikeActorDTO;
import com.muse.myPage.model.MyLikeMusicalDTO;
import com.muse.myPage.model.MyPageUserDAO;
import com.muse.myPage.model.MyPageUserDTO;
import com.muse.partner.model.ActorDTO;
import com.muse.partner.model.MusicalDTO;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageUserDAO myPageUserDao;
	@Autowired
	private MuseCalendarDAO museCalendarDao;
	@Autowired
	private MyBookingListDAO myBookingListDao;
	@Autowired
	private MPassDAO mPassDao;
	@Autowired
	private MuseCastDAO museCastDao;
	@Autowired
	private MyBookingDetailDAO mybookingDetailDao;

	
	/**메인페이지*/	
	//메인페이지 폼
	@RequestMapping("/myPageMain.do")
	public ModelAndView myPageMainForm() {
		ModelAndView mav=new ModelAndView();
		
		List<MyBookingListDTO> bookingList = myBookingListDao.getBookingList("test");	// 수정예정
		MPassDTO myMPass = mPassDao.getMPass("test");
		int mpRemainDays= mPassDao.getMPassRemainDays("test");
		mav.addObject("mpRemainDays",mpRemainDays);
		mav.addObject("bookingList",bookingList);
		mav.addObject("myMPass",myMPass);
		mav.setViewName("/myPage/myPageMain");
		return mav;
	}
	
	
	/**회원정보수정*/
	//회원정보수정 폼
	@RequestMapping("/myPageInfoUpdate.do")
	public ModelAndView myPageInfoUpdateForm() {
		ModelAndView mav=new ModelAndView();
		
		MyPageUserDTO dto = myPageUserDao.getUserInfo("test");
		
		mav.addObject("user", dto);
		mav.setViewName("/myPage/myPageInfoUpdate");
		return mav;
	}
	
	//회원정보수정
	@RequestMapping(value = "/myPageInfoUpdate.do", method=RequestMethod.POST)
	public ModelAndView myPageInfoUpdate(MyPageUserDTO dto) {
		ModelAndView mav=new ModelAndView();
		
		int result=myPageUserDao.updateUserInfo(dto);
		String msg=result>0?"회원정보수정 성공":"회원정보수정 실패";
		System.out.println(msg);
		mav.setViewName("/myPage/myPageMain");
		return mav;
	}
	
	
	/**비밀번호수정*/
	//비밀번호수정 폼
	@RequestMapping("/myPagePwdUpdate.do")
	public String myPagePwdUpdateForm() {

		return "/myPage/myPagePwdUpdate";
	}
	
	////비밀번호수정
	@RequestMapping(value = "/myPagePwdUpdate.do", method=RequestMethod.POST)
	public ModelAndView myPagePwdUpdate(MyPageUserDTO dto) {
		ModelAndView mav=new ModelAndView();
		
		int result=myPageUserDao.updateUserPwd(dto);
		String msg=result>0?"비밀번호수정 성공":"비밀번호수정 실패";
		System.out.println(msg);
		mav.setViewName("/myPage/myPageMain");
		return mav;
	}
	
	
	/**예매내역*/
	//예매내역 폼
	@RequestMapping("/myPageBooking.do")
	public ModelAndView myPageBookingForm() {
		ModelAndView mav=new ModelAndView();
		
		List<MyBookingListDTO> bookingList = myBookingListDao.getBookingList("test");	// 수정예정
		mav.addObject("bookingList",bookingList);
		
		mav.setViewName("/myPage/myPageBooking");
		return mav;
	}	
	
	//예매내역 기간별 검색(일)
	@RequestMapping("/myPageBookingDayList.do")
	@ResponseBody
	public String myPageBookingDayList(@RequestParam("booking_day") String bookingDay) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_id", "test");
		params.put("bookingDay", bookingDay);
		List<MyBookingListDTO> bookingList = myBookingListDao.getBookingDay(params);

	    StringBuilder responseHtml = new StringBuilder();
	    responseHtml.append("<thead><tr><th>예약일</th><th>예약번호</th><th>공연명</th><th>관람일</th><th>매수</th><th>취소가능일</th><th>상태</th></tr></thead>");
	    for (MyBookingListDTO booking : bookingList) {
	        responseHtml.append("<tr>")
	                    .append("<td>").append(booking.getB_date()).append("</td>")
	                    .append("<td>").append(booking.getB_code()).append("</td>")
	                    .append("<td>").append(booking.getM_title()).append("</td>")
	                    .append("<td>").append(booking.getMo_date()).append(" | ").append(booking.getMo_time()).append("</td>")
	                    .append("<td>").append(booking.getB_count()).append("</td>")
	                    .append("<td>").append(booking.getB_date()).append("</td>")
	                    .append("<td>").append(booking.getB_state()).append("</td>")
	                    .append("</tr>");
	    }
	    System.out.println(responseHtml.toString());
	    return responseHtml.toString();
	}
	
	//예매내역 기간별 검색(월)
	@RequestMapping("/myPageBookingMonthList.do")
	@ResponseBody
	public String myPageBookingMonthList(@RequestParam("booking_month") String bookingMonth) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_id", "test");
		params.put("bookingMonth", bookingMonth);
		List<MyBookingListDTO> bookingList = myBookingListDao.getBookingMonth(params);
	    
	    StringBuilder responseHtml = new StringBuilder();
	    responseHtml.append("<thead><tr><th>예약일</th><th>예약번호</th><th>공연명</th><th>관람일</th><th>매수</th><th>취소가능일</th><th>상태</th></tr></thead>");
	    for (MyBookingListDTO booking : bookingList) {
	        responseHtml.append("<tr>")
	                    .append("<td>").append(booking.getB_date()).append("</td>")
	                    .append("<td>").append(booking.getB_code()).append("</td>")
	                    .append("<td>").append(booking.getM_title()).append("</td>")
	                    .append("<td>").append(booking.getMo_date()).append(" | ").append(booking.getMo_time()).append("</td>")
	                    .append("<td>").append(booking.getB_count()).append("</td>")
	                    .append("<td>").append(booking.getB_date()).append("</td>")
	                    .append("<td>").append(booking.getB_state()).append("</td>")
	                    .append("</tr>");
	    }
	    return responseHtml.toString();
	}
	
	//예매내역 주문일자별 검색(예매일)
		@RequestMapping("/myPageBookingReserveList.do")
		@ResponseBody
		public String myPageBookingReserveList(@RequestParam("booking_date") String bookingDate) {
			Map<String, Object> params = new HashMap<>();
			params.put("u_id", "test");
			params.put("bookingDate", bookingDate);
			List<MyBookingListDTO> bookingList = myBookingListDao.getBookingReserve(params);
		    
		    StringBuilder responseHtml = new StringBuilder();
		    responseHtml.append("<thead><tr><th>예약일</th><th>예약번호</th><th>공연명</th><th>관람일</th><th>매수</th><th>취소가능일</th><th>상태</th></tr></thead>");
		    for (MyBookingListDTO booking : bookingList) {
		        responseHtml.append("<tr>")
		                    .append("<td>").append(booking.getB_date()).append("</td>")
		                    .append("<td>").append(booking.getB_code()).append("</td>")
		                    .append("<td>").append(booking.getM_title()).append("</td>")
		                    .append("<td>").append(booking.getMo_date()).append(" | ").append(booking.getMo_time()).append("</td>")
		                    .append("<td>").append(booking.getB_count()).append("</td>")
		                    .append("<td>").append(booking.getB_date()).append("</td>")
		                    .append("<td>").append(booking.getB_state()).append("</td>")
		                    .append("</tr>");
		    }
		    return responseHtml.toString();
		}
		
		//예매내역 주문일자별 검색(공연일)
		@RequestMapping("/myPageBookingPerformList.do")
		@ResponseBody
		public String myPageBookingPerformList(@RequestParam("booking_date") String bookingDate) {
			Map<String, Object> params = new HashMap<>();
			params.put("u_id", "test");
			params.put("bookingDate", bookingDate);
			List<MyBookingListDTO> bookingList = myBookingListDao.getBookingPerform(params);
		    
		    StringBuilder responseHtml = new StringBuilder();
		    responseHtml.append("<thead><tr><th>예약일</th><th>예약번호</th><th>공연명</th><th>관람일</th><th>매수</th><th>취소가능일</th><th>상태</th></tr></thead>");
		    for (MyBookingListDTO booking : bookingList) {
		        responseHtml.append("<tr>")
		                    .append("<td>").append(booking.getB_date()).append("</td>")
		                    .append("<td>").append(booking.getB_code()).append("</td>")
		                    .append("<td>").append(booking.getM_title()).append("</td>")
		                    .append("<td>").append(booking.getMo_date()).append(" | ").append(booking.getMo_time()).append("</td>")
		                    .append("<td>").append(booking.getB_count()).append("</td>")
		                    .append("<td>").append(booking.getB_date()).append("</td>")
		                    .append("<td>").append(booking.getB_state()).append("</td>")
		                    .append("</tr>");
		    }
		    return responseHtml.toString();
		}
	
	/**마이페이지 예매상세*/
	//예매상세 폼
	@RequestMapping("/myPageBookingDetail.do")
	public ModelAndView myPageBookingDetailForm() {
		ModelAndView mav=new ModelAndView();
		
		List<MyBookingDetailDTO> bookingDetailList=mybookingDetailDao.getLikeBookingDetailList("b_1");	//test와 마찬가지로 바꿔야함
		
		mav.addObject("bookingDetailList",bookingDetailList);
		mav.setViewName("/myPage/myPageBookingDetail");
		return mav;
	}		
	
	/**마이페이지 뮤즈캐스트*/
	//뮤즈캐스트 폼
	@RequestMapping("/myPageMuseCast.do")
	public ModelAndView myPageMuseCastForm() {
		ModelAndView mav=new ModelAndView();
		int likeActorCount=museCastDao.getLikeActorCount("test");
		int likeMusicalCount=museCastDao.getLikeMusicalCount("test");
		List<MyLikeActorDTO> likeActorList=museCastDao.getLikeActorList("test");
		List<MyLikeMusicalDTO> likeMusicalList=museCastDao.getLikeMusicalList("test");
		
		mav.addObject("likeActorList",likeActorList);
		mav.addObject("likeMusicalList",likeMusicalList);
		mav.addObject("likeActorCount",likeActorCount);
		mav.addObject("likeMusicalCount",likeMusicalCount);
		mav.setViewName("/myPage/myPageMuseCast");
		return mav;
	}
	
	//뮤즈캐스팅 폼
	@RequestMapping("/museCasting.do")
	public ModelAndView museCastingForm() {
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("/myPage/museCasting");
		return mav;
	}
	
	//뮤즈캐스트 배우 검색(나중에 이미 등록된배우 안나오게 해야됨, 페이징처리도 해야됨, 일단 6명만 출력)
	@RequestMapping("/museCastingSearchActor.do")
	@ResponseBody
	public String museCastingSearchActor(@RequestParam("search_cast") String searchActor) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_id", "test");
		params.put("searchActor", searchActor+"%");
		List<ActorDTO> searchActorList = museCastDao.getSearchActor(params);
	    
	    StringBuilder responseHtml = new StringBuilder();
	    for (ActorDTO actor : searchActorList) {
	        responseHtml.append("<div class='item'>"
	        		+ "<input type='checkbox' name='actorCheck' id='"+actor.getMa_code()+"'>"
	        		+ "<img src='/muse/resources/img/actor/"+actor.getma_img()+"' alt='Actor Image'>"
	        		+ "<div class='item-info'>"
	        		+ "<h3>"+actor.getMa_name()+"</h3>"
	        		+ "<p>뮤지컬배우</p>"
	        		+ "<p>생년월일:"+actor.getMa_birth()+"</p>"
	        		+ "</div>"
	        		+ "</div>");
	    }
	    return responseHtml.toString();
	}
	
	//뮤즈캐스트 공연 검색(나중에 이미 등록된공연 안나오게 해야됨, 페이징처리도 해야됨, 일단 6명만 출력)
	@RequestMapping("/museCastingSearchMusical.do")
	@ResponseBody
	public String museCastingSearchMusical(@RequestParam("search_cast") String searchMusical) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_id", "test");
		params.put("searchMusical", "%"+searchMusical+"%");
		
		List<MusicalDTO> searchMusicalList = museCastDao.getSearchMusical(params);
	    StringBuilder responseHtml = new StringBuilder();
	    for (MusicalDTO musical : searchMusicalList) {
	        responseHtml.append("<div class='item'>"
	        		+ "<input type='checkbox' name='musicalCheck' id='"+musical.getM_code()+"'>"
	        		+ "<img src='/muse/resources/img/musical/"+musical.getM_poster()+"' alt='Musical Image'>"
	        		+ "<div class='item-info'>"
	        		+ "<h3>"+musical.getM_title() +"</h3>"
	        		+ "<p>관람연령: "+musical.getM_age()+"</p>"
	        		+ "<p>"+musical.getM_openDate()+"~"+musical.getM_endDate()+"</p>"
	        		+ "</div>"
	        		+ "</div>");
	    }
	    System.out.println(responseHtml.toString());
	    return responseHtml.toString();
	}
	
	//뮤즈캐스트 관심배우 추가
	 @RequestMapping(value = "/insertLikeActor.do", method = RequestMethod.POST)
	    public ResponseEntity<String> insertLikeActor(HttpServletRequest request) {
	        try {
	            StringBuilder json = new StringBuilder();
	            BufferedReader reader = request.getReader();
	            String line;
	            while ((line = reader.readLine()) != null) {
	                json.append(line);
	            }

	            ObjectMapper objectMapper = new ObjectMapper();
	            Map<String, Object> requestData = objectMapper.readValue(json.toString(),
	                    new TypeReference<Map<String, Object>>() {});
	            
	            List<String> maCodes = (List<String>) requestData.get("insertLikeActorList");
	            String u_id = (String)requestData.get("user_id");
	            
	            Map<String, Object> params = new HashMap<>();
	            for (String ma_code : maCodes) {
		    		params.put("u_id", u_id);
		    		params.put("ma_code", ma_code);
	            	if(museCastDao.insertLikeActorList(params)<=0) {
	            		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(ma_code+"관심배우 추가 실패");
	            	}
	            }
	            
	            

	            return ResponseEntity.ok("관심배우 추가 성공");
	        } catch (IOException e) {
	            e.printStackTrace();
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("관심배우 추가 실패");
	        }
	    }
	 
	//뮤즈캐스트 관심배우 삭제
	@RequestMapping(value = "/deleteLikeActor.do", method = RequestMethod.POST)
	public ResponseEntity<String> deleteLikeActor(HttpServletRequest request) {
	    try {
	        StringBuilder json = new StringBuilder();
	        BufferedReader reader = request.getReader();
	        String line;
	        while ((line = reader.readLine()) != null) {
	            json.append(line);
	        }
	
	        ObjectMapper objectMapper = new ObjectMapper();
	        Map<String, Object> requestData = objectMapper.readValue(json.toString(),
	                new TypeReference<Map<String, Object>>() {});
	        
	        List<String> laCodes = (List<String>) requestData.get("deleteLikeActorList");
	        String u_id = (String)requestData.get("user_id");
	        
	        Map<String, Object> params = new HashMap<>();
	        for (String la_code : laCodes) {
	    		params.put("u_id", u_id);
	    		params.put("la_code", la_code);
	        	if(museCastDao.deleteLikeActorList(params)<=0) {
	        		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(la_code+"관심배우 삭제 실패");
	        	}
	        }
	        
	        
	
	        return ResponseEntity.ok("관심삭제 추가 성공");
	    } catch (IOException e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("관심배우 추가 실패");
	    }
	}
	
	
	//뮤즈캐스트 관심공연 추가
	 @RequestMapping(value = "/insertLikeMusical.do", method = RequestMethod.POST)
	    public ResponseEntity<String> insertLikeMusical(HttpServletRequest request) {
	        try {
	            StringBuilder json = new StringBuilder();
	            BufferedReader reader = request.getReader();
	            String line;
	            while ((line = reader.readLine()) != null) {
	                json.append(line);
	            }

	            ObjectMapper objectMapper = new ObjectMapper();
	            Map<String, Object> requestData = objectMapper.readValue(json.toString(),new TypeReference<Map<String, Object>>() {});
	            
	            List<String> mCodes = (List<String>) requestData.get("insertLikeMusicalList");
	            String u_id = (String)requestData.get("user_id");
	            
	            Map<String, Object> params = new HashMap<>();
	            for (String m_code : mCodes) {
		    		params.put("u_id", u_id);
		    		params.put("m_code", m_code);
	            	if(museCastDao.insertLikeMusicalList(params)<=0) {
	            		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(m_code+"관심공연 추가 실패");
	            	}
	            }
	            
	            

	            return ResponseEntity.ok("관심공연 추가 성공");
	        } catch (IOException e) {
	            e.printStackTrace();
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("관심공연 추가 실패");
	        }
	    }
	
	//뮤즈캐스트 관심공연 삭제
		@RequestMapping(value = "/deleteLikeMusical.do", method = RequestMethod.POST)
		public ResponseEntity<String> deleteLikeMusical(HttpServletRequest request) {
		    try {
		        StringBuilder json = new StringBuilder();
		        BufferedReader reader = request.getReader();
		        String line;
		        while ((line = reader.readLine()) != null) {
		            json.append(line);
		        }
		
		        ObjectMapper objectMapper = new ObjectMapper();
		        Map<String, Object> requestData = objectMapper.readValue(json.toString(),
		                new TypeReference<Map<String, Object>>() {});
		        
		        List<String> lmCodes = (List<String>) requestData.get("deleteLikeMusicalList");
		        String u_id = (String)requestData.get("user_id");
		        
		        Map<String, Object> params = new HashMap<>();
		        for (String lm_code : lmCodes) {
		    		params.put("u_id", u_id);
		    		params.put("lm_code", lm_code);
		        	if(museCastDao.deleteLikeMusicalList(params)<=0) {
		        		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(lm_code+"관심공연 삭제 실패");
		        	}
		        }
		        
		        
		
		        return ResponseEntity.ok("관심삭제 추가 성공");
		    } catch (IOException e) {
		        e.printStackTrace();
		        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("관심배우 추가 실패");
		    }
		}

	/**마이페이지 뮤즈패스*/
	//뮤즈패스 폼
	@RequestMapping("/myPageMusePass.do")
	public ModelAndView myPageMusePassForm() {
		ModelAndView mav=new ModelAndView();
		MPassDTO myMPass = mPassDao.getMPass("test");
		int mpRemainDays= mPassDao.getMPassRemainDays("test");
		mav.addObject("mpRemainDays",mpRemainDays);
		mav.addObject("myMPass",myMPass);
		mav.setViewName("/myPage/myPageMusePass");
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
