package com.muse.admin.model;

public class MemberStatsDTO {

	private String joinMonth;
	private int memberTotal;
	private int museTotal;
	
	
	public MemberStatsDTO() {
		super();
	}


	public String getJoinMonth() {
		return joinMonth;
	}


	public void setJoinMonth(String joinMonth) {
		this.joinMonth = joinMonth;
	}


	public int getMemberTotal() {
		return memberTotal;
	}


	public void setMemberTotal(int memberTotal) {
		this.memberTotal = memberTotal;
	}


	public int getMuseTotal() {
		return museTotal;
	}


	public void setMuseTotal(int museTotal) {
		this.museTotal = museTotal;
	}
	
	
}
