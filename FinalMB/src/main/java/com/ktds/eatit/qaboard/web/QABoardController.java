package com.ktds.eatit.qaboard.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.eatit.constants.Const;
import com.ktds.eatit.member.vo.MemberVO;
import com.ktds.eatit.message.vo.MessageListVO;
import com.ktds.eatit.qaboard.biz.QABoardBiz;
import com.ktds.eatit.qaboard.vo.QABoardListVO;
import com.ktds.eatit.qaboard.vo.QABoardSearchVO;
import com.ktds.eatit.qaboard.vo.QABoardVO;

@Controller
public class QABoardController {

	private QABoardBiz qABoardBiz;


	public void setqABoardBiz(QABoardBiz qABoardBiz) {
		this.qABoardBiz = qABoardBiz;
	}

	@RequestMapping("/qaboard/qawrite")

		public ModelAndView viewBoardWritePage(@RequestParam(required=false,defaultValue="0") int pageNo
				,HttpServletRequest request) {
			
			ModelAndView view = new ModelAndView();
			
			HttpSession session = request.getSession();
			
	
		
			boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
			view.addObject("loginStatus", wasLogin);
			
			MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
			view.addObject("loginMemberVO", loginMemberVO); 
			// 여기까지
			
		
			view.setViewName("/qaboard/qawrite");
			
			return view;
		
	}
	
	@RequestMapping("/qaboard/doWrite")
	public ModelAndView doBoardWriteAction(QABoardVO qABoardVO) {
		
		ModelAndView view = new ModelAndView();
		
		String subject = qABoardVO.getSubject();
		String writer = qABoardVO.getWriter();
		String content = qABoardVO.getContent();
		
		if (subject == null || subject.length() ==0) {
			view.setViewName("redirect:/qaboard/qawrite");
			return view;
		}
		if (writer == null || writer.length() ==0) {
			view.setViewName("redirect:/qaboard/qawrite");
			return view;	
		}
		if (content == null || content.length() ==0) {
			view.setViewName("redirect:/qaboard/qawrite");
			return view;	
		}
		
		int insertCount = qABoardBiz.insertArticle(qABoardVO);
		view.setViewName("redirect:/qaboard/qalist");
		
		return view;
	}
	
	
	
	@RequestMapping("/qaboard/qalist")
	
	public ModelAndView viewNoticeListPage(QABoardSearchVO qABoardSearchVO, HttpServletRequest request) {
		
		ModelAndView view = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO); 
		
		
		QABoardListVO result = qABoardBiz.selectAllArticleList(qABoardSearchVO);
		
		view.addObject("qABoardSearchVO", qABoardSearchVO);
		view.addObject("qABoardList", result);
		view.setViewName("/qaboard/qalist");
		
		
		return view;
	}
	
	
	
	@RequestMapping("qaboard/qadetail/{articleId}")
	
	public ModelAndView viewArticleDetailPage(@PathVariable String articleId,HttpServletRequest request) {
		
		
		ModelAndView view = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO); 
		
		QABoardVO qABoardVO = qABoardBiz.selectArticleByArticleId(articleId);
		
		view.addObject("article", qABoardVO);
	
		view.setViewName("/qaboard/qadetail");
		
		return view;

	}
	
	@RequestMapping("qaboard/qadelete")
	public ModelAndView doArticleDeletAction(@RequestParam String articleId) {
		
		ModelAndView view = new ModelAndView();
		
		int deleteCount = qABoardBiz.deleteArticle(articleId);
		view.setViewName("redirect:/qaboard/qalist");
		return view;		
	}
	
	@RequestMapping("qaboard/qaupdate/{articleId}")
	public ModelAndView viewArticleUpdatePage(@PathVariable String articleId) {
		
		ModelAndView view = new ModelAndView();
		
		QABoardVO originalArticle = qABoardBiz.selectArticleByArticleId(articleId);
		
		view.addObject("originalArticle", originalArticle);
		view.setViewName("/qaboard/qaupdate");
		
		return view;
	}
	
	@RequestMapping("/qaboard/doUpdate")
	public ModelAndView doArticleUpdateAction(QABoardVO qABoardVO) {
		
		ModelAndView view = new ModelAndView();
		
		String subject = qABoardVO.getSubject();
		String writer = qABoardVO.getWriter();
		String content = qABoardVO.getContent();
		
		if ( subject == null || subject.length() == 0) {
			view.setViewName("redirect:/qaboard/qaupdate/" + qABoardVO.getArticleId());
			return view;
		}
		if ( writer == null || writer.length() == 0) {
			view.setViewName("redirect:/qaboard/qaupdate" + qABoardVO.getArticleId());
			return view;	
		}
		if ( content == null || content.length() == 0) {
			view.setViewName("redirect:/qaboard/qaupdate" + qABoardVO.getArticleId());
			return view;	
		}
		
		int updateCount = qABoardBiz.updateArticle(qABoardVO);
		
		view.setViewName("redirect:/qaboard/qadetail/" + qABoardVO.getArticleId());
		
		return view;
	}
	

}
