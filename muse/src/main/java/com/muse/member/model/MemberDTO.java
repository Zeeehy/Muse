package com.muse.member.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
	
	private String u_id;
	private String u_pwd;
	private String u_name;
	private String u_email;
	private String u_pnum;
	private int u_age;
	private int u_mpass;
	private java.sql.Date u_date;
	private int u_out;
	
}

