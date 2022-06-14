package com.nakwon.domain;

import java.sql.Timestamp;

public class ReviewVO {
	private int RVCode;
	private String RsrvCode;
	private String RVTitle;
	private String RVContent;
	private String RVImg;
	private Timestamp RVDate;
	
	public ReviewVO() {}
 	@Override
	public String toString() {
		return "ReviewVO [RVCode=" + RVCode + ", RsrvCode=" + RsrvCode + ", RVTitle=" + RVTitle + ", RVContent="
				+ RVContent + ", RVImg=" + RVImg + ", RVDate=" + RVDate + "]";
	}
	public int getRVCode() {
		return RVCode;
	}
	public void setRVCode(int rVCode) {
		RVCode = rVCode;
	}
	public String getRsrvCode() {
		return RsrvCode;
	}
	public void setRsrvCode(String rsrvCode) {
		RsrvCode = rsrvCode;
	}
	public String getRVTitle() {
		return RVTitle;
	}
	public void setRVTitle(String rVTitle) {
		RVTitle = rVTitle;
	}
	public String getRVContent() {
		return RVContent;
	}
	public void setRVContent(String rVContent) {
		RVContent = rVContent;
	}
	public String getRVImg() {
		return RVImg;
	}
	public void setRVImg(String rVImg) {
		RVImg = rVImg;
	}
	public Timestamp getRVDate() {
		return RVDate;
	}
	public void setRVDate(Timestamp rVDate) {
		RVDate = rVDate;
	}
}
