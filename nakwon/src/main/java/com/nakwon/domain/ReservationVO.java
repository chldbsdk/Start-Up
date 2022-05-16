package com.nakwon.domain;

import java.sql.Timestamp;

public class ReservationVO {
	private String RsrvCode;
	private String Phone;
	private String Name;
	private String Email;
	private Timestamp RsvDate;
	private int Pnum;
	private String Message;
	private String Code;
	private String MenuCode;
	
	public String getRsrvCode() {
		return RsrvCode;
	}
	public void setRsrvCode(String rsrvCode) {
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
	public Timestamp getRsvDate() {
		return RsvDate;
	}
	public void setRsvDate(Timestamp rsvDate) {
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
	public String getMenuCode() {
		return MenuCode;
	}
	public void setMenuCode(String menuCode) {
		MenuCode = menuCode;
	}
	public String getCode() {
		return Code;
	}
	public void setCode(String code) {
		Code = code;
	}
	@Override
	public String toString() {
		return "ReservationVO [RsrvCode=" + RsrvCode + ", Phone=" + Phone + ", Name=" + Name + ", Email=" + Email
				+ ", RsvDate=" + RsvDate + ", Pnum=" + Pnum + ", Message=" + Message + ", Code=" + Code + ", MenuCode="
				+ MenuCode + "]";
	}
}