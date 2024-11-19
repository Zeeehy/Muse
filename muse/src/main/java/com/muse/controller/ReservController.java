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
	    Map<String,Object> musicalInfo = reservDAO.getMusicalInfo(mh_code);

	    
	    // 초기화
	    List<String> playDate = new ArrayList<>();
	    int maxTickets = 0;
	    List<Map<String, Object>> musicalPrice = new ArrayList<>();  // price 리스트 초기화

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
	        Map<String, Object> musicalInfo = reservDAO.getMusicalInfo(mh_code);
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
	        HttpSession session

	        ) {
	    
	    ModelAndView mav = new ModelAndView();
	    
	    
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
	    	Map<String, Object> musicalInfo = reservDAO.getMusicalInfo(mh_code);
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
	        mav.setViewName("reservation/reservCheck");
	        System.out.println("jsonSeats being sent: " + selectedSeats);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return mav;
	}

	
	@RequestMapping("/reservCancle.do")
	public ModelAndView ReservCancleForm(
			@RequestParam(value = "mh_code" , required = false) String mh_code,
	        @RequestParam(value = "m_code", required = false) String m_code,
	        @RequestParam(value = "selectedDate", required = false) String selectedDate,
	        @RequestParam(value = "selectedTime", required = false) String selectedTime,
	        @RequestParam(value = "selectedSeats", required = false) String selectedSeats ,
	        @RequestParam(value = "jcancelDeadline", required = false) String jcancelDeadline,
	        @RequestParam(value = "ticketPrice", required = false) String ticketPrice,
	        HttpSession session

	        ) {
	    
	    ModelAndView mav = new ModelAndView();
	    
	    ObjectMapper mapper = new ObjectMapper();
	    try {
	    	System.out.println("reservCheckController");
	    	
	    	System.out.println(mh_code);
	    	System.out.println(m_code);
	    	System.out.println(selectedDate);
	    	System.out.println(selectedTime);
	        System.out.println("취소기한: " + jcancelDeadline); // 값 확인
	    
		
			selectedSeats = selectedSeats.replace("'", "\"") // 작은따옴표를 큰따옴표로
			.replaceAll("([{,])\\s*(\\w+):", "$1\"$2\":"); // 프로퍼티 이름에 따옴표 추가

			try {
				List<SeatDTO> seatList = mapper.readValue(selectedSeats, 
			            mapper.getTypeFactory().constructCollectionType(List.class, SeatDTO.class));
		        mav.addObject("selectedSeats", seatList);
		        mav.setViewName("reservation/reservCancle"); // reservCheck가 아닌 reservCancle로 변경
		       
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
    
	        // 뮤지컬 정보 및 가격 정보 조회
	    	Map<String, Object> musicalInfo = reservDAO.getMusicalInfo(mh_code);
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
	        //mav.addObject("selectedSeats", seatList);
	        
	        mav.addObject("musicalInfo", musicalInfo);
	        mav.addObject("musicalPrice", musicalPrice);
	        mav.addObject("jcancelDeadline", jcancelDeadline); 
	        mav.addObject("ticketPrice", ticketPrice);
	        mav.addObject("memberInfo",memberInfo);
	        mav.setViewName("reservation/reservCancle");
	        System.out.println("Received selectedSeats: " + selectedSeats);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return mav;
	}
	
	
	@RequestMapping("/reservSuccess.do")
	public String ReservSuccesForm() {
		return "reservation/reservSuccess";
	}

	
	// 좌석 조회
	public HashMap<String, String> ReservSeatForm(int sl_bind, int mhl_code,String m_code) {
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			List<SeatLayoutDTO> layout = reservDAO.seatLayoutSelect(sl_bind, mhl_code);
			List<String> section = reservDAO.sectionSelect(sl_bind, mhl_code);
			List<Integer> floor = reservDAO.bindByallFloorSelect(sl_bind, mhl_code);
			Map<Integer,Integer> max_rowMap= reservDAO.max_rowSelect(mhl_code); 
			
			List<SeatDTO> seatList = reservDAO.getRealSeat(m_code);
			
			//System.out.println(section);
			//System.out.println(floor);
			//System.out.println(max_rowMap);
			//System.out.println(seatList);
			
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
			
			//System.out.println(jsonLayout);
			//System.out.println(jsonSection);
			//System.out.println(jsonFloor);
			//System.out.println(jsonMax_rowMap);
			//System.out.println(jseatList);
					
			
			return map;
		}

	
	@RequestMapping("/searchTime.do")
	public ModelAndView searchTime(@RequestParam String selectedDate, String mh_code) {
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

	       List<String> playTime = reservDAO.getMusicalTimeByDate(formattedDate, mh_code);

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
	        
	        return reservDAO.getRemainingSeat(params);
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
	        @RequestParam("m_code") String m_code) {

	    System.out.println("Received Parameters:");
	    System.out.println("s_code: "+s_code);
	    System.out.println("m_code: " + m_code);
	    
	    
	    Double avg = reservDAO.getMusicalSeatByHall(s_code, m_code);
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



