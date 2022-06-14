package com.nakwon.domain;

import java.sql.Timestamp;

public class NoticeVO {
	private int NBCode;
	private String NBTitle;
	private String NBContent;
	private String NBImg;
	private Timestamp NBDate;
	
	public NoticeVO() {}
	@Override
	public String toString() {
		return "NoticeVO [NBCode=" + NBCode + ", NBTitle=" + NBTitle + ", NBContent=" + NBContent + ", NBImg=" + NBImg
				+ ", NBDate=" + NBDate + "]";
	}
	public int getNBCode() {
		return NBCode;
	}
	public void setNBCode(int nBCode) {
		NBCode = nBCode;
	}
	public String getNBTitle() {
		return NBTitle;
	}
	public void setNBTitle(String nBTitle) {
		NBTitle = nBTitle;
	}
	public String getNBContent() {
		return NBContent;
	}
	public void setNBContent(String nBContent) {
		NBContent = nBContent;
	}
	public String getNBImg() {
		return NBImg;
	}
	public void setNBImg(String nBImg) {
		NBImg = nBImg;
	}
	public Timestamp getNBDate() {
		return NBDate;
	}
	public void setNBDate(Timestamp nBDate) {
		NBDate = nBDate;
	}
}
