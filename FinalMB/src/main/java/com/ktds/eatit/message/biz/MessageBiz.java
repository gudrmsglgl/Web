package com.ktds.eatit.message.biz;

import javax.servlet.http.HttpSession;

import com.ktds.eatit.member.vo.MemberVO;
import com.ktds.eatit.message.vo.MessageListVO;
import com.ktds.eatit.message.vo.MessageSearchVO;
import com.ktds.eatit.message.vo.MessageVO;

public interface MessageBiz {

	public int insertMessage(MessageVO messageVO, HttpSession session);

	public MessageListVO selectAllMessageList(int pageNumber);

	// 관리자 페이지 디테일 및 삭제
	public MessageVO selectMessageByMessageId(String messageId);

	public int deleteMessage(String messageId);

	// pickup 메세지 카운트
	public MessageVO countPickUpMessage(MessageSearchVO messageSearchVO);

	public int countPickUpMessageCount(MessageSearchVO messageSearchVO);

	// 메세지 답변
	public int pickupAnswer(MessageVO messageVO, HttpSession session);

	// 메세지 스킵
	public int pickupMessageSkip(MessageVO messageVO, HttpSession session);

	// 상대방에게 답변받은 메시지 보는 쿼리
	public MessageListVO confirmMyMessageWithOtherUsersComment(MessageSearchVO messageSearchVO);

	// bbox confirmMessageBox
	public MessageListVO confirmMessageBox(MessageSearchVO messageSearchVO);

	// 내가 고민을 해결한 메세지 리스트 send bottle box
	public MessageListVO confirmSendBox(MessageSearchVO messageSearchVO);

	// 삭제된 메세지
	public MessageListVO deletedMyMessageBecauseItIsUnsolvedDuringSevenDays(MessageSearchVO messageSearchVO);

	// 처리되지 않은 메세지
	public MessageListVO unsolvedMyFreshMessage(MessageSearchVO messageSearchVO);

	public MemberVO selectMemberInfo(MemberVO loginMemberVO);

	// 전문가에게 메세지 보내기 
	public int insertExpertMessage(MessageVO messageVO, HttpSession session);

	// 전문가 메시지함 확인
	public MessageListVO expertMessageBoxFromUser(MessageSearchVO messageSearchVO);

	//
	public MessageVO ang(String expertMessageId);

	// 
	public int doExpertPickupAnswerToUser(MessageVO messageVO, HttpSession session);

	// 전문가에게 메시지 온거 확인.
	public MessageListVO expertCompleteBottle(MessageSearchVO messageSearchVO);

	
	
	public int expertMessageBoxFromUserCount(MessageSearchVO messageSearchVO);
	
}
