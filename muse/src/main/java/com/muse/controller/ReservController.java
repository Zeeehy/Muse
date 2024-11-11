package com.muse.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.muse.partner.model.MusicalDTO;
import com.muse.reserv.model.ReservDAO;

@Controller
public class ReservController {
	
	@Autowired
	private ReservDAO reservDAO;
	
	
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
		
		return mav;
	}
	
	@RequestMapping("/getMusicalTimeByDate")
    @ResponseBody
    public List<String> getMusicalTimeByDate(@RequestParam("selectedDate") String selectedDate) {
        return reservDAO.getMusicalTimeByDate(selectedDate);
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
}
