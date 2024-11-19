package com.muse.partner.model;

import java.util.List;

import com.muse.seat.model.SeatDTO;

public interface PartnerDAO {

	public List<ActorDTO> SeachActorList(String ma_name);//actor팝업 배우검색
	
	public List<MusicalDTO> SeachMusicalList(String pr_code,String seachMusical);
	
	public MusicalDTO getMusicalDateSelect(String m_code);
	
	public int insertMusicalDate(String m_code, String mo_date,String mo_time);
	
	public List<MusicalOptionDTO> getMusicalDateSelcetOption(String m_code);
	
	public List<MusicalOptionDTO> getMusicalTimeSelcetOption(String m_code,String mo_date);
	
	public int insertCasting(String ma_code,String mc_char,String m_code, String mo_date,String mo_time);
	
	public int insertTicketNotice(String m_code,String rs_code,String on_type,String on_open,String on_muse_open,String on_info,String on_sale,String on_content,String on_casting,String on_etc);
	
	public List<MusicalHallDTO> getMusicalHallList();
	
	public List<SeatGradeDTO> selectSeatGrade();
	
	public int insertSelectSeats(List<SeatDTO> seatList);
	
	public int insertMusical(MusicalDTO DTO);
	
	public PartnerDTO getPartnerInfo(String pr_code);
	
	public int partnerInsert(PartnerDTO dto);
	
	public List<MusicalReviewDTO> seachReview(String pr_code);
	
	public int seachCodeMax(String idx,String table);
	
	public int InsertServiceRequest(ServiceRequestDTO dto);
	
	public String MaxMcode();
	
	public List<MusicalReviewDTO> seachMusicalReview(String pr_code,String m_code);
	
	public int updateBestReveiw(String mr_code);
	
	//public String mr_stateSelect(String mr_code, String pr_code);
	
	public int deleteReviewRe(BbsDeleteRequestDTO dto);
	
	public List<MusicalDTO> getMusicalList(String pr_code);
}
