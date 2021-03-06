package com.ktds.eatit.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.eatit.constants.Const;
import com.ktds.eatit.member.biz.MemberBiz;
import com.ktds.eatit.member.util.AjaxUtil;
import com.ktds.eatit.member.vo.MemberVO;
import com.ktds.eatit.message.vo.MessageVO;

@Controller
public class MemberController {

	private MemberBiz memberBiz;

	public MemberBiz getMemberBiz() {
		return memberBiz;
	}
	
	public void setMemberBiz(MemberBiz memberBiz) {
		this.memberBiz = memberBiz;
	}
	
	
	
	//일반회원 및 전문가 회원 셀렉트 
	@RequestMapping("/member/registSelect")
	public String selectRegist(){
		return "member/registSelect";
	}
	
	
	//일반회원 가입
	@RequestMapping("/member/regist")
	public String memberRegist(){
		return "member/regist";
	}
	
	@RequestMapping("/member/doRegist")
	public ModelAndView doRegistAction(MemberVO memberVO) {
		
		ModelAndView view = new ModelAndView();
		
		String memberId = memberVO.getMemberId();
		String password = memberVO.getMemberPassword();
		String name = memberVO.getMemberName();

		
		if (memberId == null || memberId.length() == 0) {
			view.setViewName("redirect:/member/regist");
			return view;
		}

		if (password == null || password.length() == 0) {
			view.setViewName("redirect:/member/regist");
			return view;
		}

		if (name == null || name.length() == 0) {
			view.setViewName("redirect:/member/regist");
			return view;
		}	
			
		
	int insertCount = memberBiz.insertMember(memberVO);
	view.setViewName("redirect:/member/login");
		
	return view;
	
	}
	
	//전문가 회원 가입 등록
	@RequestMapping("/member/doExpertRegist")
	public ModelAndView doExpertRegistAction(MemberVO memberVO) {
		
		ModelAndView view = new ModelAndView();
		
		String memberId = memberVO.getMemberId();
		String password = memberVO.getMemberPassword();
		String name = memberVO.getMemberName();
		String licenseNumber = memberVO.getLicenseNumber();
		String bankNumber = memberVO.getBankNumber();
		String email = memberVO.getEmail();

		
		if (memberId == null || memberId.length() == 0) {
			view.setViewName("redirect:/member/regist");
			return view;
		}

		if (password == null || password.length() == 0) {
			view.setViewName("redirect:/member/regist");
			return view;
		}

		if (name == null || name.length() == 0) {
			view.setViewName("redirect:/member/regist");
			return view;
		}	
		if (licenseNumber == null || licenseNumber.length() == 0) {
			view.setViewName("redirect:/member/regist");
			return view;
		}	
		if (bankNumber == null || bankNumber.length() == 0) {
			view.setViewName("redirect:/member/regist");
			return view;
		}	
		if (email == null || email.length() == 0) {
			view.setViewName("redirect:/member/regist");
			return view;
		}	
			
		
	int insertExpertMembers = memberBiz.insertExpertMember(memberVO);
	view.setViewName("redirect:/member/login");
		
	return view;
	
	}
	
	
	//전문가 가입
	@RequestMapping("/member/expertRegist")
	public String expertRegist(){
		return "member/expertRegist";
	}
	
	
	

	/*-------------회원아이디 중복 처리 --- */	
	//아이디 중복 체크 추가
	@RequestMapping("/member/isDuplicateMemberId")
	public void isDuplicateMemberId(HttpServletResponse response, @RequestParam String memberId) {

		int idCount = memberBiz.selectCountByMemberId(memberId);

		AjaxUtil.sendResponse(response, idCount + "");
	}

	
	

