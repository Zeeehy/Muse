package com.muse.rank.model;

import java.util.List;

public interface RankDAO {

		// 랭킹 페이지 (일간)
		public List<RankDTO> getdailyRankList();
		// 랭킹 페이지 (주간)
		public List<RankDTO> getweeklyRankList();
		// 랭킹 페이지 (월간)
		public List<RankDTO> getmonthlyRankList();
		
}
