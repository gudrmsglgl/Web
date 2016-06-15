package com.ktds.eatit.free.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.eatit.constants.Const;
import com.ktds.eatit.free.biz.FreeBiz;
import com.ktds.eatit.free.vo.FreeListVO;
import com.ktds.eatit.free.vo.FreeSearchVO;
import com.ktds.eatit.free.vo.FreeVO;
import com.ktds.eatit.member.vo.MemberVO;


@Controller
public class FreeController {

	private FreeBiz freeBiz;

	public FreeBiz getFreeBiz() {
		return freeBiz;
	}

	public void setFreeBiz(FreeBiz freeBiz) {
		this.freeBiz = freeBiz;
	}

	@RequestMapping("/free/freeBoardWrite")
	public ModelAndView viewBoardWritePage(@RequestParam(required = false, defaultValue ="0") int pageNo,
			HttpServletRequest request) {
		ModelAndView view = new ModelAndView();

		HttpSession session = request.getSession();

		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) != null; // true로그인을
																					// 했다
		view.addObject("loginStatus", wasLogin);

		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을
																							// 했다
		view.addObject("loginMemberVO", loginMemberVO);
		// 여기까지
		
		view.setViewName("free/freeBoardWrite");
		return view;

	}

	@RequestMapping("/free/doWrite")
	public ModelAndView doBoardWriteAction(FreeVO freeVO) {

		ModelAndView view = new ModelAndView();

		String subject = freeVO.getSubject();
		String writer = freeVO.getWriter();
		String content = freeVO.getContent();

		if (subject == null || subject.length() == 0) {
			view.setViewName("redirect:/free/freeBoardWrite");
			return view;
		}
		if (writer == null || writer.length() == 0) {
			view.setViewName("redirect:/free/freeBoardWrite");
			return view;
		}
		if (content == null || content.length() == 0) {
			view.setViewName("redirect:/free/freeBoardWrite");
			return view;
		}

		int insertCount = freeBiz.insertArticle(freeVO);
		view.setViewName("redirect:/free/freeBoardList");

		return view;
	}

	@RequestMapping("free/freeBoardList")
	public ModelAndView viewfreeBoardList(FreeSearchVO freeSearchVO, HttpServletRequest request) {

		ModelAndView view = new ModelAndView();
		HttpSession session = request.getSession();

		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) != null; // true로그인을
		view.addObject("loginStatus", wasLogin);

		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을
		view.addObject("loginMemberVO", loginMemberVO);

		FreeListVO freeList = freeBiz.selectAllArticleList(freeSearchVO);

		view.addObject("FreeSearchVO", freeSearchVO);
		view.addObject("freeList", freeList);
		view.setViewName("free/freeBoardList");
		return view;
	}

	@RequestMapping("free/freeBoardDetail/{articleId}")
	public ModelAndView viewfreeBoardDetail(@PathVariable String articleId, HttpServletRequest request) {
		
		ModelAndView view = new ModelAndView();
		HttpSession session = request.getSession();

		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) != null; // true로그인을
		view.addObject("loginStatus", wasLogin);

		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을
		view.addObject("loginMemberVO", loginMemberVO);

		FreeVO freeVO = freeBiz.selectArticleByArticleId(articleId);

		view.addObject("article", freeVO);
		view.setViewName("free/freeBoardDetail");

		return view;
	}
	
	@RequestMapping("free/delete")
	public ModelAndView doArticleDeletAction(@RequestParam String articleId) {
		
		ModelAndView view = new ModelAndView();
		
		int deleteCount = freeBiz.deleteArticle(articleId);
		view.setViewName("redirect:/free/freeBoardList");
		
		return view;		
	}
	
	@RequestMapping("free/freeBoardUpdate/{articleId}")
	public ModelAndView viewArticleUpdatePage(@PathVariable String articleId) {
		
		ModelAndView view = new ModelAndView();
		
		FreeVO originalArticle = freeBiz.selectArticleByArticleId(articleId);
		
		view.addObject("originalArticle", originalArticle);
		view.setViewName("free/freeBoardUpdate");
		
		return view;
	}
	
	@RequestMapping("/free/doUpdate")
	public ModelAndView doArticleUpdateAction(FreeVO freeVO) {
		
		ModelAndView view = new ModelAndView();
		
		String subject = freeVO.getSubject();
		String writer = freeVO.getWriter();
		String content = freeVO.getContent();
		
		if ( subject == null || subject.length() == 0) {
			view.setViewName("redirect:/free/freeBoardUpdate/" + freeVO.getArticleId());
			return view;
		}
		if ( writer == null || writer.length() == 0) {
			view.setViewName("redirect:/free/freeBoardUpdate" + freeVO.getArticleId());
			return view;	
		}
		if ( content == null || content.length() == 0) {
			view.setViewName("redirect:/free/freeBoardUpdate" + freeVO.getArticleId());
			return view;	
		}
		
		int updateCount = freeBiz.updateArticle(freeVO);
		
		view.setViewName("redirect:/free/freeBoardDetail/" + freeVO.getArticleId());
		
		return view;
	}
	

}
