package com.ktds.eatit.message.biz;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import com.ktds.eatit.constants.Const;
import com.ktds.eatit.member.dao.MemberDAO;
import com.ktds.eatit.member.vo.MemberVO;
import com.ktds.eatit.message.dao.MessageDAO;
import com.ktds.eatit.message.util.Paging;
import com.ktds.eatit.message.vo.MessageListVO;
import com.ktds.eatit.message.vo.MessageSearchVO;
import com.ktds.eatit.message.vo.MessageVO;

public class MessageBizImpl implements MessageBiz {

	private MessageDAO messageDAO;
	private MemberDAO memberDAO;

	public void setMessageDAO(MessageDAO messageDAO) {
		this.messageDAO = messageDAO;
	}

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public MessageListVO selectAllMessageList(int pageNumber) {

		int MessageCount = messageDAO.selectAllMessageCount();

		Paging paging = new Paging();
		paging.setTotalArticleCount(MessageCount);
		paging.setPageNumber(pageNumber + "");

		List<MessageVO> MessageList = messageDAO.selectAllMessageList(paging);

		MessageListVO listVO = new MessageListVO();
		listVO.setMessageList(MessageList);
		listVO.setPaging(paging);

		return listVO;

	}

	@Override
	public int insertMessage(MessageVO messageVO, HttpSession session) {

		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을
																							// 했다
		messageVO.setSendMemberId(loginMemberVO.getMemberId());

		// content 엔터 처리
		String sendContent = messageVO.getSendContent();
		sendContent = sendContent.replaceAll("\n", "<br/>");
		sendContent = sendContent.replaceAll("\r", "");
		messageVO.setSendContent(sendContent);
		// content 엔터 처리

		while (true) {
			int totalMemberCount = memberDAO.selectCountAllMember();
			Random random = new Random();
			totalMemberCount = random.nextInt(totalMemberCount)+1;
			String memberId = memberDAO.selectRandomMember(totalMemberCount);
			messageVO.setReceiveMemberId(memberId);

			if (!loginMemberVO.getMemberId().equals(memberId)) {
				break;
			}
		}

		// 포인트 차감 기능! ty
		loginMemberVO.setMyPoint(loginMemberVO.getMyPoint());
		memberDAO.byeMyPoint(loginMemberVO);

		return messageDAO.insertMessage(messageVO);
	}

	// 전문가에게 메시지 보내기 ty
	@Override
	public int insertExpertMessage(MessageVO messageVO, HttpSession session) {

		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을
																							// 했다
		messageVO.setSendMemberId(loginMemberVO.getMemberId());

		// 전문가에게 메시지 보낼때 포인트 차감되는것 ty - memberDAO로 넘어감.
		loginMemberVO.setMyPoint(loginMemberVO.getMyPoint());
		memberDAO.byeMyPointExpert(loginMemberVO);

		return messageDAO.insertExpertMessage(messageVO, session);
	}

	@Override
	public MessageVO selectMessageByMessageId(String messageId) {
		// TODO Auto-generated method stub

		return messageDAO.selectMessageByMessageId(messageId);
	}

	@Override
	public int deleteMessage(String messageId) {
		// TODO Auto-generated method stub
		return messageDAO.deleteMessage(messageId);
	}

	// pickup 메세지 카운트 및 페이징
	@Override
	public MessageVO countPickUpMessage(MessageSearchVO messageSearchVO) {
		// TODO Auto-generated method stub

		int totalMessageCount = messageDAO.countPickUpMessageCount(messageSearchVO);

		if (totalMessageCount == 0) {
			return null;
		}

		Random random = new Random();
		totalMessageCount = random.nextInt(totalMessageCount) + 1;
		messageSearchVO.setCount(totalMessageCount);

		MessageVO message = messageDAO.countPickUpMessage(messageSearchVO);
		String scontent = message.getSendContent();
		scontent = scontent.replaceAll("<br/>", "\n");
		message.setSendContent(scontent);

		return message;
	}

