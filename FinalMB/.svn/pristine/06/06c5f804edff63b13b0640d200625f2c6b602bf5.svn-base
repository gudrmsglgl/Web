package com.ktds.eatit.free.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ktds.eatit.free.vo.FreeSearchVO;
import com.ktds.eatit.free.vo.FreeVO;

public class FreeDAOImpl extends SqlSessionDaoSupport implements FreeDAO {

	@Override
	public int insertArticle(FreeVO freeVO) {
		int insertCount = getSqlSession().insert("freeDAO.insertArticle", freeVO);
		return insertCount;
	}

	@Override
	public int selectAllArticleCount(FreeSearchVO freeSearchVO) {
		int articleCount = getSqlSession().selectOne("freeDAO.selectCountAllArticleList");
		return articleCount;
	}

	@Override
	public List<FreeVO> selectAllArticleList(FreeSearchVO freeSearchVO) {
		List<FreeVO> articleList = getSqlSession().selectList("freeDAO.selectAllArticleList", freeSearchVO);
		return articleList;
	}

	@Override
	public FreeVO selectArticleByArticleId(String articleId) {
		FreeVO article = getSqlSession().selectOne("freeDAO.selectArticleByArticleId", articleId);
		return article;
	}

	@Override
	public int deleteArticle(String articleId) {
		int deleteCount = getSqlSession().delete("freeDAO.deleteArticle", articleId);
		return deleteCount;
	}

	@Override
	public int updateArticle(FreeVO freeVO) {
		int updateCount = getSqlSession().update("freeDAO.updateArticle", freeVO);
		return updateCount;
	}

}
