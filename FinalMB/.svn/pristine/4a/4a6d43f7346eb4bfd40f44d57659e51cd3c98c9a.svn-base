package com.ktds.eatit.free.dao;

import java.util.List;

import com.ktds.eatit.free.vo.FreeSearchVO;
import com.ktds.eatit.free.vo.FreeVO;
import com.ktds.eatit.free.util.Paging;

public interface FreeDAO {

	public int insertArticle(FreeVO freeVO);

	public int selectAllArticleCount(FreeSearchVO freeSearchVO);
	public List<FreeVO> selectAllArticleList(FreeSearchVO freeSearchVO);

	public FreeVO selectArticleByArticleId(String articleId);

	public int deleteArticle(String articleId);

	public int updateArticle(FreeVO updatedArticle);

}
