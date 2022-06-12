package com.nakwon.domain;

public class IntroduceVO {
	private int IntroCode; 
	private String IntroTitle;
	private String IntroContent;
	private String IntroImg;	
	
	@Override
	public String toString() {
		return "IntroduceVO [IntroCode=" + IntroCode + ", IntroTitle=" + IntroTitle + ", IntroContent=" + IntroContent
				+ ", IntroImg=" + IntroImg + "]";
	}
	public int getIntroCode() {
		return IntroCode;
	}
	public void setIntroCode(int introCode) {
		IntroCode = introCode;
	}
	public String getIntroTitle() {
		return IntroTitle;
	}
	public void setIntroTitle(String introTitle) {
		IntroTitle = introTitle;
	}
	public String getIntroContent() {
		return IntroContent;
	}
	public void setIntroContent(String introContent) {
		IntroContent = introContent;
	}
	public String getIntroImg() {
		return IntroImg;
	}
	public void setIntroImg(String introImg) {
		IntroImg = introImg;
	}	
}
