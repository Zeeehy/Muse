package com.muse.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.muse.partner.model.MusicalDTO;
import com.muse.reserv.model.ReservDAO;
import com.muse.seat.model.SeatDTO;
import com.muse.seat.model.SeatLayoutDAO;
import com.muse.seat.model.SeatLayoutDAOImple;
import com.muse.seat.model.SeatLayoutDTO;

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
	 
	@RequestMapping("/reservSale.do")
	public String ReservSaleForm() {
		return "reservation/reservSale";
	}
	
	@RequestMapping("/reservCheck.do")
	public String ReservCheckForm() {
		return "reservation/reservCheck";
	}
	
	@RequestMapping("/reservCancle.do")
	public String ReservCancleForm() {
		return "reservation/reservCancle";
	}
	
	@RequestMapping("/reservSuccess.do")
	public String ReservSuccesForm() {
		return "reservation/reservSuccess";
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

}
