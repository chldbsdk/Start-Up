package com.nakwon.domain;

public class Criteria {
	private int page;
	private int perPageNum;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <= 0) { 
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
	
	public Criteria() {
		super();
		this.page = 1;
		this.perPageNum = 10; 
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
}
