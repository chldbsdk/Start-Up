package com.nakwon.domain;

public class ManagerVO {
	private String userid;
	private String userpw;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	@Override
	public String toString() {
		return "ManagerVO [userid=" + userid + ", userpw=" + userpw + "]";
	}
}