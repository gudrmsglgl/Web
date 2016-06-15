package com.ktds.eatit.notice.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ktds.eatit.notice.vo.NoticeSearchVO;
import com.ktds.eatit.notice.util.Paging;
import com.ktds.eatit.notice.vo.NoticeVO;

public class NoticeDAOImpl extends SqlSessionDaoSupport implements NoticeDAO{

	@Override
	public int insertArticle(NoticeVO noticeVO) {
		
		int insertCount = getSqlSession().insert("noticeDAO.insertArticle", noticeVO);		
		return insertCount;
	}

	@Override
	public int selectAllArticleCount(NoticeSearchVO noticeSearchVO) {
		int articleCount = getSqlSession().selectOne("noticeDAO.selectCountAllArticleList");
		return articleCount;
	}

	@Override
	public List<NoticeVO> selectAllArticleList(NoticeSearchVO noticeSearchVO) {
		List<NoticeVO> articleList = getSqlSession().selectList("noticeDAO.selectAllArticleList", noticeSearchVO);
		return articleList;
	}

	@Override
	public NoticeVO selectArticleByArticleId(String articleId) {
		
		NoticeVO article = getSqlSession().selectOne("noticeDAO.selectArticleByArticleId", articleId);
		
		return article;
	}

	@Override
	public int deleteArticle(String articleId) {
		
		int deleteCount = getSqlSession().delete("noticeDAO.deleteArticle", articleId);
		
		return deleteCount;
	}

	@Override
	public int updateArticle(NoticeVO noticeVO) {
		
		int updateCount = getSqlSession().update("noticeDAO.updateArticle", noticeVO);
		return updateCount;
	}

}
