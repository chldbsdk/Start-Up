package com.nakwon.domain;

import java.sql.Date;

public class ReservationVO {
	private int RsrvCode;
	private String Phone;
	private String Name;
	private String Email;
	private Date RsvDate;
	private int Pnum;
	private String Message;
	private int MenuCode;
	
	public int getRsrvCode() {
		return RsrvCode;
	}
	public void setRsrvCode(int rsrvCode) {
		RsrvCode = rsrvCode;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public Date getRsvDate() {
		return RsvDate;
	}
	public void setRsvDate(Date rsvDate) {
		RsvDate = rsvDate;
	}
	public int getPnum() {
		return Pnum;
	}
	public void setPnum(int pnum) {
		Pnum = pnum;
	}
	public String getMessage() {
		return Message;
	}
	public void setMessage(String message) {
		Message = message;
	}
	public int getMenuCode() {
		return MenuCode;
	}
	public void setMenuCode(int menuCode) {
		MenuCode = menuCode;
	}
	
	@Override
	public String toString() {
		return "ReservationVO [RsrvCode=" + RsrvCode + ", Phone=" + Phone + ", Name=" + Name + ", Email=" + Email
				+ ", RsvDate=" + RsvDate + ", Pnum=" + Pnum + ", Message=" + Message + ", MenuCode=" + MenuCode + "]";
	}
	
}