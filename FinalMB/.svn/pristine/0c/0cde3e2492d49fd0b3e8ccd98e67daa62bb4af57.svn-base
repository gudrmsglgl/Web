package com.ktds.eatit.message.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ktds.eatit.member.vo.MemberVO;
import com.ktds.eatit.message.util.Paging;
import com.ktds.eatit.message.vo.MessageSearchVO;
import com.ktds.eatit.message.vo.MessageVO;

public class MessageDAOImpl extends SqlSessionDaoSupport implements MessageDAO {

	// 일반 유저에게 메시지 보내기 ty
	@Override
	public int insertMessage(MessageVO messageVO) {
		int insertCount = getSqlSession().insert("messageDAO.writeMyMessageToOtherUser", messageVO);
		return insertCount;
	}

	// 전문가에게 메시지 보내기 ty
	@Override
	public int insertExpertMessage(MessageVO messageVO, HttpSession session) {

		return getSqlSession().insert("messageDAO.insertExpertMessage", messageVO);
	}

	@Override
	public int selectAllMessageCount() {
		int articleCount = getSqlSession().selectOne("messageDAO.selectCountAllMessageList");
		return articleCount;
	}

	@Override
	public List<MessageVO> selectAllMessageList(Paging paging) {
		List<MessageVO> articleList = getSqlSession().selectList("messageDAO.selectAllMessageList", paging);
		return articleList;
	}

	@Override
	public MessageVO selectMessageByMessageId(String messageId) {
		// TODO Auto-generated method stub
		MessageVO messageVO = getSqlSession().selectOne("messageDAO.selectMessageByMessageId", messageId);
		return messageVO;
	}

	@Override
	public int deleteMessage(String messageId) {
		// TODO Auto-generated method stub
		int deleteCount = getSqlSession().delete("messageDAO.deleteMessage", messageId);

		return deleteCount;
	}

	// pickup 메세지 카운트 및 페이징
	/*
	 * @Override public int countPickUpMessage() { int messageCount=
	 * getSqlSession().selectOne("messageDAO.countPickUpMessage"); return
	 * messageCount; }
	 * 
	 * 
	 * @Override public List<MessageVO> countPickUpMessageList(Paging paging) {
	 * // TODO Auto-generated method stub List<MessageVO> countPickUpMessageList
	 * = getSqlSession().selectList("messageDAO.countPickUpMessageList",
	 * paging); return countPickUpMessageList; }
	 */

	@Override
	public int countPickUpMessageCount(MessageSearchVO messageSearchVO) {
		int totalMessageCount = getSqlSession().selectOne("messageDAO.countPickUpMessageCount", messageSearchVO);
		return totalMessageCount;
	}

	@Override
	public MessageVO countPickUpMessage(MessageSearchVO messageSearchVO) {
		MessageVO message = getSqlSession().selectOne("messageDAO.countPickUpMessage", messageSearchVO);
		return message;
	}

	@Override
	public int pickupAnswer(MessageVO messageVO, HttpSession session) {
		int messagee = getSqlSession().update("messageDAO.pickupAnswer", messageVO);
		return messagee;
	}

	// 메세지 스킵
	@Override
	public int pickupMessageSkip(MessageVO messageVO) {
		int skip = getSqlSession().update("messageDAO.pickupMessageSkip", messageVO);
		return skip;
	}

	// 상대방에게 답변받은 메시지 보는 쿼리
	@Override
	public List<MessageVO> confirmMyMessageWithOtherUsersComment(MessageSearchVO messageSearchVO) {
		List<MessageVO> result = getSqlSession().selectList("messageDAO.confirmMyMessageWithOtherUsersComment",
				messageSearchVO);
		return result;
	}

	@Override
	public int confirmMyMessageWithOtherUsersCommentCount(MessageSearchVO messageSearchVO) {
		int msgct = getSqlSession().selectOne("messageDAO.confirmMyMessageWithOtherUsersCommentCount", messageSearchVO);
		return msgct;
	}

