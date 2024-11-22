package com.muse.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.muse.openNotice.model.OpenNoticeDAO;
import com.muse.openNotice.model.OpenNoticeDTO;
import com.muse.admin.model.PartnerDTO;
import com.muse.review.model.MusicalReviewDTO;

@Controller
public class OpenNoticeController {

	@Autowired
	OpenNoticeDAO opendao;
	
	private int listsize=10;
	private int pagesize=3;
	
	@RequestMapping("/openNotice.do")
	public ModelAndView openNoticeMain(
			@RequestParam(value="crpage", defaultValue="1")int crpage
								) {
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		int startnum=(crpage-1)*listsize+1;
		int endnum=crpage*listsize;

		
		paramMap.put("startnum", startnum);
		paramMap.put("endnum", endnum);	
		
		List<OpenNoticeDTO> noticeList = opendao.getOpenNoticeList(paramMap);
		setDY(noticeList);

		int countNotice = opendao.countOpenNotice();
		
		String pagingStr=com.muse.page.Paging.makePage("openNotice", countNotice, listsize, pagesize,crpage);

		
		mav.addObject("noticeList",noticeList);
		mav.addObject("pagingStr",pagingStr);
		
		mav.setViewName("openNotice/openNoticeList");
		
		return mav;
	}
	
	
	@RequestMapping("noticeList.do")
	public ModelAndView boardList(
			@RequestParam(value="crpage", defaultValue="1")int crpage)
			 {
		
		int countNotice = opendao.countOpenNotice();

		
		String pagingStr=com.muse.page.Paging.makePage("boardList", countNotice, listsize, pagesize, crpage);
		
		Map paramMap = new HashMap<String, Object>();
		
		int startnum=(crpage-1)*listsize+1;
		int endnum=crpage*listsize;

		paramMap.put("startnum", startnum);
		paramMap.put("endnum", endnum);
		
		List<OpenNoticeDTO> noticeList = opendao.getOpenNoticeList(paramMap);
		setDY(noticeList);

		
		
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("noticeList", noticeList);
		mv.addObject("pagingStr", pagingStr);
		mv.setViewName("parkJson");
		
		return mv;
	}
	
	@RequestMapping("/openNoticeView.do")
	public ModelAndView openNoticeDetail(@RequestParam String on_code) {
		ModelAndView mav = new ModelAndView();
		
		OpenNoticeDTO ondto = opendao.getNoticeDetail(on_code);
		
		opendao.increaseReadNum(on_code);
		
		PartnerDTO pdto =  opendao.getPartnerByOpenNotice(on_code);
		
		
		mav.addObject("ondto",ondto);
		mav.addObject("pdto",pdto);
		mav.setViewName("openNotice/openNoticeView");
		return mav;
	}
	
	
	public List<OpenNoticeDTO> setDY(List<OpenNoticeDTO> list){
		for(OpenNoticeDTO dto : list) {
			String dateStr = dto.getOn_open();

			SimpleDateFormat parser = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd (E)", new Locale("ko", "KR"));
			
			String on_open="";
			try {
				on_open = formatter.format(parser.parse(dateStr));
			} catch (ParseException e) {
				on_open = dto.getOn_open();
				e.printStackTrace();
			}
			
			dto.setOn_open(on_open);
		}
		
		return list;
	}
	
}
