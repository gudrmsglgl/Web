package com.ktds.eatit.message.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.eatit.constants.Const;
import com.ktds.eatit.free.vo.FreeVO;
import com.ktds.eatit.member.vo.MemberVO;
import com.ktds.eatit.message.biz.MessageBiz;
import com.ktds.eatit.message.vo.MessageListVO;
import com.ktds.eatit.message.vo.MessageSearchVO;
import com.ktds.eatit.message.vo.MessageVO;

@Controller
public class MessageController {

	private MessageBiz messageBiz;

	public void setMessageBiz(MessageBiz messageBiz) {
		this.messageBiz = messageBiz;
	}
	
	
	
	//관리자 페이지
	@RequestMapping("/message/admin")
		
		public ModelAndView adminMessageListPage(@RequestParam(required=false,defaultValue="0") int pageNo
				,HttpServletRequest request) {
			
			ModelAndView view = new ModelAndView();
			
			HttpSession session = request.getSession();
			
			//리스트를 가져온다
			MessageListVO result = messageBiz.selectAllMessageList(pageNo);
		
			boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
			view.addObject("loginStatus", wasLogin);
			
			MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
			view.addObject("loginMemberVO", loginMemberVO); 
			// 여기까지
			
			
			view.addObject("messageList", result);
			view.setViewName("/message/admin");
			
			return view;
	}
	
	
	//관리자 페이지 상세보기
	@RequestMapping("message/addetail/{messageId}")
	
	public ModelAndView viewAdminDetailPage(@PathVariable String messageId,HttpServletRequest request) {
		
		
		ModelAndView view = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; 
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); 
		view.addObject("loginMemberVO", loginMemberVO); 
		
		
		MessageVO messageVO = messageBiz.selectMessageByMessageId(messageId);
		
		
		view.addObject("messageVO", messageVO);
		
	
		view.setViewName("message/addetail");
		
