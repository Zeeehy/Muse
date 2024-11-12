package com.muse.musicalDetail.model;

public class MusicalDetailCastDTO {

	private String ma_name;
	private String mc_char;
	private String ma_code;
	private String is_liked;
	private String ma_img;
	public MusicalDetailCastDTO() {
		super();
	}
	public MusicalDetailCastDTO(String ma_name, String mc_char, String ma_code, String is_liked, String ma_img) {
		super();
		this.ma_name = ma_name;
		this.mc_char = mc_char;
		this.ma_code = ma_code;
		this.is_liked = is_liked;
		this.ma_img = ma_img;
	}
	
	public String getMa_name() {
		return ma_name;
	}
	public void setMa_name(String ma_name) {
		this.ma_name = ma_name;
	}
	public String getMc_char() {
		return mc_char;
	}
	public void setMc_char(String mc_char) {
		this.mc_char = mc_char;
	}
	public String getMa_code() {
		return ma_code;
	}
	public void setMa_code(String ma_code) {
		this.ma_code = ma_code;
	}
	public String getIs_liked() {
		return is_liked;
	}
	public void setIs_liked(String is_liked) {
		this.is_liked = is_liked;
	}
	public String getMa_img() {
		return ma_img;
	}
	public void setMa_img(String ma_img) {
		this.ma_img = ma_img;
	}
	@Override
	public String toString() {
		return "MusicalDetailCastDTO [ma_name=" + ma_name + ", mc_char=" + mc_char + ", ma_code=" + ma_code
				+ ", is_liked=" + is_liked + ", ma_img=" + ma_img + "]";
	}
	
	
	
	
}
