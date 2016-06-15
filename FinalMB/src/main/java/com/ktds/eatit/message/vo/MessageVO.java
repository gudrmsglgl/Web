package com.ktds.eatit.message.vo;

import com.ktds.eatit.member.vo.MemberVO;

public class MessageVO extends MemberVO {

	private String messageId;
	private String keywordFirst;
	private String keywordSecond;
	private String categoryId;
	private String receiveContent;
	private String sendContent;
	private String receiveWriteDate;
	private String sendWriteDate;	
	private String receiveMemberId;
	private String sendMemberId;
	
	private String expertMessageId;
	private String expertSendSubject;
	private String expertSendContent;
	private String expertReceiveSubject;
	private String expertReceiveContent;
	
	public String getMessageId() {
		return messageId;
	}
	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}
	public String getKeywordFirst() {
		return keywordFirst;
	}
	public void setKeywordFirst(String keywordFirst) {
		this.keywordFirst = keywordFirst;
	}
	public String getKeywordSecond() {
		return keywordSecond;
	}
	public void setKeywordSecond(String keywordSecond) {
		this.keywordSecond = keywordSecond;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getReceiveContent() {
		return receiveContent;
	}
	public void setReceiveContent(String receiveContent) {
		this.receiveContent = receiveContent;
	}
	public String getSendContent() {
		return sendContent;
	}
	public void setSendContent(String sendContent) {
		this.sendContent = sendContent;
	}
	public String getReceiveWriteDate() {
		return receiveWriteDate;
	}
	public void setReceiveWriteDate(String receiveWriteDate) {
		this.receiveWriteDate = receiveWriteDate;
	}
	public String getSendWriteDate() {
		return sendWriteDate;
	}
	public void setSendWriteDate(String sendWriteDate) {
		this.sendWriteDate = sendWriteDate;
	}
	public String getReceiveMemberId() {
		return receiveMemberId;
	}
	public void setReceiveMemberId(String receiveMemberId) {
		this.receiveMemberId = receiveMemberId;
	}
	public String getSendMemberId() {
		return sendMemberId;
	}
	public void setSendMemberId(String sendMemberId) {
		this.sendMemberId = sendMemberId;
	}
	public String getExpertMessageId() {
		return expertMessageId;
	}
	public void setExpertMessageId(String expertMessageId) {
		this.expertMessageId = expertMessageId;
	}
	public String getExpertSendSubject() {
		return expertSendSubject;
	}
	public void setExpertSendSubject(String expertSendSubject) {
		this.expertSendSubject = expertSendSubject;
	}
	public String getExpertSendContent() {
		return expertSendContent;
	}
	public void setExpertSendContent(String expertSendContent) {
		this.expertSendContent = expertSendContent;
	}
	public String getExpertReceiveSubject() {
		return expertReceiveSubject;
	}
	public void setExpertReceiveSubject(String expertReceiveSubject) {
		this.expertReceiveSubject = expertReceiveSubject;
	}
	public String getExpertReceiveContent() {
		return expertReceiveContent;
	}
	public void setExpertReceiveContent(String expertReceiveContent) {
		this.expertReceiveContent = expertReceiveContent;
	}

}