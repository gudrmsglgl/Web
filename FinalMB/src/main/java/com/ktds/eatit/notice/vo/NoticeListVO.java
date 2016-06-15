package com.ktds.eatit.notice.vo;

import java.util.List;

import com.ktds.eatit.notice.util.Paging;

public class NoticeListVO {

	private List<NoticeVO> noticeList;
	private Paging paging;
	
	public List<NoticeVO> getNoticeList() {
		return noticeList;
	}
	public void setNoticeList(List<NoticeVO> noticeList) {
		this.noticeList = noticeList;
	}
	public Paging getPaging() {
		return paging;
	}
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	
}
