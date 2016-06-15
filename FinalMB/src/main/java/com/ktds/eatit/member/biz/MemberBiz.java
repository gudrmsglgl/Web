package com.ktds.eatit.member.biz;

import javax.servlet.http.HttpSession;

import com.ktds.eatit.member.vo.MemberVO;
import com.ktds.eatit.message.vo.MessageVO;

public interface MemberBiz {
	
	public int insertMember(MemberVO memberVO);
	
	public int selectCountByMemberId(String memberId);

	public boolean isExistsID(String memberId);

	public boolean isValidPasswordWithMemberID(MemberVO memberVO);

	public MemberVO selectMemberInfoByMemberIdAndPassword(MemberVO memberVO);
	
	public MemberVO confirmInformation(MemberVO loginMemberVO);
	
	public int updateMemberInfo(MemberVO memberVO);

	public int deleteMember(String memberId);

	
	//전문가 가입해요 ty
	public int insertExpertMember(MemberVO memberVO);

	//결제 1000포인트
	public int pay1000(MemberVO memberVO);

	public int payPoint1000(MemberVO loginMemberVO);
}
