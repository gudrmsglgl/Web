package com.ktds.eatit.member.biz;

import javax.servlet.http.HttpSession;

import com.ktds.eatit.member.dao.MemberDAO;
import com.ktds.eatit.member.vo.MemberVO;
import com.ktds.eatit.message.vo.MessageVO;

public class MemberBizImpl implements MemberBiz {

	private MemberDAO memberDAO;


	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}


	@Override
	public int insertMember(MemberVO memberVO) {
		return memberDAO.insertMember(memberVO);
	}


	@Override
	public int selectCountByMemberId(String memberId) {
		return memberDAO.selectCountByMemberId(memberId);
	}


	@Override
	public boolean isExistsID(String memberId) {
		int selectCount = memberDAO.selectCountByMemberId(memberId);
		return selectCount > 0;
	}


	@Override
	public boolean isValidPasswordWithMemberID(MemberVO memberVO) {
		int selectCount = memberDAO.selectCountByMemberIdAndPassword(memberVO);
		return selectCount > 0;
	}


	@Override
	public MemberVO selectMemberInfoByMemberIdAndPassword(MemberVO memberVO) {
		MemberVO memberInfo = memberDAO.selectMemberInfoByMemberIdAndPassword(memberVO);
		return memberInfo;
	}
	
	@Override
	public MemberVO confirmInformation(MemberVO loginMemberVO) {
		return memberDAO.confirmInformation(loginMemberVO);
	}
	
	@Override
	public int updateMemberInfo(MemberVO memberVO) {
		
		boolean willUpdate = false;
		
		//원본 데이터
		MemberVO originalInfo = this.confirmInformation(memberVO);
		
		MemberVO updatedMemberInfo = new MemberVO();
		updatedMemberInfo.setMemberId(memberVO.getMemberId());
		
		String updatedPassword = memberVO.getMemberPassword();
		String originalPassword = originalInfo.getMemberPassword();
		
		if( !originalPassword.equals(updatedPassword)) {
			willUpdate = true;
			updatedMemberInfo.setMemberPassword(updatedPassword);
		}
		
		String updatedEmail = memberVO.getEmail();
		String originalEmail = originalInfo.getEmail();
		
		if( !originalEmail.equals(updatedEmail)) {
			willUpdate = true;
			updatedMemberInfo.setEmail(updatedEmail);
		}
		
		if( willUpdate ) {
			return memberDAO.updateMemberInfo(updatedMemberInfo);
		}
		return 0;
		
	}


	@Override
	public int deleteMember(String memberId) {
		// TODO Auto-generated method stub
		return memberDAO.deleteMember(memberId);
	}

	// 전문가 가입해요 ty
	@Override
	public int insertExpertMember(MemberVO memberVO) {
		return memberDAO.insertExpertMember(memberVO);
	}


	@Override
	public int pay1000(MemberVO memberVO) {
		return memberDAO.pay1000(memberVO);
	}
	@Override
	public int payPoint1000(MemberVO loginMemberVO){
		return memberDAO.payPoint1000(loginMemberVO);
	}
	
	
}
