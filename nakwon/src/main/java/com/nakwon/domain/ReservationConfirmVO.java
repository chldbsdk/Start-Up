//예약 확정 테이블(관리자가 예약 수락해준 테이블)
package com.nakwon.domain;

import java.sql.Timestamp;

public class ReservationConfirmVO {
	private String RsrvCode;
	private String Phone;
	private String Name;
	private String Email;
	private Timestamp RsrvDate;
	private int Pnum;
	private String Message;
	private String Code;
	private String MenuCode;
	private String MenuCodeName;
	
	public String getMenuCodeName() {
		return MenuCodeName;
	}
	public void setMenuCodeName(String menuCodeName) {
		MenuCodeName = menuCodeName;
	}
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
	public Timestamp getRsrvDate() {
		return RsrvDate;
	}
	public void setRsrvDate(Timestamp rsrvDate) {
		RsrvDate = rsrvDate;
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
		return "ReservationConfirmVO [RsrvCode=" + RsrvCode + ", Phone=" + Phone + ", Name=" + Name + ", Email=" + Email
				+ ", RsrvDate=" + RsrvDate + ", Pnum=" + Pnum + ", Message=" + Message + ", Code=" + Code
				+ ", MenuCode=" + MenuCode + ", MenuCodeName=" + MenuCodeName + "]";
	}
	
	public ReservationConfirmVO() {
		super();
		/*
		 * RsrvCode = rsrvCode; Phone = phone; Name = name; Email = email; RsvDate =
		 * rsvDate; Pnum = pnum; Message = message; Code = code; MenuCode = menuCode;
		 */
	}
	
	
}
