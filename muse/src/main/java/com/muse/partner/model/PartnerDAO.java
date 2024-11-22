package com.muse.partner.model;

import java.util.List;
import java.util.Map;

import com.muse.member.model.MemberDTO;
import com.muse.seat.model.SeatDTO;
import com.muse.seat.model.SeatLayoutDTO;

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
	
	public List<MusicalDTO> getMusicalList(String pr_code,String performanceStatus);
	
	public MemberDTO getusersInfo(String u_id);
	
	//좌석관련
	public List<SeatLayoutDTO> seatLayoutSelectPartner(int mhl_code);
	public List<String> sectionSelectPartner(int mhl_code);
	public List<Integer> bindByallFloorSelectPartner(int mhl_code);
	public Map<Integer, Integer> max_rowSelectPartner(int mhl_code);
	public List<SeatDTO> getRealSeatPartner();
	public void insertDummySeatsPartner(List<SeatDTO> seatList);
	public SeatDTO selectLayout(String mh_cdoe);
	
	public int insertSeatPrice(SeatGradeDTO DTO);
	
	public List<MusicalDTO> getReqeustList(String pr_code,String isFutureDate);
	public MusicalDTO selectAllMusical(String m_code);
}
