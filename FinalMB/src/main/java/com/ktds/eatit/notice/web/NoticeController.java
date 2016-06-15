package com.ktds.eatit.notice.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.eatit.notice.vo.NoticeSearchVO;
import com.ktds.eatit.constants.Const;
import com.ktds.eatit.member.vo.MemberVO;
import com.ktds.eatit.message.vo.MessageListVO;
import com.ktds.eatit.notice.biz.NoticeBiz;
import com.ktds.eatit.notice.vo.NoticeListVO;
import com.ktds.eatit.notice.vo.NoticeVO;

@Controller
public class NoticeController {

	private NoticeBiz noticeBiz;

	public void setNoticeBiz(NoticeBiz noticeBiz) {
		this.noticeBiz = noticeBiz;
	}
	
	@RequestMapping("/notice/write")

		public ModelAndView viewBoardWritePage(@RequestParam(required=false,defaultValue="0") int pageNo
				,HttpServletRequest request) {
			
			ModelAndView view = new ModelAndView();
			
			HttpSession session = request.getSession();
			
	
		
			boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
			view.addObject("loginStatus", wasLogin);
			
			MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
			view.addObject("loginMemberVO", loginMemberVO); 
			// 여기까지
			
		
			view.setViewName("/notice/write");
			
			return view;
		
	}
	
	@RequestMapping("/notice/doWrite")
	public ModelAndView doBoardWriteAction(NoticeVO noticeVO) {
		
		ModelAndView view = new ModelAndView();
		
		String subject = noticeVO.getSubject();
		String writer = noticeVO.getWriter();
		String content = noticeVO.getContent();
		
		if (subject == null || subject.length() ==0) {
			view.setViewName("redirect:/notice/write");
			return view;
		}
		if (writer == null || writer.length() ==0) {
			view.setViewName("redirect:/notice/write");
			return view;	
		}
		if (content == null || content.length() ==0) {
			view.setViewName("redirect:/notice/write");
			return view;	
		}
		
		int insertCount = noticeBiz.insertArticle(noticeVO);
		view.setViewName("redirect:/notice/list");
		
		return view;
	}
	
	
	
	@RequestMapping("/notice/list")
	
	public ModelAndView viewNoticeListPage(NoticeSearchVO noticeSearchVO, HttpServletRequest request) {
		
		ModelAndView view = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO); 
		
		
		NoticeListVO result = noticeBiz.selectAllArticleList(noticeSearchVO);
		
		view.addObject("noticeSearchVO", noticeSearchVO);
		view.addObject("noticeList", result);
		view.setViewName("notice/list");
		
		
		return view;
	}
	
	
	
	@RequestMapping("notice/detail/{articleId}")
	
	public ModelAndView viewArticleDetailPage(@PathVariable String articleId,HttpServletRequest request) {
		
		
		ModelAndView view = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO); 
		
		NoticeVO noticeVO = noticeBiz.selectArticleByArticleId(articleId);
		
		
		view.addObject("article", noticeVO);
		
		
		
		view.setViewName("notice/detail");
		
		return view;

	}
	
	@RequestMapping("notice/delete")
	public ModelAndView doArticleDeletAction(@RequestParam String articleId) {
		
		ModelAndView view = new ModelAndView();
		
		int deleteCount = noticeBiz.deleteArticle(articleId);
		view.setViewName("redirect:/notice/list");
		
		return view;		
	}
	
	@RequestMapping("notice/update/{articleId}")
	public ModelAndView viewArticleUpdatePage(@PathVariable String articleId) {
		
		ModelAndView view = new ModelAndView();
		
		NoticeVO originalArticle = noticeBiz.selectArticleByArticleId(articleId);
		
		view.addObject("originalArticle", originalArticle);
		view.setViewName("notice/update");
		
		return view;
	}
	
	@RequestMapping("/notice/doUpdate")
	public ModelAndView doArticleUpdateAction(NoticeVO noticeVO) {
		
		ModelAndView view = new ModelAndView();
		
		String subject = noticeVO.getSubject();
		String writer = noticeVO.getWriter();
		String content = noticeVO.getContent();
		
		if ( subject == null || subject.length() == 0) {
			view.setViewName("redirect:/notice/update/" + noticeVO.getArticleId());
			return view;
		}
		if ( writer == null || writer.length() == 0) {
			view.setViewName("redirect:/notice/update" + noticeVO.getArticleId());
			return view;	
		}
		if ( content == null || content.length() == 0) {
			view.setViewName("redirect:/notice/update" + noticeVO.getArticleId());
			return view;	
		}
		
		int updateCount = noticeBiz.updateArticle(noticeVO);
		
		view.setViewName("redirect:/notice/detail/" + noticeVO.getArticleId());
		
		return view;
	}
	
}
