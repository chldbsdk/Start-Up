package com.nakwon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.nakwon.domain.Criteria;
import com.nakwon.domain.NoticeVO;
import com.nakwon.domain.QnAVO;
import com.nakwon.domain.ReviewVO;
import com.nakwon.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	BoardDAO dao;
	
	@Override
	public void noticeinsert(NoticeVO vo) throws Exception{
		dao.noticeinsert(vo);
	}
	
	@Override
	public void qnainsert(QnAVO vo) throws Exception{
		dao.qnainsert(vo);
	}
	
	@Override
	public void reviewinsert(ReviewVO vo) throws Exception{
		dao.reviewinsert(vo);
	}
	
	//공지 페이징부분
	@Override
	public List<NoticeVO> noticeCriteria(Criteria cri) throws Exception {
		return dao.noticeCriteria(cri);
	}

	@Override
	public int noticeCountPaging(Criteria cri) throws Exception {
		return dao.noticeCountPaging(cri);
	}
	
	//문의 페이징부분
	@Override
	public List<QnAVO> qnaCriteria(Criteria cri) throws Exception {
		return dao.qnaCriteria(cri);
	}

	@Override
	public int qnaCountPaging(Criteria cri) throws Exception {
		return dao.qnaCountPaging(cri);
	}
		
	//리뷰 페이징부분
	@Override
	public List<ReviewVO> reviewCriteria(Criteria cri) throws Exception {
		return dao.reviewCriteria(cri);
	}

	@Override
	public int reviewCountPaging(Criteria cri) throws Exception {
		return dao.reviewCountPaging(cri);
	}
	
	//리스트뽑기
	@Override
	public List<NoticeVO> noticeListAll() throws Exception {
		return dao.noticeListAll();
	}
	
	@Override
	public List<QnAVO> qnaListAll() throws Exception {
		return dao.qnaListAll();
	}

	@Override
	public List<ReviewVO> reviewListAll() throws Exception {
		return dao.reviewListAll();
	}
}
