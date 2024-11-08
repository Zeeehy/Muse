package com.muse.seat.model;

public class SeatLayoutDTO {

	int sl_code;
	String sl_data;
	String sl_section;
	int sl_row;
	int sl_floor;
	int sl_bind;
	String sl_type;
	
	public SeatLayoutDTO() {
		super();
	}
	public SeatLayoutDTO(int sl_code, String sl_data, String sl_section, int sl_row, int sl_floor, int sl_bind,
			String sl_type) {
		super();
		this.sl_code = sl_code;
		this.sl_data = sl_data;
		this.sl_section = sl_section;
		this.sl_row = sl_row;
		this.sl_floor = sl_floor;
		this.sl_bind = sl_bind;
		this.sl_type = sl_type;
	}
	public int getSl_code() {
		return sl_code;
	}
	public void setSl_code(int sl_code) {
		this.sl_code = sl_code;
	}
	public String getSl_data() {
		return sl_data;
	}
	public void setSl_data(String sl_data) {
		this.sl_data = sl_data;
	}
	public String getSl_section() {
		return sl_section;
	}
	public void setSl_section(String sl_section) {
		this.sl_section = sl_section;
	}
	public int getSl_row() {
		return sl_row;
	}
	public void setSl_row(int sl_row) {
		this.sl_row = sl_row;
	}
	public int getSl_floor() {
		return sl_floor;
	}
	public void setSl_floor(int sl_floor) {
		this.sl_floor = sl_floor;
	}
	public int getSl_bind() {
		return sl_bind;
	}
	public void setSl_bind(int sl_bind) {
		this.sl_bind = sl_bind;
	}
	public String getSl_type() {
		return sl_type;
	}
	public void setSl_type(String sl_type) {
		this.sl_type = sl_type;
	}
	@Override
	public String toString() {
		return "SeatLayoutDTO [sl_code=" + sl_code + ", sl_data=" + sl_data + ", sl_section=" + sl_section + ", sl_row="
				+ sl_row + ", sl_floor=" + sl_floor + ", sl_bind=" + sl_bind + ", sl_type=" + sl_type + "]";
	}
	
	
	
	
	
	
}
