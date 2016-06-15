package com.ktds.eatit.free.vo;

import java.util.List;

public class FreeSearchVO {
	
	private String pageNo;
	private int startArticleNumber;
	private int endArticleNumber;

	private String searchKeyword;
	private List<String> searchType;
	
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	public int getStartArticleNumber() {
		return startArticleNumber;
	}
	public void setStartArticleNumber(int startArticleNumber) {
		this.startArticleNumber = startArticleNumber;
	}
	public int getEndArticleNumber() {
		return endArticleNumber;
	}
	public void setEndArticleNumber(int endArticleNumber) {
		this.endArticleNumber = endArticleNumber;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public List<String> getSearchType() {
		return searchType;
	}
	public void setSearchType(List<String> searchType) {
		this.searchType = searchType;
	}
}
