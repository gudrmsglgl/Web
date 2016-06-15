package com.ktds.eatit.review.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ktds.eatit.notice.vo.NoticeVO;
import com.ktds.eatit.review.util.Paging;
import com.ktds.eatit.review.vo.ReviewSearchVO;
import com.ktds.eatit.review.vo.ReviewVO;

public class ReviewDAOImpl extends SqlSessionDaoSupport implements ReviewDAO {

	@Override
	public int insertArticle(ReviewVO reviewVO) {
		int insertCount = getSqlSession().insert("reviewDAO.insertArticle", reviewVO);
		return insertCount;
	}

	@Override
	public int selectAllArticleCount(ReviewSearchVO reviewSearchVO) {
		int articleCount = getSqlSession().selectOne("reviewDAO.selectCountAllArticleList");
		return articleCount;
	}

	@Override
	public List<ReviewVO> selectAllArticleList(ReviewSearchVO reviewSearchVO) {
		List<ReviewVO> articleList = getSqlSession().selectList("reviewDAO.selectAllArticleList", reviewSearchVO);
		return articleList;
	}
	@Override
	public ReviewVO selectArticleByArticleId(String articleId) {
		
		ReviewVO article = getSqlSession().selectOne("reviewDAO.selectArticleByArticleId", articleId);
		
		return article;
	}

	@Override
	public int deleteArticle(String articleId) {
		
		int deleteCount = getSqlSession().delete("reviewDAO.deleteArticle", articleId);
		
		return deleteCount;
	}

	@Override
	public int updateArticle(ReviewVO reviewVO) {
		
		int updateCount = getSqlSession().update("reviewDAO.updateArticle", reviewVO);
		return updateCount;
	}

}
