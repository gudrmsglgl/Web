package com.ktds.eatit.notice.biz;

import java.util.List;

import com.ktds.eatit.notice.vo.NoticeSearchVO;
import com.ktds.eatit.notice.dao.NoticeDAO;
import com.ktds.eatit.notice.util.Paging;
import com.ktds.eatit.notice.vo.NoticeListVO;
import com.ktds.eatit.notice.vo.NoticeVO;

public class NoticeBizImpl implements NoticeBiz {

	private NoticeDAO noticeDAO;

	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	@Override
	public int insertArticle(NoticeVO noticeVO) {
		
		
		//content 엔터 처리
		String content = noticeVO.getContent();
		content = content.replaceAll("\n", "<br/>");
		content = content.replaceAll("\r", "");
		
		noticeVO.setContent(content);
		//content 엔터 처리
		
		
		return noticeDAO.insertArticle(noticeVO);
	}

	@Override
	public NoticeListVO selectAllArticleList(NoticeSearchVO noticeSearchVO) {
		
		int articleCount = noticeDAO.selectAllArticleCount(noticeSearchVO);
		Paging paging = new Paging();
		paging.setTotalArticleCount(articleCount);
		paging.setPageNumber(noticeSearchVO.getPageNo());
		
		noticeSearchVO.setStartArticleNumber(paging.getStartArticleNumber());
		noticeSearchVO.setEndArticleNumber(paging.getEndArticleNumber());
		
		List<NoticeVO> articleList = noticeDAO.selectAllArticleList(noticeSearchVO);
		
		NoticeListVO listVO = new NoticeListVO();
		listVO.setNoticeList(articleList);
		listVO.setPaging(paging);
		
		return listVO;
		
	}

	@Override
	public NoticeVO selectArticleByArticleId(String articleId) {
		
		
		return noticeDAO.selectArticleByArticleId(articleId);
	}

	@Override
	public int deleteArticle(String articleId) {
		
		return noticeDAO.deleteArticle(articleId);
	}

	@Override
	public int updateArticle(NoticeVO noticeVO) {
		
		boolean willUpdate = false;
		
		// 원본 데이터
		NoticeVO originalArticle = this.selectArticleByArticleId(noticeVO.getArticleId());
		
		NoticeVO updatedArticle = new NoticeVO();
		updatedArticle.setArticleId(noticeVO.getArticleId());
		
		String updatedSubject = noticeVO.getSubject();
		String originalSubject = originalArticle.getSubject();
		
		if ( !originalSubject.equals(updatedSubject)) {
			willUpdate = true;
			updatedArticle.setSubject(updatedSubject);		
		}
		
		String updatedContent = noticeVO.getContent();
		String originalContent = originalArticle.getContent();
		
		if ( !originalContent.equals(updatedContent)) {
			willUpdate = true;
			updatedArticle.setContent(updatedContent);
		}
		
		if( willUpdate ) {
			return noticeDAO.updateArticle(updatedArticle);
		}
		return 0;
	}

}
