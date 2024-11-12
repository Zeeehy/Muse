package com.muse.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.muse.seat.model.SeatDTO;
import com.muse.seat.model.SeatLayoutDAO;
import com.muse.seat.model.SeatLayoutDAOImple;
import com.muse.seat.model.SeatLayoutDTO;

import com.google.gson.Gson;


@Controller
public class SeatController {

	@Autowired
	private SeatLayoutDAO seatLayoutDAO;
	
	@RequestMapping("/seatTest.do")
	public String empMain() {
		
		return "seatTest";
	}
	
	@RequestMapping("/printSeat.do")
	public ModelAndView printSeat() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("printSeat");
		
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
		
		mav.addObject("layouts",jsonLayout);
		mav.addObject("section",jsonSection);
		mav.addObject("floor",jsonFloor);
		mav.addObject("max_rowMap",jsonMax_rowMap);
		mav.addObject("seatList",jseatList);
		
		System.out.println(jsonLayout);
		
		mav.setViewName("seat/printSeat");
		
		
		return mav;
	}
	
	@RequestMapping("/dummySeatsForm.do")
	public ModelAndView dummySeatsForm() {
		ModelAndView mav = new ModelAndView();
		
		List<SeatLayoutDTO> layout = seatLayoutDAO.seatLayoutSelect();
		List<String> section = seatLayoutDAO.sectionSelect();
		List<Integer> floor = seatLayoutDAO.bindByallFloorSelect();
		Map<Integer,Integer> max_rowMap= seatLayoutDAO.max_rowSelect(); 
		List<SeatDTO> seatList = seatLayoutDAO.getRealSeat();
		
//		System.out.println(section);
//		System.out.println(floor);
//		System.out.println(max_rowMap);
//		System.out.println(seatList);
		
		String jsonLayout = new Gson().toJson(layout);
		String jsonSection =  new Gson().toJson(section); 
		String jsonFloor = new Gson().toJson(floor);
		String jsonMax_rowMap = new Gson().toJson(max_rowMap);
		String jseatList =  new Gson().toJson(seatList);
		
		mav.addObject("layouts",jsonLayout);
		mav.addObject("section",jsonSection);
		mav.addObject("floor",jsonFloor);
		mav.addObject("max_rowMap",jsonMax_rowMap);
		mav.addObject("seatList",jseatList);
		
		
		mav.setViewName("seat/dummySeatsForm");

		System.out.println(jsonLayout);
	
		return mav;
	}
	
	 
	@RequestMapping(value = "/insertDummySeats.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insertDummySeats(@RequestBody Map<String, Map<String, Map<String, Map<String, List<List<Object>>>>>> floorMap) {
        Map<String, Object> response = new HashMap<String, Object>();
        int i =0;
        
        List<SeatDTO> seatList = new ArrayList<>();  // DTO를 담을 List 생성

        try {
            for (Entry<String, Map<String, Map<String, Map<String, List<List<Object>>>>>> floorEntry : floorMap.entrySet()) {
                String floor = floorEntry.getKey();
                Map<String, Map<String, Map<String, List<List<Object>>>>> sectionMap = floorEntry.getValue();
                
                for (Entry<String, Map<String, Map<String, List<List<Object>>>>> sectionEntry : sectionMap.entrySet()) {
                    String section = sectionEntry.getKey();
                    Map<String, Map<String, List<List<Object>>>> rowMap = sectionEntry.getValue();
                    
                    for (Entry<String, Map<String, List<List<Object>>>> rowEntry : rowMap.entrySet()) {
                        String row = rowEntry.getKey();
                        Map<String, List<List<Object>>> seatMap = rowEntry.getValue();
                        
                        for (Entry<String, List<List<Object>>> seatEntry : seatMap.entrySet()) {
                            String position = seatEntry.getKey();
                            List<List<Object>> seatDataList = seatEntry.getValue();
                            
                            if (!seatDataList.isEmpty() && !seatDataList.get(0).isEmpty()) {
                                List<Object> seatData = seatDataList.get(0);
                                i++;
                                SeatDTO seatDTO = new SeatDTO();
                                seatDTO.setSg_code(String.valueOf(seatData.get(0)));  // sg_code
                                seatDTO.setM_code(String.valueOf(seatData.get(1)));   // m_code
                                seatDTO.setMhl_code(Integer.parseInt(String.valueOf(seatData.get(2)).replace("mhl_", ""))); // mhl_code
                                seatDTO.setS_section(String.valueOf(seatData.get(3))); // section
                                seatDTO.setS_position(Integer.parseInt(String.valueOf(seatData.get(4)))); // position
                                seatDTO.setS_row(Integer.parseInt(String.valueOf(seatData.get(5))));     // row
                                seatDTO.setS_floor(Integer.parseInt(String.valueOf(seatData.get(6))));   // floor
                                

                                seatList.add(seatDTO);  // List에 DTO 추가

                            }
                        }
                    }
                }
            }
            System.out.println(i);
            
            seatLayoutDAO.insertDummySeats(seatList);
            
            response.put("status", "success");
            response.put("message", "좌석 정보가 성공적으로 저장되었습니다.");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "좌석 정보 저장 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return response;
    }
}
