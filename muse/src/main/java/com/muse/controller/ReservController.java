package com.muse.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.google.gson.Gson;
import com.muse.partner.model.MusicalDTO;
import com.muse.reserv.model.ReservDAO;
import com.muse.seat.model.SeatDTO;
import com.muse.seat.model.SeatLayoutDAO;
import com.muse.seat.model.SeatLayoutDAOImple;
import com.muse.seat.model.SeatLayoutDTO;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.time.DayOfWeek;
import java.time.LocalDate;


@Controller
public class ReservController {
	
	@Autowired
	private ReservDAO reservDAO;
	@Autowired
	private SeatLayoutDAO seatLayoutDAO;
	
	@RequestMapping("/reservMain.do")
	public ModelAndView RerservMainForm(@RequestParam(value = "mh_code") String mh_code,
	                                    @RequestParam(value = "m_code", required = false) String m_code,
	                                    @RequestParam(value = "sl_bind", required = false, defaultValue = "1") int sl_bind,
										@RequestParam(value = "selectedDate", required = false) String selectedDate,
									    @RequestParam(value = "selectedTime", required = false) String selectedTime) {

	    ModelAndView mav = new ModelAndView();
	    mav.addObject("mh_code", mh_code);
	    mav.addObject("m_code", m_code);
	    
	    // 뮤지컬 기본정보 조회
	    Map<String,Object> musicalInfo = reservDAO.getMusicalInfo(m_code);

	    // 초기화
	    List<String> playDate = new ArrayList<>();
	    int maxTickets = 0;
	    List<Map<String, Object>> musicalPrice = new ArrayList<>();  // price 리스트 초기화
	    
	    // 선택된 날짜에 요일 추가
	    String dateWithDay  = null;
	    if(selectedDate != null) {
	        try {
	            LocalDate date = LocalDate.parse(selectedDate.substring(0, 10));
	            DayOfWeek dayOfWeek = date.getDayOfWeek();
	            String koreanDayOfWeek = "(" + plusWeek(dayOfWeek) + ")";
	            dateWithDay = selectedDate + " " + koreanDayOfWeek;
	            selectedDate = dateWithDay; // selectedDate를 요일이 포함된 형식으로 업데이트
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	    }
	    

	    if (m_code != null) {  
	        playDate = reservDAO.getMusicalDate(m_code); 
	        maxTickets = reservDAO.getMusicalMaxTicket(m_code); 
	        musicalPrice = reservDAO.getMusicalPrice(m_code); 
	        System.out.println("가격 리스트: " + musicalPrice);  
	    }

	    mav.setViewName("reservation/reservMain");
	    mav.addObject("musicalInfo", musicalInfo);
	    mav.addObject("playDate", playDate);
	    mav.addObject("maxTickets", maxTickets);
	    mav.addObject("selectedDate", selectedDate);
	    mav.addObject("selectedTime", selectedTime);

	    // 선택된 날짜와 시간이 있다면 다시 설정
	    if(selectedDate != null) {
	        mav.addObject("selectedDate", selectedDate);
	    }
	    if(selectedTime != null) {
	        mav.addObject("selectedTime", selectedTime);
	    }
	    
	    String jmusicalPrice = new Gson().toJson(musicalPrice);
	    //System.out.println(musicalPrice.toString());
	    
	    mav.addObject("musicalPrice", musicalPrice);
	    //System.out.println("ModelAndView에 담긴 가격 정보: " + mav.getModel().get("musicalPrice"));

	    // 뮤지컬 좌석 조회
	    int mhl_code = reservDAO.getMhl_code(mh_code);

	    HashMap<String, String> map = ReservSeatForm(sl_bind, mhl_code, m_code);
	    for (Map.Entry<String, String> entry : map.entrySet()) {
	        mav.addObject(entry.getKey(), entry.getValue());
	    }

	    return mav;
	}
	
	// 요일 변환
	private String plusWeek(DayOfWeek dayOfWeek) {
	    switch (dayOfWeek) {
	        case MONDAY: return "월";
	        case TUESDAY: return "화";
	        case WEDNESDAY: return "수";
	        case THURSDAY: return "목";
	        case FRIDAY: return "금";
	        case SATURDAY: return "토";
	        case SUNDAY: return "일";
	        default: return "";
	    }
	}
	
	@RequestMapping(value = "/reservSale.do", method = RequestMethod.POST)
	public ModelAndView reservSale(
	        @RequestParam String mh_code,
	        @RequestParam String m_code,
	        @RequestParam String selectedDate,
	        @RequestParam String selectedTime,
	        @RequestParam String selectedSeats,
	        @RequestParam(required = false) String jcancleDeadline

			) {
	    ModelAndView mav = new ModelAndView();
	    

	    try {

	        ObjectMapper objectMapper = new ObjectMapper();
	        TypeFactory typeFactory = objectMapper.getTypeFactory();
	        List<Map<String, Object>> seatList = objectMapper.readValue(
	                selectedSeats, typeFactory.constructCollectionType(List.class, Map.class));
	        
	        // 뮤지컬 및 가격 정보 조회
	        Map<String, Object> musicalInfo = reservDAO.getMusicalInfo(m_code);
	        List<Map<String, Object>> musicalPrice = reservDAO.getMusicalPrice(m_code);
	        System.out.println("가격 리스트: " + musicalPrice);

	        // 좌석 목록에 가격 정보 추가
	        for(Map<String, Object> seat : seatList) {
	            String grade = (String)seat.get("grade");
	            for(Map<String, Object> price : musicalPrice) {
	                if(price.get("SG_NAME").equals(grade)) {
	                    seat.put("price", price.get("SP_PRICE"));
	                    break;
	                }
	            }
	        }

	        mav.addObject("mh_code", mh_code);
	        mav.addObject("m_code", m_code);
	        mav.addObject("selectedDate", selectedDate);
	        mav.addObject("selectedTime", selectedTime);
	        mav.addObject("selectedSeats", seatList);
	        mav.addObject("seatCount", seatList.size());
	        mav.addObject("musicalInfo", musicalInfo);
	        mav.addObject("musicalPrice", musicalPrice);
	        mav.addObject("jsonSeats", selectedSeats);
            mav.addObject("jcancelDeadline", jcancleDeadline);
            if (jcancleDeadline != null) {
                System.out.println("취소기한: " + jcancleDeadline);
            }
	        mav.setViewName("reservation/reservSale");
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        mav.setViewName("redirect:/reservMain.do?mh_code=" + mh_code + "&m_code=" + m_code);
	    }
	    return mav;
	}

	
	@RequestMapping(value = "/reservCheck.do", method = RequestMethod.POST)
	public ModelAndView ReservCheckForm(
	        @RequestParam(value = "mh_code" , required = false) String mh_code,
	        @RequestParam(value = "m_code", required = false) String m_code,
	        @RequestParam(value = "selectedDate", required = false) String selectedDate,
	        @RequestParam(value = "selectedTime", required = false) String selectedTime,
	        @RequestParam(value = "selectedSeats", required = false) String selectedSeats ,
	        @RequestParam(value = "jcancelDeadline", required = false) String jcancelDeadline,
	        @RequestParam(value = "ticketPrice", required = false) String ticketPrice,
	        HttpSession session,
	        @RequestParam(value="normalTickets_VIP", defaultValue = "0") int d_0_VIP,
	        @RequestParam(value="normalTickets_R", defaultValue = "0") int d_0_R,
	        @RequestParam(value="normalTickets_S", defaultValue = "0") int d_0_S,
	        @RequestParam(value="normalTickets_A", defaultValue = "0") int d_0_A,
	        @RequestParam(value="veteranTickets_VIP", defaultValue = "0") int d_1_VIP,
	        @RequestParam(value="veteranTickets_R", defaultValue = "0") int d_1_R,
	        @RequestParam(value="veteranTickets_S", defaultValue = "0") int d_1_S,
	        @RequestParam(value="veteranTickets_A", defaultValue = "0") int d_1_A,
	        @RequestParam(value="disability13Tickets_VIP", defaultValue = "0") int d_2_VIP,
	        @RequestParam(value="disability13Tickets_R", defaultValue = "0") int d_2_R,
	        @RequestParam(value="disability13Tickets_S", defaultValue = "0") int d_2_S,
	        @RequestParam(value="disability13Tickets_A", defaultValue = "0") int d_2_A,
	        @RequestParam(value="disability46Tickets_VIP", defaultValue = "0") int d_3_VIP,
	        @RequestParam(value="disability46Tickets_R", defaultValue = "0") int d_3_R,
	        @RequestParam(value="disability46Tickets_S", defaultValue = "0") int d_3_S,
	        @RequestParam(value="disability46Tickets_A", defaultValue = "0") int d_3_A
	        ) {
	    
	    ModelAndView mav = new ModelAndView();
	    
	    HashMap<String, Integer> map = new HashMap<String, Integer>();
	    
	    map.put("d_0-VIP", d_0_VIP);
	    map.put("d_0-R", d_0_R);
	    map.put("d_0-S", d_0_S);
	    map.put("d_0-A", d_0_A);
	    
	    map.put("d_1-VIP", d_1_VIP);
	    map.put("d_1-R", d_1_R);
	    map.put("d_1-S", d_1_S);
	    map.put("d_1-A", d_1_A);
	    
	    map.put("d_2-VIP", d_2_VIP);
	    map.put("d_2-R", d_2_R);
	    map.put("d_2-S", d_2_S);
	    map.put("d_2-A", d_2_A);
	    
	    map.put("d_3-VIP", d_3_VIP);
	    map.put("d_3-R", d_3_R);
	    map.put("d_3-S", d_3_S);
	    map.put("d_3-A", d_3_A);
	    
	    StringBuilder discount = new StringBuilder();  // String 대신 StringBuilder 사용

	 // 방법 1: Iterator 사용
		 Iterator<Map.Entry<String, Integer>> it = map.entrySet().iterator();
		 while(it.hasNext()) {
		     Map.Entry<String, Integer> entry = it.next();
		     if(entry.getValue() == 0) {
		         it.remove();  // Iterator의 remove 메서드 사용
		     } else {
		         discount.append(entry.getKey()).append(":").append(entry.getValue());
		         discount.append(",");
		     }
		 }
		 
		 
		 System.out.println("######################################");
	    System.out.println(discount.toString());
		 System.out.println("######################################");
	    
	    try {
	    	System.out.println("reservCheckController");
	    	System.out.println(mh_code);
	    	System.out.println(m_code);
	    	System.out.println(selectedDate);
	    	System.out.println(selectedTime);
	        System.out.println("취소기한: " + jcancelDeadline); // 값 확인
	    
		
			selectedSeats = selectedSeats.replace("'", "\"") // 작은따옴표를 큰따옴표로
			.replaceAll("([{,])\\s*(\\w+):", "$1\"$2\":"); // 프로퍼티 이름에 따옴표 추가

	        // JSON 데이터를 Java 객체로 변환
	        ObjectMapper objectMapper = new ObjectMapper();
        
	        // JSON 문자열을 List<Map>으로 직접 변환
	        List<Map<String, Object>> seatList = objectMapper.readValue(
	                selectedSeats,
	                new TypeReference<List<Map<String, Object>>>() {}
	            );
    
	        // 뮤지컬 정보 및 가격 정보 조회
	    	Map<String, Object> musicalInfo = reservDAO.getMusicalInfo(m_code);
	        List<Map<String, Object>> musicalPrice = reservDAO.getMusicalPrice(m_code);
	        System.out.println("musicalInfo"+musicalInfo);
	        
	        // 세션에서 s_id 가져오기
	        String s_id = (String)session.getAttribute("s_id");
	        Map<String,Object> memberInfo = reservDAO.getMemberInfo(s_id);
	        System.out.println("memberInfo:"+memberInfo);
	        // s_id가 null이면 로그인 페이지로 리다이렉트
	        if (s_id == null) {
	            mav.setViewName("redirect:/memberLogin.do");
	            return mav;
	        }
	        
	        // ModelAndView에 데이터 추가
	        mav.addObject("mh_code", mh_code);
	        mav.addObject("m_code", m_code);
	        mav.addObject("selectedDate", selectedDate);
	        mav.addObject("selectedTime", selectedTime);
	        mav.addObject("selectedSeats", seatList);
	        mav.addObject("seatCount", seatList.size());
	        mav.addObject("musicalInfo", musicalInfo);
	        mav.addObject("musicalPrice", musicalPrice);
	        mav.addObject("jcancelDeadline", jcancelDeadline); 
	        mav.addObject("ticketPrice", ticketPrice);
	        mav.addObject("memberInfo",memberInfo);
	        mav.addObject("discount",discount.toString());
	        
	        mav.setViewName("reservation/reservCheck");
	        
	        
	        System.out.println("jsonSeats being sent: " + selectedSeats);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return mav;
	}

	
	@RequestMapping(value = "/reservCancle.do", method = RequestMethod.POST)
	public ModelAndView ReservCancleForm(
	       @RequestParam(value = "mh_code", required = false) String mh_code,
	       @RequestParam(value = "m_code", required = false) String m_code,
	       @RequestParam(value = "selectedDate", required = false) String selectedDate,
	       @RequestParam(value = "selectedTime", required = false) String selectedTime,
	       @RequestParam(value = "selectedSeats", required = false) String selectedSeats,
	       @RequestParam(value = "jcancelDeadline", required = false) String jcancelDeadline,
	       //@RequestParam(value = "cancelDeadline", required = false) String cancelDeadline,
	       @RequestParam(value = "ticketPrice", required = false) String ticketPrice,
	       @RequestParam(value = "totalPrice", required = false) String totalPrice,
	       @RequestParam(value = "discount", required = false) String discount,
	       HttpSession session) {
	   
	   ModelAndView mav = new ModelAndView();
	   
	   try {
	       // 로그 출력
	       System.out.println("===== ReservCancleForm 시작 =====");
	       System.out.println("Received parameters - ");
	       System.out.println("mh_code: " + mh_code);
	       System.out.println("m_code: " + m_code);
	       System.out.println("selectedDate: " + selectedDate);  
	       System.out.println("selectedTime: " + selectedTime);
	       System.out.println("jcancelDeadline: " + jcancelDeadline);
	       System.out.println("ticketPrice: " + ticketPrice);
	       System.out.println("totalPrice: " + totalPrice);
	       System.out.println("Received selectedSeats: " + selectedSeats);
	       
	       // 세션 체크
	       String s_id = (String)session.getAttribute("s_id");
	       if (s_id == null) {
	           System.out.println("세션 없음 - 로그인 페이지로 리다이렉트");
	           return new ModelAndView("redirect:/memberLogin.do");
	       }
	       
	       // 필수 파라미터 검증
	       if (StringUtils.isEmpty(mh_code) || StringUtils.isEmpty(m_code) || 
	           StringUtils.isEmpty(selectedDate) || StringUtils.isEmpty(selectedTime)) {
	           throw new IllegalArgumentException("Required parameters are missing");
	       }

	       // JSON 파싱
	       ObjectMapper objectMapper = new ObjectMapper();
	       List<Map<String, Object>> seatList = objectMapper.readValue(
	           selectedSeats,
	           new TypeReference<List<Map<String, Object>>>() {}
	       );
	       System.out.println("좌석 파싱 성공! 좌석 수: " + (seatList != null ? seatList.size() : 0));

	       Map<String, Object> musicalInfo = reservDAO.getMusicalInfo(m_code);
	       List<Map<String, Object>> musicalPrice = reservDAO.getMusicalPrice(m_code);
	       Map<String, Object> memberInfo = reservDAO.getMemberInfo(s_id);
	       
	       mav.addObject("mh_code", mh_code);
	       mav.addObject("m_code", m_code);
	       mav.addObject("selectedDate", selectedDate);
	       mav.addObject("selectedTime", selectedTime);
	       mav.addObject("selectedSeats", seatList);
	       mav.addObject("musicalInfo", musicalInfo);
	       mav.addObject("musicalPrice", musicalPrice);
	       mav.addObject("jcancelDeadline", jcancelDeadline);	       
	       mav.addObject("ticketPrice", ticketPrice);
	       mav.addObject("totalPrice", totalPrice);
	       mav.addObject("memberInfo", memberInfo);
	       mav.addObject("discount", discount);
	       mav.addObject("seatCount", seatList != null ? seatList.size() : 0);
	       
	       mav.setViewName("reservation/reservCancle");
	       
	   } catch (Exception e) {
	       System.out.println("에러 메시지: " + e.getMessage());
	       e.printStackTrace();
	       mav.setViewName("reservation/reservCancle");
	       mav.addObject("errorMessage", "예매 진행 중 오류가 발생했습니다.");
	   }

	   return mav;
	}
	
	@RequestMapping("/reservPay.do")
	public ModelAndView ReservPayForm(
		   @RequestParam(value = "price") int price,
		   @RequestParam(value = "s_id") String s_id,
		   @RequestParam(value = "m_title") String m_title
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reservation/reservPay");
		mav.addObject("price",price);
		mav.addObject("s_id",s_id);
		mav.addObject("m_title", m_title);
		
		return mav;
		
	}
	
	
	@RequestMapping("/reservSuccess.do")
	public ModelAndView ReservSuccesForm(
	        @RequestParam(value = "m_code") String m_code,
	        @RequestParam(value = "selectedSeats") String selectedSeats,
	        @RequestParam(value = "ticketPrice") String ticketPrice,
	        @RequestParam(value = "totalPrice") String totalPrice,
	        @RequestParam(value = "discount") String discount,
	        @RequestParam(value = "s_id") String s_id,
		    @RequestParam(value = "jcancelDeadline", required = false) String jcancelDeadline,
	        @RequestParam(value = "selectedDate", required = false) String selectedDate,
	        @RequestParam(value = "selectedTime", required = false) String selectedTime,
	        @RequestParam(value = "usePoint", required = false) Integer usePoint  // 포인트 사용 정보 추가
	        ) {
	    
	    ModelAndView mav = new ModelAndView();
	    Map<String, Integer> discountMap = new HashMap<>();
	    System.out.println("== 전달받은 selectedSeats ==");
	    System.out.println(selectedSeats);
	    
	    // 할인 정보 파싱
	    String[] pairs = discount.split(",");
	    for(String pair : pairs) {
	        String[] keyValue = pair.trim().split(":");
	        discountMap.put(keyValue[0], Integer.parseInt(keyValue[1]));
	    }
	    
	    // 공연 옵션 코드 조회를 위한 파라미터 설정
	    Map<String, Object> params = new HashMap<String, Object>();
	    String dateOnly = selectedDate.split(" ")[0];
	    params.put("m_code", m_code);
	    params.put("mo_date", dateOnly);
	    params.put("mo_time", selectedTime);
	    
	    // 공연 옵션 코드 조회
	    String mo_code = reservDAO.getOptionCode(params);
	    
	    // 공연 정보 조회
    	Map<String, Object> musicalInfo = reservDAO.getMusicalInfo(m_code);
	    
	    // 회원 정보 조회
	    Map<String, Object> memberInfo = reservDAO.getMemberInfo(s_id);
	    
	    // 할인 정보 정리
	    Map<String, Map<String, Integer>> rootMap = new HashMap<String, Map<String, Integer>>();
	    
        // 등급을 담는 맵
	    List<Map<String,Object>> temp = reservDAO.getMusicalPrice(m_code);
	    Map<String,Object> gradePrice = new HashMap<String, Object>(); 
	    		
	    for(int i=0; i<temp.size(); i++) {
	        String gradeName = (String)temp.get(i).get("SG_NAME");  // 등급명
	        BigDecimal price = (BigDecimal)temp.get(i).get("SP_PRICE"); // 가격
	        
	        gradePrice.put(gradeName, price);
	    }

	    
	    Iterator<String> disir = discountMap.keySet().iterator();
	    while(disir.hasNext()) {
	        String key = disir.next();
	        String[] parts = key.split("-");
	        String grade = parts[1];
	        
	        if(!rootMap.containsKey(grade)) {
	            rootMap.put(grade, new HashMap<String,Integer>());
	        }
	        String discountType = parts[0];
	        rootMap.get(grade).put(discountType, discountMap.get(key));
	    }
	    
	    try {
	        // 예매 정보 저장
	        Map<String,Object> bookingData = new HashMap<>();
	        bookingData.put("u_id", s_id);
	        bookingData.put("mo_code", mo_code);
	        bookingData.put("b_total_price", totalPrice);
	        
	        // 좌석 정보 파싱
	        ObjectMapper objectMapper = new ObjectMapper();
	        List<Map<String, Object>> seatList = objectMapper.readValue(
	            selectedSeats,
	            new TypeReference<List<Map<String, Object>>>() {}
	        );
	        bookingData.put("b_count", seatList.size());
	        bookingData.put("b_state", 1);
	        
	        System.out.println("== 파싱된 좌석정보 ==");
		    System.out.println("총 좌석 수"+seatList.size());
	        
	        // 예매 정보 삽입 및 예매 코드 받기
	        String b_code = reservDAO.insertBooking(bookingData);
	        
	        // 포인트 사용처리
	        if(usePoint != null && usePoint > 0) {
	        	Map<String,Object> pointInfo = new HashMap<>();
	            System.out.println("s_id 값: " + s_id); 
	        	pointInfo.put("u_id", s_id);
	        	pointInfo.put("pt_category", 1);
	        	pointInfo.put("pt_categorycode", b_code);
	        	pointInfo.put("pt_point", -usePoint);
	        	
	        	Map<String, Object> result = reservDAO.insertUsePoint(pointInfo);
	        }  
	        
	        // 각 좌석별 상세 정보 저장
	        for(int i=0; i<seatList.size(); i++) {
	            Map<String, Object> detailData = new HashMap<String, Object>();
	            Map<String,Object> sMap = new HashMap<String, Object>();
	            
	            // 좌석 정보 설정
	            sMap.put("s_floor", seatList.get(i).get("floor"));
	            sMap.put("s_section", seatList.get(i).get("section"));
	            sMap.put("s_row", seatList.get(i).get("row"));
	            sMap.put("s_position", seatList.get(i).get("number"));
	            sMap.put("m_code", m_code);
	            
	            // 좌석 코드 조회
	            int s_code = reservDAO.getSeatCodeForReserv(sMap);
	            String grade = (String) seatList.get(i).get("grade");
	            
	            // 예매 상세 정보 설정
	            detailData.put("b_code", b_code);
	            detailData.put("s_code", s_code);
//	            detailData.put("ticket_price", ticketPrice);
	            
	            // 할인 정보 설정
	            Map<String, Integer> gradeDiscounts = rootMap.get(grade);
	            if (gradeDiscounts != null) {
	                gradeDiscounts.forEach((key, value) -> {
	                    if(value > 0) {
	                        detailData.put("d_code", key);
	                        
	                        if(!((String)key).equals("d_0")) {
	                        	System.out.println("111");
	                            double b = ((BigDecimal)gradePrice.get(grade)).doubleValue() / 2.0;
		                        detailData.put("ticket_price",b);
	                        } else {
		                        detailData.put("ticket_price",gradePrice.get(grade));
	                        }
	                    }
	                });
	            }
	            // 예매 상세 정보 저장
	            reservDAO.insertBookingDetail(detailData);
	        }
	        
	        // JSP에 전달할 데이터 설정
	        mav.addObject("seatList", seatList);
	        System.out.println("=== ModelAndView에 추가된 좌석 리스트 ===");
	        System.out.println("좌석 리스트: " + seatList);
	        mav.addObject("musicalInfo", musicalInfo);
	        mav.addObject("memberInfo", memberInfo);
	        mav.addObject("selectedDate", selectedDate);
	        mav.addObject("selectedTime", selectedTime);
	        mav.addObject("ticketPrice", ticketPrice);
	        mav.addObject("totalPrice", totalPrice);
	        mav.addObject("jcancelDeadline", jcancelDeadline);
	        mav.addObject("usePoint", usePoint);
	        mav.addObject("bookingNumber", b_code);  // 예매번호 추가
	        mav.addObject("discount", discountMap);   // 할인 정보 추가
	        
	        // 뷰 설정
	        mav.setViewName("reservation/reservSuccess");
	        
	    } catch(Exception e) {
	        e.printStackTrace();
	        mav.setViewName("reservation/reservError");  // 에러 페이지로 변경
	        mav.addObject("errorMessage", "예매 처리 중 오류가 발생했습니다.");
	    }
	    
	    return mav;
	}

	
	// 좌석 조회
	public HashMap<String, String> ReservSeatForm(int sl_bind, int mhl_code,String m_code) {
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			List<SeatLayoutDTO> layout = reservDAO.seatLayoutSelect(sl_bind, mhl_code);
			List<String> section = reservDAO.sectionSelect(sl_bind, mhl_code);
			List<Integer> floor = reservDAO.bindByallFloorSelect(sl_bind, mhl_code);
			Map<Integer,Integer> max_rowMap= reservDAO.max_rowSelect(mhl_code); 
			
			List<SeatDTO> seatList = reservDAO.getRealSeat(m_code);
			
			String jsonLayout = new Gson().toJson(layout);
			String jsonSection =  new Gson().toJson(section); 
			String jsonFloor = new Gson().toJson(floor);
			String jsonMax_rowMap = new Gson().toJson(max_rowMap);
			String jseatList =  new Gson().toJson(seatList);
			
			map.put("layouts",jsonLayout);
			map.put("section",jsonSection);
			map.put("floor",jsonFloor);
			map.put("max_rowMap",jsonMax_rowMap);
			map.put("seatList",jseatList);
					
			return map;
		}

	
	@RequestMapping("/searchTime.do")
	public ModelAndView searchTime(@RequestParam String selectedDate, String m_code) {
	   try {
	       String formattedDate = selectedDate;
	       String dayOfWeek = "";
	       
	       // 날짜 형식에 공백이 있는 경우에만 분리 작업 수행
	       if(selectedDate.contains(" ")) {
	           String[] dateParts = selectedDate.split(" ");
	           formattedDate = dateParts[0];  // 날짜 부분
	           if(dateParts.length > 1) {
	               dayOfWeek = dateParts[1].replace("(", "").replace(")", ""); // 요일 부분
	           }
	       }

	       List<String> playTime = reservDAO.getMusicalTimeByDate(formattedDate, m_code);

	       ModelAndView mav = new ModelAndView();
	       mav.setViewName("goJson");
	       mav.addObject("formattedDate", formattedDate);
	       mav.addObject("dayOfWeek", dayOfWeek);
	       mav.addObject("playTime", playTime);
	       
	       
	       return mav;
	       
	   } catch(Exception e) {
	       // 에러 발생시 빈 결과 반환
	       ModelAndView mav = new ModelAndView();
	       mav.setViewName("goJson");
	       mav.addObject("formattedDate", selectedDate);
	       mav.addObject("dayOfWeek", "");
	       mav.addObject("playTime", new ArrayList<>());
	       return mav;
	   }
	}
	
	 @GetMapping("/getRemainingSeat.do")
	    @ResponseBody  // JSON 응답을 위해 필요
	    public Map<String, Integer> getRemainingSeat(
	        @RequestParam("selectedDate") String selectedDate,
	        @RequestParam("selectedTime") String selectedTime,
	        @RequestParam("m_code") String m_code) {
		 
	        
	        Map<String, Object> params = new HashMap<>();
	        params.put("selectedDate", selectedDate);
	        params.put("selectedTime", selectedTime);
	        params.put("m_code", m_code);
	        Map<String, Integer> map =  reservDAO.getRemainingSeat(params);
	        
	        return map;
	    }
	
	@GetMapping("/getBookedSeats.do")
	@ResponseBody
	public List<String> getBookedSeats(
	     @RequestParam("selectedDate") String selectedDate,
	     @RequestParam("selectedTime") String selectedTime,
	     @RequestParam("m_code") String m_code) {
	     
	     Map<String, Object> params = new HashMap<>();
	     params.put("selectedDate", selectedDate);
	     params.put("selectedTime", selectedTime);
	     params.put("m_code", m_code);
	     
	     return reservDAO.getBookedSeats(params);
	}
	
	@GetMapping("/updateReservedSeat.do")
	@ResponseBody
	public List<SeatDTO> updateReservedSeat(
	     @RequestParam("selectedDate") String selectedDate,
	     @RequestParam("selectedTime") String selectedTime,
	     @RequestParam("m_code") String m_code) {
	     
	     Map<String, Object> params = new HashMap<>();
	     params.put("selectedDate", selectedDate);
	     params.put("selectedTime", selectedTime);
	     params.put("m_code", m_code);
	     params.put("reserved","0");
	     
	     List<SeatDTO>seatList = reservDAO.getRealSeatOnlyReserv(params);
	     String jseatList =  new Gson().toJson(seatList);
	     
	     System.out.println(seatList.size());

	     return seatList;
	}
	 
	
	
	@GetMapping("/getSeatReviewAvg.do")
	@ResponseBody
	public double getSeatReviewAvg(
			@RequestParam("s_code") String s_code,
            @RequestParam("mh_code") String mh_code,
            @RequestParam("s_section") String s_section,
            @RequestParam("s_row") String s_row,
            @RequestParam("s_position") String s_position,
            @RequestParam("s_floor") String s_floor) {

	    System.out.println("Received Parameters:");
	    System.out.println("s_code: "+s_code);
	    
	    
	    Double avg = reservDAO.getMusicalSeatByHall(s_code, mh_code,s_section, s_row, s_position, s_floor);
	    System.out.println(avg);
	    // 평균 평점 계산
	    //return reservDAO.getMusicalSeatByHall(s_section, Integer.parseInt(s_row), Integer.parseInt(s_floor), Integer.parseInt(s_position), mh_code);
	    return avg;
	}
	
	@RequestMapping(value = "/calculatePrice.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> calculatePrice(@RequestParam String ticketData) {
	    Map<String, Object> result = new HashMap<>();
	    ObjectMapper mapper = new ObjectMapper();
	    
	    try {
	        Map<String, Object> data = mapper.readValue(ticketData, Map.class);
	        
	        int basePrice = ((Number)data.get("price")).intValue(); // 여기서 basePrice 선언
	        int normalCount = ((Number)data.get("normal")).intValue();
	        int veteranCount = ((Number)data.get("veteran")).intValue();
	        int disability13Count = ((Number)data.get("disability13")).intValue();
	        int disability46Count = ((Number)data.get("disability46")).intValue();
	        
	        // 가격 계산 로직
	        int totalPrice = normalCount * basePrice;
	        int discountedPrice = basePrice / 2; // basePrice 사용
	        int discountTotal = (veteranCount + disability13Count + disability46Count) * discountedPrice;
	        
	        totalPrice += discountTotal;
	        int discountAmount = (veteranCount + disability13Count + disability46Count) * (basePrice - discountedPrice);
	        
	        result.put("totalPrice", totalPrice);
	        result.put("discountAmount", discountAmount);
	        result.put("grade", data.get("grade"));
	        result.put("maxTickets", normalCount + veteranCount + disability13Count + disability46Count);
	        System.out.println("Received ticketData: " + ticketData);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return new HashMap<>();
	}
	
	// 포인트 조회
    @RequestMapping(value="/checkPoint.do", method=RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> checkPoint(HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        try {
        	String u_id = (String) session.getAttribute("s_id");

            if (u_id == null) {
                response.put("success", false);
                response.put("message", "로그인이 필요합니다.");
                return response;
            }
            
            int point = reservDAO.getPoint(u_id);
            response.put("success", true);
            response.put("point", point);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "포인트 조회 중 오류가 발생했습니다.");
            e.printStackTrace();
        }
        
        return response;
    }
    
    @RequestMapping(value = "/usePoint.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> usePoint(HttpSession session, @RequestParam int usePoint) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            String s_id = (String) session.getAttribute("s_id");
            if (s_id == null) {
                response.put("success", false);
                response.put("message", "로그인이 필요합니다.");
                return response;
            }
            
            // 현재 포인트 조회
            int currentPoint = reservDAO.getPoint(s_id);
            
            // 사용 가능 여부 확인
            if (currentPoint < usePoint) {
                response.put("success", false);
                response.put("message", "사용 가능한 포인트가 부족합니다.");
                return response;
            }
            
            // 세션에 사용할 포인트 금액 저장
            session.setAttribute("usePoint", usePoint);
            
            response.put("success", true);
            response.put("message", "포인트 사용이 선택되었습니다.");
            response.put("usePoint", usePoint);
            response.put("remainingPoint", currentPoint);  // 아직 차감되지 않은 현재 포인트
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "포인트 사용 선택 중 오류가 발생했습니다.");
            e.printStackTrace();
        }
        
        return response;
    }

    // 결제 완료 후 포인트 차감 처리 (예매 완료 시점에 호출)
    private void processPointDeduction(HttpSession session) {
        try {
            String s_id = (String) session.getAttribute("s_id");
            Integer usePoint = (Integer) session.getAttribute("usePoint");
            
            if (s_id != null && usePoint != null && usePoint > 0) {
                // 포인트 차감 처리
                Map<String, Object> params = new HashMap<>();
                params.put("s_id", s_id);
                params.put("usePoint", usePoint);
                reservDAO.usePoint(s_id, params);
                
                // 사용 완료된 포인트 정보 세션에서 제거
                session.removeAttribute("usePoint");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 포인트 차감 실패 시 처리 로직 추가
        }
    }
    
}



