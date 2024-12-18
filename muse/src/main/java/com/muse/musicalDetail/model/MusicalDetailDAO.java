package com.muse.musicalDetail.model;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.muse.admin.model.PartnerDTO;
import com.muse.openNotice.model.OpenNoticeDTO;
import com.muse.partner.model.MusicalHallDTO;
import com.muse.partner.model.MusicalOptionDTO;
import com.muse.review.model.MusicalReviewDTO;

public interface MusicalDetailDAO {

	public MusicalDetailDTO getMusicalBasicInfo(String m_code);
	public int checkLikeMusical(String m_code, String u_id);
	public int countLikeMusical(String m_code);
	public int insertLikeMusical(String m_code, String u_id);
	public int deleteLikeMusical(String m_code, String u_id);
	public List<MusicalDetailCastDTO> getCastingWithLike(String m_code, String u_id);
	public int insertLikeActor (String ma_code, String u_id);
	public int deleteLikeActor (String ma_code, String u_id);
	public List<Date> getScreenDay(String m_code);
	public List<String> getStartTime(String m_code);
	public List<MusicalDetailCastDTO> getRoundActor(Map paramMap);
	public List<String> getAllChar(String m_code);
	public List<Date> getRoundDOW (Map paramMap);
	public int countMusicalReview(String m_code);
	public double getMusicalReviewAVG(String m_code);
	public List<MusicalReviewDTO> getMusicalReviews(Map paramMap);
	public List<MusicalReviewDTO> getBestReviewsByMusical(Map paramMap);
	public List<String> getSelectedRoundActors(Map paramMap);
	public List<String> getRound(Map paramMap);
	public int insertLikeMusicalReview(Map paramMap);
	public int deleteLikeMusicalReview(Map paramMap);
	public int countLikeMusicalReview(String mr_code);
	public PartnerDTO getPartnerInfoByMusical(String m_code);
	public MusicalHallDTO getMusicalHallInfo(String m_code);
	public List<MusicalOptionDTO> getRecentMusicalOption (String m_code);
	public List<MusicalOptionDTO> getNextMonthMusicalOption(Map paramMap);
	public MusicalOptionDTO getMaxMusicalOption(String m_code);
	public OpenNoticeDTO getOpenTime(String m_code);
}