		return view;

	}
	
	//관리자 페이지 삭제
	@RequestMapping("message/delete")
	public ModelAndView messageDeletAction(@RequestParam String messageId) {
		
		ModelAndView view = new ModelAndView();
		
		int deleteCount = messageBiz.deleteMessage(messageId);
		view.setViewName("redirect:/message/admin");
		return view;		
	}
	
	
	

	
	//receive bottle box
	@RequestMapping("/message/receivebbox")
		
		public ModelAndView messageBox(MessageVO messageVO, HttpSession session, MessageSearchVO messageSearchVO) {
		
		ModelAndView view = new ModelAndView();
		/*
		 * 로그인을 했는지 안했는지 체크하는 기능. loginStatus를 이용하여,
		 * 로그인을 안한 사용자가 url을 직접 입력하여 들어올 경우를 막는데 쓰임. 여기서부터
		 */
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO); 
		// 여기까지

		messageSearchVO.setMemberId(loginMemberVO.getMemberId());
		MessageListVO result = messageBiz.confirmMessageBox(messageSearchVO);


		view.addObject("messageList", result);
		
		view.setViewName("message/receivebbox");
		return view;
	}
	
	
	
	//보관함 페이지 상세보기
	@RequestMapping("message/bboxDetail/{messageId}")
	
		public ModelAndView messageBoxDetail(@PathVariable String messageId,HttpServletRequest request) {
		
		
		ModelAndView view = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; 
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); 
		view.addObject("loginMemberVO", loginMemberVO); 
		
		
		MessageVO messageVO = messageBiz.selectMessageByMessageId(messageId);
		
		
		view.addObject("messageVO", messageVO);
		
	
		view.setViewName("message/bboxDetail");
		
		return view;

	}
	

			//send bottle box  내가 고민을 해결한 보관함
			@RequestMapping("/message/sendbbox")
			public ModelAndView sendBottleBox(MessageVO messageVO, HttpSession session, MessageSearchVO messageSearchVO) {
			
			ModelAndView view = new ModelAndView();
		
			
			boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
			view.addObject("loginStatus", wasLogin);
			
			MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
			view.addObject("loginMemberVO", loginMemberVO); 
			
		
			messageSearchVO.setMemberId(loginMemberVO.getMemberId());
			MessageListVO result = messageBiz.confirmSendBox(messageSearchVO);
		
		
			view.addObject("messageList", result);
			
			view.setViewName("message/sendbbox");
			
			return view;
		}

	
	
	
	
    //픽업
	@RequestMapping("/message/pickup")
	public ModelAndView messagePickup(HttpSession session
				,HttpServletResponse response)throws UnsupportedEncodingException  {
		
		ModelAndView view = new ModelAndView();
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO); 
		
		MessageSearchVO messageSearchVO = new MessageSearchVO();
		messageSearchVO.setMemberId(loginMemberVO.getMemberId());
		
		MessageVO result = messageBiz.countPickUpMessage(messageSearchVO);
		
		//여기서 엔터처리

		

		// 여기까지
		
		session.setAttribute("_SEARCH_" , messageSearchVO);
  
		view.addObject("messageSearchVO", messageSearchVO);
		view.addObject("message", result);
		view.setViewName("message/pickup");
		
		return view;
	}
	
	
	@RequestMapping("/message/pickup/ajax")
	public void messagePickupForAjax(
				HttpSession session
				,HttpServletResponse response) throws UnsupportedEncodingException  {
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		if(!wasLogin) {
			return;
		}
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		MessageSearchVO messageSearchVO = new MessageSearchVO();
		messageSearchVO.setMemberId(loginMemberVO.getMemberId());
		int result = messageBiz.countPickUpMessageCount(messageSearchVO);
		
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
			writer.write(result + "");
			writer.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(writer != null) {
				writer.close();
			}
		}

	}
	
	//병 줍기
	@RequestMapping("/message/doPickup")
	public ModelAndView messageDoPickup(HttpSession session,MessageVO messageVO){
		
		ModelAndView view = new ModelAndView();
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO); 
		// 여기까지
		
		System.out.println(messageVO.getMessageId());
		System.out.println(messageVO.getReceiveContent());

		int result = messageBiz.pickupAnswer(messageVO, session);
		
		view.setViewName("redirect:/menuselect");
		return view;
	
	}

	
	//병 흘려보내기 스킵
	@RequestMapping("/message/doPickupSkip")
	public ModelAndView messageDoSkip(MessageVO messageVO,HttpSession session) {
		
		ModelAndView view = new ModelAndView();
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO); 
		
		
		int result = messageBiz.pickupMessageSkip(messageVO ,session);
		
		System.out.println("야호 야호");
		
		view.setViewName("redirect:/menuselect");
		return view;
	}
	
	//전문가가 유저 메시지 보기 화면 ty
	@RequestMapping("/message/expertPickup")
	public ModelAndView expertPickupPage(MessageVO messageVO, HttpSession session, MessageSearchVO messageSearchVO){
		ModelAndView view = new ModelAndView();
			
		/*
		 * 로그인을 했는지 안했는지 체크하는 기능. loginStatus를 이용하여,
		 * 로그인을 안한 사용자가 url을 직접 입력하여 들어올 경우를 막는데 쓰임. 여기서부터
		 */
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO); 
		// 여기까지
		
		messageSearchVO.setMemberId(loginMemberVO.getMemberId());
		MessageListVO result = messageBiz.expertMessageBoxFromUser(messageSearchVO);
		
		view.addObject("MessageList", result);
		
		view.setViewName("message/expertPickup");
		
		return view;
	}
	
	
	@RequestMapping("/message/expertPickup/ajax")
	   public void messageExpertPickupForAjax(HttpSession session, HttpServletResponse response)
	         throws UnsupportedEncodingException {

	      boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) != null; // true로그인을
	                                                               // 했다
	      if (!wasLogin) {
	         return;
	      }

	      MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을
	                                                                     // 했다
	      MessageSearchVO messageSearchVO = new MessageSearchVO();
	      messageSearchVO.setMemberId(loginMemberVO.getMemberId());
	      int result = messageBiz.expertMessageBoxFromUserCount(messageSearchVO);

	      PrintWriter writer = null;
	      try {
	         writer = response.getWriter();
	         writer.write(result + "");
	         writer.flush();
	      } catch (IOException e) {
	         e.printStackTrace();
	      } finally {
	         if (writer != null) {
	            writer.close();
	         }
	      }
	   }
	
	
	
	
	
	
	//전문가가 유저에게 메시지 보낼때 디테일 글 보기 ty
	@RequestMapping("message/expertPickupDetail/{expertMessageId}")
	public ModelAndView viewfreeBoardDetail(@PathVariable String expertMessageId, HttpServletRequest request) {
		
		ModelAndView view = new ModelAndView();
		HttpSession session = request.getSession();

		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) != null; // true로그인을
		view.addObject("loginStatus", wasLogin);

		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을
		view.addObject("loginMemberVO", loginMemberVO);

		MessageVO messageVO = messageBiz.ang(expertMessageId);
		
		// FreeVO freeVO = freeBiz.selectArticleByArticleId(articleId);

		view.addObject("ang", messageVO);
		view.setViewName("message/expertPickupDetail");

		return view;
	}

	
	//전문가가 유저에게 답변 보내주기 ty
	@RequestMapping("/message/doExpertPickupAnswerToUser")
	public ModelAndView doExpertPickupAnswerToUser(MessageVO messageVO,HttpSession session){
		ModelAndView view = new ModelAndView();
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO); 
		// 여기까지
		
		int result = messageBiz.doExpertPickupAnswerToUser(messageVO, session);
		
		view.setViewName("redirect:/message/expertPickup");
		return view;
		
		
	}

	
	@RequestMapping("/menuselect")
	public ModelAndView mainPage(HttpSession session) {
		
		ModelAndView view = new ModelAndView();
		/*
		 * 로그인을 했는지 안했는지 체크하는 기능. loginStatus를 이용하여,
		 * 로그인을 안한 사용자가 url을 직접 입력하여 들어올 경우를 막는데 쓰임. 여기서부터
		 */
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO);
		
		//토드에있는거 값을 최신버전으로 줘야 포인트를 받아올수 있잖아.
		MemberVO updatedMemberVO = messageBiz.selectMemberInfo(loginMemberVO);
		session.setAttribute(Const.SESSION_MEMBER_KEY, updatedMemberVO);
		
		view.addObject("loginMemberVO", updatedMemberVO); 
		// 여기까지
		
		view.setViewName("template/menuselect");
		
		return view;
	}
	
	
	
	

	// 유저에게 보낼지, 전문가에 보낼 지 고르는거 ty
	@RequestMapping("/message/selectMode")
	public ModelAndView selectUserORExpert(HttpSession session){
		ModelAndView view = new ModelAndView();
		/*
		 * 로그인을 했는지 안했는지 체크하는 기능. loginStatus를 이용하여,
		 * 로그인을 안한 사용자가 url을 직접 입력하여 들어올 경우를 막는데 쓰임. 여기서부터
		 */
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO); 
		// 여기까지
		
		view.setViewName("message/selectMode");
		
		return view;
		
	}
	
	
	
	//유저에게 메시지 보내기 ty
	@RequestMapping("/message/writeMessage")
	public ModelAndView viewWriteMessage(HttpSession session) {
		
		ModelAndView view = new ModelAndView();
		
		/*
		 * 로그인을 했는지 안했는지 체크하는 기능. loginStatus를 이용하여,
		 * 로그인을 안한 사용자가 url을 직접 입력하여 들어올 경우를 막는데 쓰임. 여기서부터
		 */
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		
		
		
		//토드에있는거 값을 최신버전으로 줘야 포인트를 받아올수 있잖아.
		MemberVO updatedMemberVO = messageBiz.selectMemberInfo(loginMemberVO);
		session.setAttribute(Const.SESSION_MEMBER_KEY, updatedMemberVO);
		
		
		view.addObject("loginMemberVO", updatedMemberVO); 
		// 여기까지

		view.setViewName("message/writeMessage");
		return view;
	}
	
	//줜문가에게 메시지 보내기 ty
		@RequestMapping("/message/writeMessageExpert")
		public ModelAndView WriteMessageToExpert(HttpSession session) {
			
			ModelAndView view = new ModelAndView();
			
			/*
			 * 로그인을 했는지 안했는지 체크하는 기능. loginStatus를 이용하여,
			 * 로그인을 안한 사용자가 url을 직접 입력하여 들어올 경우를 막는데 쓰임. 여기서부터
			 */
			boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
			view.addObject("loginStatus", wasLogin);
			
			MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
			loginMemberVO.setMyPoint(loginMemberVO.getMyPoint());
			loginMemberVO.setMemberId(loginMemberVO.getMemberId());
			loginMemberVO.setGradeId(loginMemberVO.getGradeId());


			
			view.addObject("loginMemberVO", loginMemberVO); 
			// 여기까지

			view.setViewName("message/writeMessageExpert");
			return view;
		}
		
	
	//일반 유저에게 메시지 작성후 보내는과정 ty
	@RequestMapping("/message/doWriteMessage")
	public ModelAndView viewWriteMessage(MessageVO messageVO
			,HttpSession session) {
		ModelAndView view = new ModelAndView();
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		
		int insertCount = messageBiz.insertMessage(messageVO ,session);
		
		view.setViewName("redirect:/menuselect");
		return view;
	}
	
	// 전문가에게 메시지 작성후 보내는 과정 ty
	@RequestMapping("/message/doWriteMessageExpert")
	public ModelAndView viewWriteMessageToExpert(MessageVO messageVO
			,HttpSession session) {
		ModelAndView view = new ModelAndView();
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다

		int insertExpertCount = messageBiz.insertExpertMessage(messageVO ,session);
		view.setViewName("redirect:/menuselect");
		return view;
	}
	
	
	
	//돌아온 메세지
	@RequestMapping("/message/completeBottle")
	public ModelAndView viewCompleteMessage(HttpSession session, MessageSearchVO messageSearchVO) {
		
		ModelAndView view = new ModelAndView();
		
		/*
		 * 로그인을 했는지 안했는지 체크하는 기능. loginStatus를 이용하여,
		 * 로그인을 안한 사용자가 url을 직접 입력하여 들어올 경우를 막는데 쓰임. 여기서부터
		 */
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO); 
		// 여기까지


		messageSearchVO.setMemberId(loginMemberVO.getMemberId());
		MessageListVO result = messageBiz.confirmMyMessageWithOtherUsersComment(messageSearchVO);
		
		view.addObject("messagiral", result);
		
		view.setViewName("message/completeBottle");
		return view;
	}
	
	
	
	
	
	
	
	
	
	
	//돌아온 메세지 삭제
	@RequestMapping("message/deleteMine")
	public ModelAndView messageDeletMine(@RequestParam String messageId) {
		
		ModelAndView view = new ModelAndView();
		
		int deleteCount = messageBiz.deleteMessage(messageId);
		
		view.setViewName("redirect:/message/completeBottle");
		return view;		
	}
	
	
	
	

	
	
	//삭제된 메시지
		@RequestMapping("/message/deletebbox")
		public ModelAndView deletedMyMessage(MessageVO messageVO, HttpSession session, MessageSearchVO messageSearchVO){
			
			ModelAndView view = new ModelAndView();
			
			/*
			 * 로그인을 했는지 안했는지 체크하는 기능. loginStatus를 이용하여,
			 * 로그인을 안한 사용자가 url을 직접 입력하여 들어올 경우를 막는데 쓰임. 여기서부터
			 */
			boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
			view.addObject("loginStatus", wasLogin);
			
			MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
			view.addObject("loginMemberVO", loginMemberVO); 
			// 여기까지
			
		
			
			messageSearchVO.setMemberId(loginMemberVO.getMemberId());
			MessageListVO result = messageBiz.deletedMyMessageBecauseItIsUnsolvedDuringSevenDays(messageSearchVO);
			
			view.addObject("deleted", result);
			
			
			view.setViewName("/message/deletebbox");
			return view;
			

		}
		
		//해결안된 메시지
		@RequestMapping("/message/unsolvedMessagebbox")
		public ModelAndView unsolvedMyMessage(MessageVO messageVO, HttpSession session, MessageSearchVO messageSearchVO){
			
			ModelAndView view = new ModelAndView();
			
			/*
			 * 로그인을 했는지 안했는지 체크하는 기능. loginStatus를 이용하여,
			 * 로그인을 안한 사용자가 url을 직접 입력하여 들어올 경우를 막는데 쓰임. 여기서부터
			 */
			boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
			view.addObject("loginStatus", wasLogin);
			
			MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
			view.addObject("loginMemberVO", loginMemberVO); 
			// 여기까지
			
			messageSearchVO.setMemberId(loginMemberVO.getMemberId());
			MessageListVO result = messageBiz.unsolvedMyFreshMessage(messageSearchVO);
			
			view.addObject("unsolved", result);
			
			
			view.setViewName("/message/unsolvedMessagebbox");
			return view;
			

		}
	
		//답변 온 내용 확인하는거 일반/전문가 ty
		@RequestMapping("/message/selectCompleteBottle")
		public ModelAndView selectCompleteBottle(HttpSession session) {
			ModelAndView view = new ModelAndView();
			
			/*
			 * 로그인을 했는지 안했는지 체크하는 기능. loginStatus를 이용하여,
			 * 로그인을 안한 사용자가 url을 직접 입력하여 들어올 경우를 막는데 쓰임. 여기서부터
			 */
			boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
			view.addObject("loginStatus", wasLogin);
			
			MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
			view.addObject("loginMemberVO", loginMemberVO); 
			// 여기까지
			
			view.setViewName("/message/selectCompleteBottle");
			return view;
		}
	
	
		//답변 온 내용 확인하는거 일반/전문가 ty
		@RequestMapping("/message/expertCompleteBottle")
		public ModelAndView expertCompleteBottle(MessageVO messageVO, HttpSession session, MessageSearchVO messageSearchVO) {
			ModelAndView view = new ModelAndView();
				
			
			/*
			 * 로그인을 했는지 안했는지 체크하는 기능. loginStatus를 이용하여,
			 * 로그인을 안한 사용자가 url을 직접 입력하여 들어올 경우를 막는데 쓰임. 여기서부터
			 */
			boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
			view.addObject("loginStatus", wasLogin);
			
			MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
			view.addObject("loginMemberVO", loginMemberVO); 
			// 여기까지
			
			messageSearchVO.setMemberId(loginMemberVO.getMemberId());
			MessageListVO result = messageBiz.expertCompleteBottle(messageSearchVO);
			
			view.setViewName("/message/expertCompleteBottle");
			
			view.addObject("messageList", result);
			return view;
		}
	
	
}
