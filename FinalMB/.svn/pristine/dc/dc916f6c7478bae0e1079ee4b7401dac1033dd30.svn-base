package com.ktds.eatit.member.dao;

import com.ktds.eatit.member.vo.MemberVO;

public interface MemberDAO {

	public int insertMember(MemberVO memberVO);

	public int selectCountByMemberId(String memberId);
	public int selectCountAllMember();
	
	
	//랜덤 맴버
	public String selectRandomMember(int rownum);

	
	
	public MemberVO selectMemberInfoByMemberIdAndPassword(MemberVO memberVO);

	public int selectCountByMemberIdAndPassword(MemberVO memberVO);

	public MemberVO confirmInformation(MemberVO loginMemberVO);
	
	public int updateMemberInfo(MemberVO memberVO);

	public int deleteMember(String memberId);

	
	//일반 유저에게 보낼때 포인트 차감! ty - messageBiz에서 받아옴
	public int byeMyPoint(MemberVO loginMemberVO);

	//전문가에게 보낼때 포인트 차감 ty - messageBiz에서 받아옴
	public int byeMyPointExpert(MemberVO loginMemberVO);

	//답변 해줄때마다 포인트가 증가되어요 ty- messageBiz 에서 받아옴
	public int hiPointExpert(MemberVO loginMemberVO);

	//전문가 가입해요 ty
	public int insertExpertMember(MemberVO memberVO);
	
	
	
	//1000포인트 결제
	public int pay1000(MemberVO memberVO);
	
	public int payPoint1000(MemberVO loginMemberVO);

	
	
}