	@RequestMapping("/member/login")
	public ModelAndView viewLoginPage(
			HttpServletRequest request,
			@RequestParam(required=false, defaultValue="")String url) {
		ModelAndView view = new ModelAndView();
		
		
		HttpSession session = request.getSession();
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null;
		
		if (wasLogin ) {
			
			String referer = request.getHeader("Referer");
			
			if (referer == null || referer.length() == 0) {
				referer = "/menuselect";
				
			}
			
			view.setViewName("redirect:" + referer); //마치 없었다는 듯이..
			
			return view;
		}
		
		
		if(url.length() > 0) {
			view.addObject("url", url);
		}
		
		view.setViewName("member/login");
		
		return view;
		
	}	
	
	
	@RequestMapping("/doLogin")
	public ModelAndView doLoginAction(@RequestParam(required=false, defaultValue="") String url
			, HttpSession session, MemberVO memberVO) {
		ModelAndView view = new ModelAndView();
		
		boolean isExistsID = memberBiz.isExistsID(memberVO.getMemberId());
		
		//비밀번호가 정확한지 체크
		if(isExistsID) {
			
			boolean isValidPasswordWithMemberID = 
					memberBiz.isValidPasswordWithMemberID(memberVO);
			
			if( isValidPasswordWithMemberID ) {
				
				MemberVO memberInfo = memberBiz.selectMemberInfoByMemberIdAndPassword(memberVO);
				session.setAttribute(Const.SESSION_MEMBER_KEY, memberInfo);
				System.out.println(memberInfo.getMyPoint());
				
			}
			else {
				
				view.addObject("errorCode", "2");
				view.setViewName("member/login");
				
				if(url.length() >0 ) {
					view.addObject("url", url);
				}
				return view;
			}
		}
		
		else {
			
			view.addObject("errorCode", "2");
			view.setViewName("member/login");
			
			if(url.length() >0 ) {
				view.addObject("url", url);
			}
			return view;
		}
		if( url.length() > 0 ) {
			view.setViewName("redirect:" + url);
	}
		else {
		
		view.setViewName("redirect:/menuselect");
		}
		return view;
	}
	
	
	
	@RequestMapping("/member/info")
	public ModelAndView memberInfo(MemberVO memberVO, HttpSession session) {
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
		
		MemberVO confirm = memberBiz.confirmInformation(loginMemberVO);
		view.addObject("memberVO", confirm);
		
		view.setViewName("memberInfo/info");
		return view;
  
	}
	
	
	
	//탈퇴
	@RequestMapping("/member/unregister")
	public ModelAndView unregister(HttpSession session) {

		ModelAndView view = new ModelAndView();
		
		/*
		 * 로그인을 했는지 안했는지 체크하는 기능. loginStatus를 이용하여, 로그인을 안한 사용자가 url을 직접 입력하여
		 * 들어올 경우를 막는데 쓰임. 여기서부터
		 */
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) != null; // true로그인을
																					// 했다
		view.addObject("loginStatus", wasLogin);

		MemberVO memberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을
		view.addObject("loginMemberVO", memberVO);
		// 여기까지

