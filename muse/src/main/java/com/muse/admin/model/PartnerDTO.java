package com.muse.admin.model;

public class PartnerDTO {

	private String u_id; //뮤즈아이디
	private String u_name; //뮤즈이름
	private String u_pnum; //뮤즈전번
	private String u_email; //뮤즈이메일
	
	private String pr_code; //파트너 코드
	private String pr_name; //파트너 명
	private String pr_num; //파트너 사업자번호
	private String pr_pnum; //파트너 연락처
	private String pr_email; //파트너 이메일
	private String rs_code; //파트너 요청상태(0대기 1승락 2거절)
	
	
	
	public PartnerDTO() {
		super();
	}
	
	
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_pnum() {
		return u_pnum;
	}
	public void setU_pnum(String u_pnum) {
		this.u_pnum = u_pnum;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getPr_code() {
		return pr_code;
	}
	public void setPr_code(String pr_code) {
		this.pr_code = pr_code;
	}
	public String getPr_name() {
		return pr_name;
	}
	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}
	public String getPr_num() {
		return pr_num;
	}
	public void setPr_num(String pr_num) {
		this.pr_num = pr_num;
	}
	public String getPr_pnum() {
		return pr_pnum;
	}
	public void setPr_pnum(String pr_pnum) {
		this.pr_pnum = pr_pnum;
	}
	public String getPr_email() {
		return pr_email;
	}
	public void setPr_email(String pr_email) {
		this.pr_email = pr_email;
	}
	public String getRs_code() {
		return rs_code;
	}
	public void setRs_code(String rs_code) {
		this.rs_code = rs_code;
	}


	
}
