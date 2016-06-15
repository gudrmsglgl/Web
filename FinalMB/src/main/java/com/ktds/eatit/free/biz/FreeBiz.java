package com.ktds.eatit.free.biz;

import com.ktds.eatit.free.vo.FreeListVO;
import com.ktds.eatit.free.vo.FreeSearchVO;
import com.ktds.eatit.free.vo.FreeVO;

public interface FreeBiz {

	public int insertArticle(FreeVO freeVO);

	public FreeListVO selectAllArticleList(FreeSearchVO freeSearchVO);

	public FreeVO selectArticleByArticleId(String articleId);

	public int deleteArticle(String articleId);

	public int updateArticle(FreeVO freeVO);
}
