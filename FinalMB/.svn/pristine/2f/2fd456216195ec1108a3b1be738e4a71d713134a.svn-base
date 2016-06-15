package com.ktds.eatit.qaboard.dao;

import java.util.List;

import com.ktds.eatit.qaboard.util.Paging;
import com.ktds.eatit.qaboard.vo.QABoardSearchVO;
import com.ktds.eatit.qaboard.vo.QABoardVO;

public interface QABoardDAO {

	public int insertArticle(QABoardVO qABoardVO);
	
	public int selectAllArticleCount(QABoardSearchVO qABoardSearchVO);
	public List<QABoardVO> selectAllArticleList(QABoardSearchVO qABoardSearchVO);
	
	public QABoardVO selectArticleByArticleId(String articleId);

	public int deleteArticle(String articleId);

	public int updateArticle(QABoardVO qABoardVO);
}
