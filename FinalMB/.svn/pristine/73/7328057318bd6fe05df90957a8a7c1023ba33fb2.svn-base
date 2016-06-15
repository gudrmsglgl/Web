package com.ktds.eatit.review.biz;

import java.util.List;

import com.ktds.eatit.review.dao.ReviewDAO;
import com.ktds.eatit.review.util.Paging;
import com.ktds.eatit.review.vo.ReviewListVO;
import com.ktds.eatit.review.vo.ReviewSearchVO;
import com.ktds.eatit.review.vo.ReviewVO;

public class ReviewBizImpl implements ReviewBiz {

	private ReviewDAO reviewDAO;
	
	public void setReviewDAO(ReviewDAO reviewDAO) {
		this.reviewDAO = reviewDAO;
	}

	
	@Override
	public int insertArticle(ReviewVO reviewVO) {

		String content = reviewVO.getContent();
		content = content.replaceAll("\n", "<br/>");
		content = content.replaceAll("\r", "");
		
		reviewVO.setContent(content);
		
		return reviewDAO.insertArticle(reviewVO);
	}

	@Override
	public ReviewListVO selectAllArticleList(ReviewSearchVO reviewSearchVO) {

		int articleCount = reviewDAO.selectAllArticleCount(reviewSearchVO);
		Paging paging = new Paging();
		paging.setTotalArticleCount(articleCount);
		paging.setPageNumber(reviewSearchVO.getPageNo());
		
		reviewSearchVO.setStartArticleNumber(paging.getStartArticleNumber());
		reviewSearchVO.setEndArticleNumber(paging.getEndArticleNumber());
		
		List<ReviewVO> articleList = reviewDAO.selectAllArticleList(reviewSearchVO);
		
		ReviewListVO listVO = new ReviewListVO();
		listVO.setReviewList(articleList);
		listVO.setPaging(paging);
		
		return listVO;
	}

	@Override
	public ReviewVO selectArticleByArticleId(String articleId) {
		return reviewDAO.selectArticleByArticleId(articleId);
	}

	@Override
	public int deleteArticle(String articleId) {
		return reviewDAO.deleteArticle(articleId);
	}
	
	@Override
	public int updateArticle(ReviewVO reviewVO) {
		
		boolean willUpdate = false;
		
		// 원본 데이터
		ReviewVO originalArticle = this.selectArticleByArticleId(reviewVO.getArticleId());
		
		ReviewVO updatedArticle = new ReviewVO();
		updatedArticle.setArticleId(reviewVO.getArticleId());
		
		String updatedSubject = reviewVO.getSubject();
		String originalSubject = originalArticle.getSubject();
		
		if ( !originalSubject.equals(updatedSubject)) {
			willUpdate = true;
			updatedArticle.setSubject(updatedSubject);		
		}
		
		String updatedContent = reviewVO.getContent();
		String originalContent = originalArticle.getContent();
		
		if ( !originalContent.equals(updatedContent)) {
			willUpdate = true;
			updatedArticle.setContent(updatedContent);
		}
		
		if( willUpdate ) {
			return reviewDAO.updateArticle(updatedArticle);
		}
		
		return 0;
	}
}