	@Override
	public int countPickUpMessageCount(MessageSearchVO messageSearchVO) {
		return messageDAO.countPickUpMessageCount(messageSearchVO);
	}

	@Override
	public int pickupAnswer(MessageVO messageVO, HttpSession session) {

		// 일반 유저에게 답변해 줄 때 포인트 적립됨. ty - memberDAO로 넘어감.
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을
																							// 했다
		messageVO.setSendMemberId(loginMemberVO.getMemberId());

		loginMemberVO.setMyPoint(loginMemberVO.getMyPoint());
		memberDAO.hiPointExpert(loginMemberVO);
		// 이렇게 네줄.

		return messageDAO.pickupAnswer(messageVO, session);
	}

	@Override
	public int pickupMessageSkip(MessageVO messageVO, HttpSession session) {

		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을
																							// 했다
		messageVO.setSendMemberId(loginMemberVO.getMemberId());

		while (true) {

			int totalMemberCount = memberDAO.selectCountAllMember();
			Random random = new Random();
			totalMemberCount = random.nextInt(totalMemberCount)+1;
			String memberId = memberDAO.selectRandomMember(totalMemberCount);
			messageVO.setReceiveMemberId(memberId);

			if (!loginMemberVO.getMemberId().equals(memberId)) {
				System.out.println(memberId);
				break;

			}
		}

		return messageDAO.pickupMessageSkip(messageVO);
	}

	// 상대방에게 답변받은 메시지 보는 쿼리
	@Override
	public MessageListVO confirmMyMessageWithOtherUsersComment(MessageSearchVO messageSearchVO) {

		int nonSolvedMyMessageCount = messageDAO.confirmMyMessageWithOtherUsersCommentCount(messageSearchVO);

		Paging paging = new Paging(1, 10);
		paging.setTotalArticleCount(nonSolvedMyMessageCount);
		paging.setPageNumber(messageSearchVO.getPageNo());
		messageSearchVO.setStartArticleNumber(paging.getStartArticleNumber());
		messageSearchVO.setEndArticleNumber(paging.getEndArticleNumber());

		MessageListVO result = new MessageListVO();

		List<MessageVO> messageList = messageDAO.confirmMyMessageWithOtherUsersComment(messageSearchVO);

		result.setMessageList(messageList);
		result.setPaging(paging);
		return result;
	}

	// receive bottle box
	@Override
	public MessageListVO confirmMessageBox(MessageSearchVO messageSearchVO) {
		// TODO Auto-generated method stub
		int bboxCount = messageDAO.confirmMessageBoxCount(messageSearchVO);

		Paging paging = new Paging(10, 10);
		paging.setTotalArticleCount(bboxCount);
		paging.setPageNumber(messageSearchVO.getPageNo());
		messageSearchVO.setStartArticleNumber(paging.getStartArticleNumber());
		messageSearchVO.setEndArticleNumber(paging.getEndArticleNumber());

		MessageListVO result = new MessageListVO();

		List<MessageVO> messageList = messageDAO.confirmMessageBox(messageSearchVO);

		result.setMessageList(messageList);
		result.setPaging(paging);
		return result;
	}

	// send bottle box
	@Override
	public MessageListVO confirmSendBox(MessageSearchVO messageSearchVO) {

		// TODO Auto-generated method stub
		int sendboxCount = messageDAO.confirmSendBoxCount(messageSearchVO);

		Paging paging = new Paging(10, 10);
		paging.setTotalArticleCount(sendboxCount);
		paging.setPageNumber(messageSearchVO.getPageNo());
		messageSearchVO.setStartArticleNumber(paging.getStartArticleNumber());
		messageSearchVO.setEndArticleNumber(paging.getEndArticleNumber());

		MessageListVO result = new MessageListVO();

		List<MessageVO> messageList = messageDAO.confirmSendBox(messageSearchVO);

		result.setMessageList(messageList);
		result.setPaging(paging);
		return result;
	}

