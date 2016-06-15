package com.ktds.eatit.qaboard.biz;

import com.ktds.eatit.qaboard.vo.QABoardListVO;
import com.ktds.eatit.qaboard.vo.QABoardSearchVO;
import com.ktds.eatit.qaboard.vo.QABoardVO;

public interface QABoardBiz {

	public int insertArticle(QABoardVO qABoardVO);
	
	public QABoardListVO selectAllArticleList(QABoardSearchVO qABoardSearchVO);
	
	public QABoardVO selectArticleByArticleId(String articleId);
	
	public int deleteArticle(String articleId);

	public int updateArticle(QABoardVO qABoardVO);
}
