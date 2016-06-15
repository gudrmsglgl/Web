package com.ktds.eatit.qaboard.vo;

import java.util.List;

import com.ktds.eatit.qaboard.util.Paging;

public class QABoardListVO {

	private List<QABoardVO> qABoardList;
	private Paging paging;
	
	public List<QABoardVO> getqABoardList() {
		return qABoardList;
	}
	public void setqABoardList(List<QABoardVO> qABoardList) {
		this.qABoardList = qABoardList;
	}
	public Paging getPaging() {
		return paging;
	}
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
		
}
