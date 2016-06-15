package com.ktds.eatit.notice.dao;

import java.util.List;

import com.ktds.eatit.notice.vo.NoticeSearchVO;
import com.ktds.eatit.notice.util.Paging;
import com.ktds.eatit.notice.vo.NoticeVO;

public interface NoticeDAO {

	public int insertArticle(NoticeVO noticeVO);
	
	public int selectAllArticleCount(NoticeSearchVO noticeSearchVO);
	public List<NoticeVO> selectAllArticleList(NoticeSearchVO noticeSearchVO);
	
	public NoticeVO selectArticleByArticleId(String articleId);

	public int deleteArticle(String articleId);

	public int updateArticle(NoticeVO noticeVO);
}