		view.setViewName("memberInfo/unregister");
		return view;
	}
	
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/member/login";
	}	
	
	
	@RequestMapping("/member/dropMember")
	public ModelAndView dropOurMember(HttpSession session, String memberId) {

		ModelAndView view = new ModelAndView();

		MemberVO memberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY);
		memberId = memberVO.getMemberId();

		// 세션에 있는 해당아이디의 회원정보 삭제
		int deleteCount = memberBiz.deleteMember(memberId);
		view.setViewName("redirect:/logout");
		
		return view;
	}
	
	
	
	
	//희정이 정보 수정
	@RequestMapping("/member/checkPassword")
	public ModelAndView checkThePassword(MemberVO memberVO, HttpSession session) {
		
		ModelAndView view = new ModelAndView();
		
		//
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) != null; // true로그인을
		view.addObject("loginStatus", wasLogin);
		//
		
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO); 
		
		
		MemberVO checkVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY);
		System.out.println(checkVO.getMemberId());
		System.out.println(checkVO.getMemberPassword());
		
		
		MemberVO confirm = memberBiz.confirmInformation(loginMemberVO);
		
		
		view.addObject("checkVO", checkVO);
		view.setViewName("memberInfo/pwCheck");
		return view;
	}
	

	

	@RequestMapping("/memberInfo/infomodify")
	public ModelAndView infomodify(HttpSession session, MemberVO memberVO) {
		
		ModelAndView view = new ModelAndView();
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO);
		// 여기까지
		
		MemberVO confirm = memberBiz.confirmInformation(loginMemberVO);	//자기 정보만 불러옴
		view.addObject("memberVO", confirm);
		
		view.setViewName("/memberInfo/infomodify");
		return view;
	}
	
	
	@RequestMapping("/doUpdate")
	public ModelAndView doInfoModify(MemberVO memberVO, HttpSession session) {
		
		ModelAndView view = new ModelAndView();
		
		String memberPassword = memberVO.getMemberPassword();
		String memberPasswordConfirm = memberVO.getMemberPasswordConfirm();
		String email = memberVO.getEmail();
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) !=null; // true로그인을 했다
		view.addObject("loginStatus", wasLogin);
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다
		view.addObject("loginMemberVO", loginMemberVO); 
		
		if ( memberPassword == null || memberPassword.length() == 0) {
			view.setViewName("redirect:/memberInfo/infomodify" + memberVO.getMemberPassword());
			return view;
		}
		
		if ( memberPasswordConfirm == null || memberPasswordConfirm.length() == 0) {
			view.setViewName("redirect:/memberInfo/infomodify" + memberVO.getMemberPasswordConfirm());
			return view;
		}
		
		if ( email == null || email.length() == 0) {
			view.setViewName("redirect:/memberInfo/infomodify" + memberVO.getEmail());
			return view;
		}
		
		
		memberVO.setMemberId(loginMemberVO.getMemberId());
		memberVO.setMemberName(loginMemberVO.getMemberName());
		
		int updateCount = memberBiz.updateMemberInfo(memberVO);
		
		view.setViewName("redirect:/member/info");
		
		return view;
	}
	
	@RequestMapping("/member/expertInfo")
	public ModelAndView viewExpertInfoPage(HttpSession session) {
		ModelAndView view = new ModelAndView();
		
		/*
		 * 로그인을 했는지 안했는지 체크하는 기능. loginStatus를 이용하여, 로그인을 안한 사용자가 url을 직접 입력하여
		 * 들어올 경우를 막는데 쓰임. 여기서부터
		 */
		
		boolean wasLogin = session.getAttribute(Const.SESSION_MEMBER_KEY) != null; // true로그인을
																					// 했다
		view.addObject("loginStatus", wasLogin);

		MemberVO memberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을
		view.addObject("loginMemberVO", memberVO);
		// 여기까지
		
		view.setViewName("/member/expertInfo");
		return view;
	}
	
	
	//결제1 2016/05/23 김형근 
	@RequestMapping("/member/paySelect")
	public ModelAndView memberPay(MemberVO memberVO, HttpSession session) {
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
		
		MemberVO confirm = memberBiz.confirmInformation(loginMemberVO);
		view.addObject("memberVO", confirm);
		
		view.setViewName("member/paySelect");
		return view;
  
	}
	
	@RequestMapping("/member/pay1000")
	public ModelAndView Pay1000(HttpSession session) {
		
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
		
		view.addObject("loginMemberVO", loginMemberVO); 
		// 여기까지

		view.setViewName("member/pay1000");
		return view;
	}
	
	
	//포인트 충전 실행
	@RequestMapping("/member/doPay1000")
	public ModelAndView doPay1000(MemberVO memberVO
			,HttpSession session) {
		ModelAndView view = new ModelAndView();
		
		MemberVO loginMemberVO = (MemberVO) session.getAttribute(Const.SESSION_MEMBER_KEY); // true로그인을 했다

		int pay = memberBiz.payPoint1000(loginMemberVO);
		view.setViewName("redirect:/menuselect");
		return view;
	}

	
	
}
