package com.nakwon.domain;
//기준
public class Criteria {
	private int page; //페이지
	private int perPageNum; //한 페이지에 출력될 목록 수 
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <= 0) { //페이지가 0보다 작거나 같은 경우, 1페이지로 한다. 
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) {
			perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public Criteria() { //생성자
		super();
		this.page = 1; //기본 1페이지에서 시작.
		this.perPageNum = 10; //한 페이지에 출력될 목록 수를 10으로 정함.
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
}

