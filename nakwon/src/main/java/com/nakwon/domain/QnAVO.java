package com.nakwon.domain;

import java.sql.Timestamp;

public class QnAVO {
	private int QnACode;
	private String QnATitle;
	private String QnAContent;
	private Timestamp QnADate;
	
	public QnAVO() {}
	@Override
	public String toString() {
		return "QnAVO [QnACode=" + QnACode + ", QnATitle=" + QnATitle + ", QnAContent=" + QnAContent + ", QnADate="
				+ QnADate + "]";
	}
	public int getQnACode() {
		return QnACode;
	}
	public void setQnACode(int qnACode) {
		QnACode = qnACode;
	}
	public String getQnATitle() {
		return QnATitle;
	}
	public void setQnATitle(String qnATitle) {
		QnATitle = qnATitle;
	}
	public String getQnAContent() {
		return QnAContent;
	}
	public void setQnAContent(String qnAContent) {
		QnAContent = qnAContent;
	}
	public Timestamp getQnADate() {
		return QnADate;
	}
	public void setQnADate(Timestamp qnADate) {
		QnADate = qnADate;
	}
}
