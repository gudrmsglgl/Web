package com.ktds.eatit.qaboard.biz;

import java.util.List;

import com.ktds.eatit.qaboard.dao.QABoardDAO;
import com.ktds.eatit.qaboard.util.Paging;
import com.ktds.eatit.qaboard.vo.QABoardListVO;
import com.ktds.eatit.qaboard.vo.QABoardSearchVO;
import com.ktds.eatit.qaboard.vo.QABoardVO;

public class QABoardBizImpl implements QABoardBiz {

	private QABoardDAO qABoardDAO;


	public void setqABoardDAO(QABoardDAO qABoardDAO) {
		this.qABoardDAO = qABoardDAO;
	}

	@Override
	public int insertArticle(QABoardVO qABoardVO) {
		
		
		//content 엔터 처리
		String content = qABoardVO.getContent();
		content = content.replaceAll("\n", "<br/>");
		content = content.replaceAll("\r", "");
		
		qABoardVO.setContent(content);
		//content 엔터 처리
		
		
		return qABoardDAO.insertArticle(qABoardVO);
	}

	@Override
	public QABoardListVO selectAllArticleList(QABoardSearchVO qABoardSearchVO) {
		
		int articleCount = qABoardDAO.selectAllArticleCount(qABoardSearchVO);
		Paging paging = new Paging();
		paging.setTotalArticleCount(articleCount);
		paging.setPageNumber(qABoardSearchVO.getPageNo());
		
		qABoardSearchVO.setStartArticleNumber(paging.getStartArticleNumber());
		qABoardSearchVO.setEndArticleNumber(paging.getEndArticleNumber());
		
		List<QABoardVO> articleList = qABoardDAO.selectAllArticleList(qABoardSearchVO);
		
		QABoardListVO listVO = new QABoardListVO();
		listVO.setqABoardList(articleList);
		listVO.setPaging(paging);
		
		return listVO;
		
	}

	@Override
	public QABoardVO selectArticleByArticleId(String articleId) {
		
		
		return qABoardDAO.selectArticleByArticleId(articleId);
	}

	@Override
	public int deleteArticle(String articleId) {
		
		return qABoardDAO.deleteArticle(articleId);
	}

	@Override
	public int updateArticle(QABoardVO qABoardVO) {
		
		boolean willUpdate = false;
		
		// 원본 데이터
		QABoardVO originalArticle = this.selectArticleByArticleId(qABoardVO.getArticleId());
		
		QABoardVO updatedArticle = new QABoardVO();
		updatedArticle.setArticleId(qABoardVO.getArticleId());
		
		String updatedSubject = qABoardVO.getSubject();
		String originalSubject = originalArticle.getSubject();
		
		if ( !originalSubject.equals(updatedSubject)) {
			willUpdate = true;
			updatedArticle.setSubject(updatedSubject);		
		}
		
		String updatedContent = qABoardVO.getContent();
		String originalContent = originalArticle.getContent();
		
		if ( !originalContent.equals(updatedContent)) {
			willUpdate = true;
			updatedArticle.setContent(updatedContent);
		}
		
		if( willUpdate ) {
			return qABoardDAO.updateArticle(updatedArticle);
		}
		return 0;
	}

}
