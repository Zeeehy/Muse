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
	public ModelAndView RerservMainForm() {
		// 뮤지컬 기본정보 조회
		Map<String,Object> musicalInfo = reservDAO.getMusicalInfo();
		
		// 뮤지컬 날짜 조회
		List<String> playDate = reservDAO.getMusicalDate();
		
		// 뮤지컬 시간 조회
	    //List<String> allTimes = reservDAO.getAllMusicalTimes();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reservation/reservMain");
		
		mav.addObject("musicalInfo",musicalInfo);
		mav.addObject("playDate",playDate);
	    //mav.addObject("allTimes", allTimes);
		
		HashMap map = ReservSeatForm();
		
		Iterator ir = map.keySet().iterator();
		
		while (ir.hasNext()) {
			String key = (String)ir.next();
			mav.addObject(key, map.get(key));
			
		}
		
		return mav;
	}
	
	@RequestMapping("/searchTime.do")
	public ModelAndView searchTime(@RequestParam String selectedDate) {
	    List<String> playTime = reservDAO.getMusicalTimeByDate(selectedDate);
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("goJson");
	    mav.addObject("playTime", playTime);
//	    System.out.println(playTime.size() + "개의 시간");
//	    System.out.println(playTime.toString());
	    return mav;
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
	
	public HashMap<String, String> ReservSeatForm() {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		List<SeatLayoutDTO> layout = seatLayoutDAO.seatLayoutSelect();
		List<String> section = seatLayoutDAO.sectionSelect();
		List<Integer> floor = seatLayoutDAO.bindByallFloorSelect();
		Map<Integer,Integer> max_rowMap= seatLayoutDAO.max_rowSelect(); 
		List<SeatDTO> seatList = seatLayoutDAO.getRealSeat();
		
		System.out.println(section);
		System.out.println(floor);
		System.out.println(max_rowMap);
		System.out.println(seatList);
		
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
		
		
		System.out.println(jsonLayout);
		System.out.println(jsonSection);
		System.out.println(jsonFloor);
		System.out.println(jsonMax_rowMap);
		System.out.println(jseatList);
				
		
		return map;
	}
}