	// 삭제된 메시지
	@Override
	public MessageListVO deletedMyMessageBecauseItIsUnsolvedDuringSevenDays(MessageSearchVO messageSearchVO) {

		int deletedCount = messageDAO.deletedMyMessageBecauseItIsUnsolvedDuringSevenDaysCount(messageSearchVO);

		Paging paging = new Paging(10, 10);
		paging.setTotalArticleCount(deletedCount);
		paging.setPageNumber(messageSearchVO.getPageNo());
		messageSearchVO.setStartArticleNumber(paging.getStartArticleNumber());
		messageSearchVO.setEndArticleNumber(paging.getEndArticleNumber());

		MessageListVO result = new MessageListVO();

		List<MessageVO> messageList = messageDAO.deletedMyMessageBecauseItIsUnsolvedDuringSevenDays(messageSearchVO);

		result.setMessageList(messageList);
		result.setPaging(paging);
		return result;
	}

	// 삭제된 메시지
	@Override
	public MessageListVO unsolvedMyFreshMessage(MessageSearchVO messageSearchVO) {

		int unsolvedCount = messageDAO.unsolvedMyFreshMessageCount(messageSearchVO);

		Paging paging = new Paging(10, 10);
		paging.setTotalArticleCount(unsolvedCount);
		paging.setPageNumber(messageSearchVO.getPageNo());
		messageSearchVO.setStartArticleNumber(paging.getStartArticleNumber());
		messageSearchVO.setEndArticleNumber(paging.getEndArticleNumber());

		MessageListVO result = new MessageListVO();

		List<MessageVO> messageList = messageDAO.unsolvedMyFreshMessage(messageSearchVO);

		result.setMessageList(messageList);
		result.setPaging(paging);
		return result;
	}

	@Override
	public MemberVO selectMemberInfo(MemberVO loginMemberVO) {
		return messageDAO.selectMemberInfo(loginMemberVO);
	}

	@Override
	public MessageListVO expertMessageBoxFromUser(MessageSearchVO messageSearchVO) {
		
		int expertMessageCount = messageDAO.expertMessageBoxFromUserCount(messageSearchVO);
		
		Paging paging = new Paging(10, 10);
		paging.setTotalArticleCount(expertMessageCount);
		paging.setPageNumber(messageSearchVO.getPageNo());
		messageSearchVO.setStartArticleNumber(paging.getStartArticleNumber());
		messageSearchVO.setEndArticleNumber(paging.getEndArticleNumber());
		
		MessageListVO result = new MessageListVO();
		
		List<MessageVO> messageList = messageDAO.expertMessageBoxFromUser(messageSearchVO);
		
		result.setMessageList(messageList);
		result.setPaging(paging);
		
		return result;
	}
	
	@Override
	public MessageVO ang(String expertMessageId) {
		return messageDAO.ang(expertMessageId);
	}
	
	@Override
	public int doExpertPickupAnswerToUser(MessageVO messageVO, HttpSession session) {
		messageVO.setExpertMessageId(messageVO.getExpertMessageId());

		return messageDAO.doExpertPickupAnswerToUser(messageVO, session);
}
	
	@Override
	public MessageListVO expertCompleteBottle(MessageSearchVO messageSearchVO) {

		//페이징
		int expertReceiveBoxCount = messageDAO.expertCompleteBottleCount(messageSearchVO);
		
		Paging paging = new Paging(1,10);
		paging.setTotalArticleCount(expertReceiveBoxCount);
		paging.setPageNumber(messageSearchVO.getPageNo());
		messageSearchVO.setStartArticleNumber(paging.getStartArticleNumber());
		messageSearchVO.setEndArticleNumber(paging.getEndArticleNumber());
		
		//메시지 리스트 받아오기
		MessageListVO result = new MessageListVO();
		
		List<MessageVO> messageList = messageDAO.expertCompleteBottle(messageSearchVO);
		
		result.setMessageList(messageList);
		result.setPaging(paging);
		
		return result;
	}
	
	
	@Override
	   public int expertMessageBoxFromUserCount(MessageSearchVO messageSearchVO) {
	      return messageDAO.expertMessageBoxFromUserCount(messageSearchVO);
	      
	   }
	
}