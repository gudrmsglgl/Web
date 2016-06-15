package com.ktds.eatit.qaboard.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ktds.eatit.qaboard.util.Paging;
import com.ktds.eatit.qaboard.vo.QABoardSearchVO;
import com.ktds.eatit.qaboard.vo.QABoardVO;

public class QABoardDAOImpl extends SqlSessionDaoSupport implements QABoardDAO{

	@Override
	public int insertArticle(QABoardVO qABoardVO) {
		
		int insertCount = getSqlSession().insert("qABoardDAO.insertArticle", qABoardVO);		
		return insertCount;
	}

	@Override
	public int selectAllArticleCount(QABoardSearchVO qABoardSearchVO) {
		int articleCount = getSqlSession().selectOne("qABoardDAO.selectCountAllArticleList");
		return articleCount;
	}

	@Override
	public List<QABoardVO> selectAllArticleList(QABoardSearchVO qABoardSearchVO) {
		List<QABoardVO> articleList = getSqlSession().selectList("qABoardDAO.selectAllArticleList", qABoardSearchVO);
		return articleList;
	}

	@Override
	public QABoardVO selectArticleByArticleId(String articleId) {
		
		QABoardVO article = getSqlSession().selectOne("qABoardDAO.selectArticleByArticleId", articleId);
		
		return article;
	}

	@Override
	public int deleteArticle(String articleId) {
		
		int deleteCount = getSqlSession().delete("qABoardDAO.deleteArticle", articleId);
		
		return deleteCount;
	}

	@Override
	public int updateArticle(QABoardVO qABoardVO) {
		
		int updateCount = getSqlSession().update("qABoardDAO.updateArticle", qABoardVO);
		return updateCount;
	}

}
