package com.muse.seat.model;

import java.util.List;
import java.util.Map;

public interface SeatLayoutDAO {

	public List<SeatLayoutDTO> seatLayoutSelect();
	public List<String> sectionSelect();
	public List<Integer> bindByallFloorSelect();
	public Map<Integer, Integer> max_rowSelect();
	public List<SeatDTO> getRealSeat();
}
