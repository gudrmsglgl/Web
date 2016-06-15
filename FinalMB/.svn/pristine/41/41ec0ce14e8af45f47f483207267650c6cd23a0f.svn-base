package com.ktds.eatit.review.dao;

import java.util.List;

import com.ktds.eatit.review.util.Paging;
import com.ktds.eatit.review.vo.ReviewSearchVO;
import com.ktds.eatit.review.vo.ReviewVO;

public interface ReviewDAO {

	public int insertArticle(ReviewVO reviewVO);

	public int selectAllArticleCount(ReviewSearchVO reviewSearchVO);

	public List<ReviewVO> selectAllArticleList(ReviewSearchVO reviewSearchVO);

	public ReviewVO selectArticleByArticleId(String articleId);

	public int deleteArticle(String articleId);

	public int updateArticle(ReviewVO reviewVO);
}