	// receive bbox
	@Override
	public List<MessageVO> confirmMessageBox(MessageSearchVO messageSearchVO) {
		List<MessageVO> result = getSqlSession().selectList("messageDAO.confirmMessageBox", messageSearchVO);
		return result;
	}

	@Override
	public int confirmMessageBoxCount(MessageSearchVO messageSearchVO) {
		int messagebbox = getSqlSession().selectOne("messageDAO.confirmMessageBoxCount", messageSearchVO);
		return messagebbox;
	}

	// send bbox
	@Override
	public List<MessageVO> confirmSendBox(MessageSearchVO messageSearchVO) {
		List<MessageVO> result = getSqlSession().selectList("messageDAO.confirmSendBox", messageSearchVO);
		return result;
	}

	@Override
	public int confirmSendBoxCount(MessageSearchVO messageSearchVO) {
		int sendmessagebbox = getSqlSession().selectOne("messageDAO.confirmSendBoxCount", messageSearchVO);
		return sendmessagebbox;
	}

	// 삭제된 메시징
	@Override
	public List<MessageVO> deletedMyMessageBecauseItIsUnsolvedDuringSevenDays(MessageSearchVO messageSearchVO) {
		List<MessageVO> result = getSqlSession()
				.selectList("messageDAO.deletedMyMessageBecauseItIsUnsolvedDuringSevenDays", messageSearchVO);
		return result;
	}

	@Override
	public int deletedMyMessageBecauseItIsUnsolvedDuringSevenDaysCount(MessageSearchVO messageSearchVO) {
		int deletedmsg = getSqlSession().selectOne("messageDAO.deletedMyMessageBecauseItIsUnsolvedDuringSevenDaysCount",
				messageSearchVO);
		return deletedmsg;
	}

	// 처리안된 메시징
	@Override
	public List<MessageVO> unsolvedMyFreshMessage(MessageSearchVO messageSearchVO) {
		List<MessageVO> result = getSqlSession().selectList("messageDAO.unsolvedMyFreshMessage", messageSearchVO);
		return result;
	}

	@Override
	public int unsolvedMyFreshMessageCount(MessageSearchVO messageSearchVO) {
		int deletedmsg = getSqlSession().selectOne("messageDAO.unsolvedMyFreshMessageCount", messageSearchVO);
		return deletedmsg;
	}

	@Override
	public MemberVO selectMemberInfo(MemberVO loginMemberVO) {
		return getSqlSession().selectOne("selectMemberInfoByMemberIdAndPassword", loginMemberVO);
	}

	@Override
	public List<MessageVO> expertMessageBoxFromUser(MessageSearchVO messageSearchVO) {
		List<MessageVO> result = getSqlSession().selectList("messageDAO.expertMessageBoxFromUser", messageSearchVO);
		return result;
	}

	@Override
	public int expertMessageBoxFromUserCount(MessageSearchVO messageSearchVO) {
		int expertMessageBox = getSqlSession().selectOne("messageDAO.expertMessageBoxFromUserCount", messageSearchVO);
		return expertMessageBox;
	}
	
	@Override
	public MessageVO ang(String expertMessageId) {
		MessageVO angang = getSqlSession().selectOne("messageDAO.angang", expertMessageId); 
		return angang;
	}

	@Override
	public int doExpertPickupAnswerToUser(MessageVO messageVO, HttpSession session) {
		int expertReceive = getSqlSession().update("messageDAO.doExpertPickupAnswerToUser", messageVO);
		return expertReceive;
	}
	
	@Override
	public List<MessageVO> expertCompleteBottle(MessageSearchVO messageSearchVO) {
		List<MessageVO> result = getSqlSession().selectList("messageDAO.expertCompleteBottle", messageSearchVO);
		
		return result;
	}
	
	@Override
	public int expertCompleteBottleCount(MessageSearchVO messageSearchVO) {
		
		int expertMessageBox = getSqlSession().selectOne("messageDAO.expertCompleteBottleCount", messageSearchVO);
		
		return expertMessageBox;
	}
}
