package com.muse.rank.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.muse.main.model.MusicalDTO;

public class RankDAOImple implements RankDAO {

	private SqlSessionTemplate sqlMap;

	public RankDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List<RankDTO> getdailyRankList() {
		List<RankDTO> daily = sqlMap.selectList("daily_rank");			
		return daily;
	}

	@Override
	public List<RankDTO> getweeklyRankList() {
		List<RankDTO> weekly = sqlMap.selectList("weekly_rank");			
		return weekly;
	}

	@Override
	public List<RankDTO> getmonthlyRankList() {
		List<RankDTO> monthly = sqlMap.selectList("monthly_rank");			
		return monthly;
	}

}
