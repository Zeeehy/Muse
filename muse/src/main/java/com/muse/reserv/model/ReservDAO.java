package com.muse.reserv.model;

import java.util.List;
import java.util.Map;

import com.muse.partner.model.MusicalDTO;

public interface ReservDAO {
	
	Map<String,Object> getMusicalInfo(String mh_code);
	List<String> getMusicalDate(String mh_code);
    List<String> getMusicalTimeByDate(String selectedDate,String mh_code); 
    int getMusicalMaxTicket(String m_code);
    List<Map<String,Object>> getMusicalSeatList();
    //int getMusicalMaxTicket(String m_code);
}
