package com.muse.main.model;

import java.util.List;

public interface MainDAO {
	
		// 메인 페이지 배너 부분
		public List<MusicalDTO> main_banner();
		// 메인 페이지 티켓 오픈 부분
		public List<TicketOpenDTO> main_ticketopen();
		// 메인 페이지 베스트 리뷰 부분
		public List<BestReviewDTO> main_bestreview();
		// 메인 페이지 뮤지컬 전체보기 부분
		public List<MusicalDTO> main_musicallist(int page, int size);
		// 메인 검색바 - 뮤지컬 홀 검색
		public List<MusicalHallDTO> search_mh(String searchWord);
		// 메인 검색바 - 뮤지컬 배우 검색
		public List<MusicalActorDTO> search_ma(String searchWord);
		// 메인 검색바 - 뮤지컬 검색
		public List<MusicalDTO> search_m(String searchWord);
		public int search_m_count(String searchWord);

		
		// 뮤즈패스 페이지 티켓 오픈 부분
		public List<TicketOpenDTO> musepass_ticketopen();
}
