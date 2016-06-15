package com.ktds.eatit.review.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.eatit.constants.Const;
import com.ktds.eatit.member.vo.MemberVO;
import com.ktds.eatit.notice.biz.NoticeBiz;
import com.ktds.eatit.notice.vo.NoticeVO;
import com.ktds.eatit.review.biz.ReviewBiz;
import com.ktds.eatit.review.vo.ReviewListVO;
import com.ktds.eatit.review.vo.ReviewSearchVO;
import com.ktds.eatit.review.vo.ReviewVO;

@Controller
public class ReviewController {
	
	private ReviewBiz reviewBiz;

	public void setReviewBiz(ReviewBiz reviewBiz) {
		this.reviewBiz = reviewBiz;
	}
	
	@RequestMapping("/review/reviewwrite")
	public ModelAndView viewBoardWritePage(@RequestParam(required=false, defaultValue="0" ) int pageNo
			, HttpServletRequest request) {
		
		ModelAndView view = new ModelAndView();
		HttpSession session = request.getSession();
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) != null;
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY);
		view.addObject("loginMemberVO", loginMemberVO);
		
		view.setViewName("review/reviewwrite");
		
		return view;
	}
	
	@RequestMapping("/review/doWrite")
	public ModelAndView doBoardWriteAction(ReviewVO reviewVO) {
		
		ModelAndView view = new ModelAndView();
		
		String subject = reviewVO.getSubject();
		String writer = reviewVO.getWriter();
		String content = reviewVO.getContent();
		
		if(subject == null || subject.length() == 0) {
			view.setViewName("redirect:/review/reviewwrite");
			return view;
		}
		if(writer == null || writer.length() == 0) {
			view.setViewName("redirect:/review/reviewwrite");
			return view;
		}
		if(content == null || content.length() == 0) {
			view.setViewName("redirect:/review/reviewwrite");
			return view;
		}
		
		int insertCount = reviewBiz.insertArticle(reviewVO);
		view.setViewName("redirect:/review/reviewlist");
		
		return view;
		
	}
	
	@RequestMapping("/review/reviewlist")
	public ModelAndView viewReviewListPage(ReviewSearchVO reviewSearchVO, HttpServletRequest request) {
		
		ModelAndView view = new ModelAndView();
		HttpSession session = request.getSession();
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) != null;
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY);
		view.addObject("loginMemberVO", loginMemberVO);
		
		ReviewListVO reviewList = reviewBiz.selectAllArticleList(reviewSearchVO);
		
		view.addObject("ReviewSearchVO", reviewSearchVO);
		view.addObject("reviewList", reviewList);
		view.setViewName("review/reviewlist");
		
		return view;
		
	}
	
	@RequestMapping("review/reviewdetail/{articleId}")
	public ModelAndView viewArticleDetailPage(@PathVariable String articleId, HttpServletRequest request) {
		
		ModelAndView view = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) != null;
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY);
		view.addObject("loginMemberVO", loginMemberVO);
		
		ReviewVO reviewVO = reviewBiz.selectArticleByArticleId(articleId);
		
		view.addObject("article", reviewVO);
		view.setViewName("review/reviewdetail");
		
		return view;
		
	}
	
	@RequestMapping("review/delete")
	public ModelAndView doArticleDeletAction(@RequestParam String articleId) {
		
		ModelAndView view = new ModelAndView();
		
		int deleteCount = reviewBiz.deleteArticle(articleId);
		view.setViewName("redirect:/review/reviewlist");
		return view;		
	}
	
	@RequestMapping("review/reviewupdate/{articleId}")
	public ModelAndView viewArticleUpdatePage(@PathVariable String articleId) {
		
		ModelAndView view = new ModelAndView();
		
		ReviewVO originalArticle = reviewBiz.selectArticleByArticleId(articleId);
		
		view.addObject("originalArticle", originalArticle);
		view.setViewName("review/reviewupdate");
		
		return view;
	
	}

	@RequestMapping("/review/doUpdate")
	public ModelAndView doArticleUpdateAction(ReviewVO reviewVO) {
		
		ModelAndView view = new ModelAndView();
		
		String subject = reviewVO.getSubject();
		String writer = reviewVO.getWriter();
		String content = reviewVO.getContent();
		
		if ( subject == null || subject.length() == 0) {
			view.setViewName("redirect:/review/reviewupdate/" + reviewVO.getArticleId());
			return view;
		}
		if ( writer == null || writer.length() == 0) {
			view.setViewName("redirect:/review/reviewupdate" + reviewVO.getArticleId());
			return view;	
		}
		if ( content == null || content.length() == 0) {
			view.setViewName("redirect:/review/reviewupdate" + reviewVO.getArticleId());
			return view;	
		}
	
		int updateCount = reviewBiz.updateArticle(reviewVO);
		
		view.setViewName("redirect:/review/reviewdetail/" + reviewVO.getArticleId());
	
		return view;
		
	}
}
