package com.ktds.eatit.message.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ktds.eatit.member.vo.MemberVO;
import com.ktds.eatit.message.util.Paging;
import com.ktds.eatit.message.vo.MessageSearchVO;
import com.ktds.eatit.message.vo.MessageVO;


public interface MessageDAO {

	// 일반 유저에게 메시지 보내기 ty
	public int insertMessage(MessageVO messageVO);
	
	// 전문가에게 메시지 보내기 ty
	public int insertExpertMessage(MessageVO messageVO, HttpSession session);

	
	public int selectAllMessageCount();

	public List<MessageVO> selectAllMessageList(Paging paging);

	public MessageVO selectMessageByMessageId(String messageId);

	public int deleteMessage(String messageId);

	
	
	
	
	//메시지 답장해주기
	public int pickupAnswer(MessageVO messageVO, HttpSession session);
	
	//pickup 메세지 카운트 및 페이징
	
	public int countPickUpMessageCount(MessageSearchVO messageSearchVO);
	public MessageVO countPickUpMessage(MessageSearchVO messageSearchVO);
	
	//메세지 스킵
	public int pickupMessageSkip(MessageVO messageVO);

	
	//상대방에게 답변받은 메시지 보는 쿼리 
	public List<MessageVO> confirmMyMessageWithOtherUsersComment(MessageSearchVO messageSearchVO);
	public int confirmMyMessageWithOtherUsersCommentCount(MessageSearchVO messageSearchVO);

	
	//receive bottle box
	public int confirmMessageBoxCount(MessageSearchVO messageSearchVO);
	public List<MessageVO> confirmMessageBox(MessageSearchVO messageSearchVO);

	
	
	
	//send bottle box
	public int confirmSendBoxCount(MessageSearchVO messageSearchVO);
	public List<MessageVO> confirmSendBox(MessageSearchVO messageSearchVO);
	
	
	//삭제된 메시지
	public int deletedMyMessageBecauseItIsUnsolvedDuringSevenDaysCount(MessageSearchVO messageSearchVO);
	public List<MessageVO> deletedMyMessageBecauseItIsUnsolvedDuringSevenDays(MessageSearchVO messageSearchVO);
		
		
	//처리안된 메시지
	public int unsolvedMyFreshMessageCount(MessageSearchVO messageSearchVO);
	public List<MessageVO> unsolvedMyFreshMessage(MessageSearchVO messageSearchVO);

	
	public MemberVO selectMemberInfo(MemberVO loginMemberVO);

	
	// 전문가가 메시지 온거 확인
	public int expertMessageBoxFromUserCount(MessageSearchVO messageSearchVO);

	public List<MessageVO> expertMessageBoxFromUser(MessageSearchVO messageSearchVO);

	//ang
	public MessageVO ang(String expertMessageId);

	//앙앙
	public int doExpertPickupAnswerToUser(MessageVO messageVO, HttpSession session);

	// 전문가 메시지 확인하는거 카운트랑 리스트
	public int expertCompleteBottleCount(MessageSearchVO messageSearchVO);
	public List<MessageVO> expertCompleteBottle(MessageSearchVO messageSearchVO);


				
			
		
	
	
}
