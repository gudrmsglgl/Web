package com.ktds.eatit.free.biz;

import java.util.List;

import com.ktds.eatit.free.dao.FreeDAO;
import com.ktds.eatit.free.util.Paging;
import com.ktds.eatit.free.vo.FreeListVO;
import com.ktds.eatit.free.vo.FreeSearchVO;
import com.ktds.eatit.free.vo.FreeVO;

public class FreeBizImpl implements FreeBiz {

	private FreeDAO freeDAO;

	public void setFreeDAO(FreeDAO freeDAO) {
		this.freeDAO = freeDAO;
	}

	@Override
	public int insertArticle(FreeVO freeVO) {
		
		String subject = freeVO.getSubject();
		String content = freeVO.getContent();
		
		content = content.replaceAll("\n", "<br/>");
		content = content.replaceAll("\r", "");
		
		freeVO.setContent(content);
		
		return freeDAO.insertArticle(freeVO);
	}

	@Override
	public FreeListVO selectAllArticleList(FreeSearchVO freeSearchVO) {
		
		int articleCount= freeDAO.selectAllArticleCount(freeSearchVO);
		Paging paging = new Paging();
		paging.setTotalArticleCount(articleCount);
		paging.setPageNumber(freeSearchVO.getPageNo());
		
		freeSearchVO.setStartArticleNumber(paging.getStartArticleNumber());
		freeSearchVO.setEndArticleNumber(paging.getEndArticleNumber());
		
		List<FreeVO> articleList = freeDAO.selectAllArticleList(freeSearchVO);
		
		FreeListVO freeListVO = new FreeListVO();
		freeListVO.setFreeList(articleList);
		freeListVO.setPaging(paging);
		
		return freeListVO;
	}

	@Override
	public FreeVO selectArticleByArticleId(String articleId) {
		return freeDAO.selectArticleByArticleId(articleId);
	}

	@Override
	public int deleteArticle(String articleId) {
		return freeDAO.deleteArticle(articleId);
	}

	@Override
	public int updateArticle(FreeVO freeVO) {
		
		boolean willUpdate = false;
		
		FreeVO originalArticle = this.selectArticleByArticleId(freeVO.getArticleId());
		
		FreeVO updatedArticle = new FreeVO();
		updatedArticle.setArticleId(freeVO.getArticleId());
		
		String updatedSubject = freeVO.getSubject();
		String originalSubject = originalArticle.getSubject();
		
		if( !originalSubject.equals(updatedSubject) ) {
			willUpdate = true;
			updatedArticle.setSubject(updatedSubject);
		}
		
		String updatedContent = freeVO.getContent();
		String originalContent = originalArticle.getContent();
		
		if( !originalContent.equals(updatedContent) ) {
			willUpdate = true;
			updatedArticle.setContent(updatedContent);
		}
		
		if( willUpdate ) {
			return freeDAO.updateArticle(updatedArticle);
		}
		return 0;
	}
	
}
