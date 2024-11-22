package com.muse.myPage.model;

import java.util.List;

public interface MuseCalendarDAO {
	List<MuseCalendarDTO> getCalendarActorCast(String u_id);
	List<MuseCalendarDTO> getCalendarBooking(String u_id);
}
