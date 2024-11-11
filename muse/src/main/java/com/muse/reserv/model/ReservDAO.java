package com.muse.reserv.model;

import java.util.List;
import java.util.Map;

import com.muse.partner.model.MusicalDTO;

public interface ReservDAO {
	
	Map<String,Object> getMusicalInfo();
	List<String> getMusicalDate();
    List<String> getMusicalTimeByDate(String selectedDate); 
}
