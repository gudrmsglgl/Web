package com.ktds.eatit.member.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ktds.eatit.member.vo.MemberVO;

public class MemberDAOImpl extends SqlSessionDaoSupport implements MemberDAO {

	@Override
	public int insertMember(MemberVO memberVO) {
		
		int insertCount = getSqlSession().insert("memberDAO.insertMember", memberVO);
		return insertCount;
	}
	
	

	@Override
	public int selectCountByMemberId(String memberId) {
		int selectCount = getSqlSession().selectOne("memberDAO.selectCountByMemberId", memberId);
		return selectCount;
	}
	@Override
	public int selectCountAllMember() {
		int selectCount = getSqlSession().selectOne("memberDAO.selectCountAllMember");
		return selectCount;
	}
	
	//맴버 랜덤 선택
	@Override
	public String selectRandomMember(int rownum) {
		return getSqlSession().selectOne("memberDAO.selectRandomMember", rownum);
	}

	
	

	@Override
	public int selectCountByMemberIdAndPassword(MemberVO memberVO) {
		int selectCount = getSqlSession().selectOne("memberDAO.selectCountByMemberIdAndPassword", memberVO);
		return selectCount;
	}

	
	@Override
	public MemberVO selectMemberInfoByMemberIdAndPassword(MemberVO memberVO) {
		
		MemberVO memberInfo = getSqlSession().selectOne("selectMemberInfoByMemberIdAndPassword", memberVO);
		
		return memberInfo;
	}
	
	@Override
	public MemberVO confirmInformation(MemberVO loginMemberVO) {
		MemberVO confirm = getSqlSession().selectOne("memberDAO.confirmInformation", loginMemberVO);
		return confirm;
	}

	@Override
	public int updateMemberInfo(MemberVO memberVO) {

		int updateCount = getSqlSession().update("memberDAO.updateMemberInfo", memberVO);
		return updateCount;
	}

	@Override
	public int deleteMember(String memberId) {
		int deleteCount = getSqlSession().delete("memberDAO.deleteMember", memberId);
		return deleteCount;
	}
	
	// 일반 유저 - 글 쓸때 포인트 차감 ty
	@Override
	public int byeMyPoint(MemberVO loginMemberVO) {
		int point = getSqlSession().update("memberDAO.byeMyPoint", loginMemberVO);
		return point;
	}


	// 전문가에게 - 글 쓸때 포인트 차감 ty
	@Override
	public int byeMyPointExpert(MemberVO loginMemberVO) {
		int Epoint = getSqlSession().update("memberDAO.byeMyPointExpert", loginMemberVO);
		return Epoint;
		
	}
	
	// 일반 유저 - 답변해 줄 때 포인트 적립 ty
	@Override
	public int hiPointExpert(MemberVO loginMemberVO) {
		int getMyPoint = getSqlSession().update("memberDAO.hiPointExpert", loginMemberVO);
		return getMyPoint;		
	}
	
	@Override
	public int insertExpertMember(MemberVO memberVO) {
		int insertExpertMembers = getSqlSession().insert("memberDAO.insertExpertMember", memberVO);
		return 0;
	}


	//포인트 결제
	@Override
	public int pay1000(MemberVO memberVO) {
		int pay1000 = getSqlSession().insert("memberDAO.pay1000", memberVO);
		return 0;
	}
	

	@Override
	public int payPoint1000(MemberVO loginMemberVO) {
		int Point1000 = getSqlSession().update("memberDAO.payPoint1000", loginMemberVO);
		return Point1000;
	}

	
	
}
