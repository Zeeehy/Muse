package com.muse.partner.model;

public class PartnerDTO {

	
	
	private String pr_code;
	private String u_id;
	private int rs_code;
	private String pr_name;
	private int pr_num;
	private int pr_pnum;
	private String pr_email;
	
	
	public PartnerDTO() {
		// TODO Auto-generated constructor stub
	}


	public PartnerDTO(String pr_code, String u_id, int rs_code, String pr_name, int pr_num, int pr_pnum,
			String pr_email) {
		super();
		this.pr_code = pr_code;
		this.u_id = u_id;
		this.rs_code = rs_code;
		this.pr_name = pr_name;
		this.pr_num = pr_num;
		this.pr_pnum = pr_pnum;
		this.pr_email = pr_email;
	}


	public String getPr_code() {
		return pr_code;
	}


	public void setPr_code(String pr_code) {
		this.pr_code = pr_code;
	}


	public String getU_id() {
		return u_id;
	}


	public void setU_id(String u_id) {
		this.u_id = u_id;
	}


	public int getRs_code() {
		return rs_code;
	}


	public void setRs_code(int rs_code) {
		this.rs_code = rs_code;
	}


	public String getPr_name() {
		return pr_name;
	}


	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}


	public int getPr_num() {
		return pr_num;
	}


	public void setPr_num(int pr_num) {
		this.pr_num = pr_num;
	}


	public int getPr_pnum() {
		return pr_pnum;
	}


	public void setPr_pnum(int pr_pnum) {
		this.pr_pnum = pr_pnum;
	}


	public String getPr_email() {
		return pr_email;
	}


	public void setPr_email(String pr_email) {
		this.pr_email = pr_email;
	}
	
	
}
