package com.nakwon.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nakwon.domain.Criteria;
import com.nakwon.domain.NoticeVO;
import com.nakwon.domain.QnAVO;
import com.nakwon.domain.ReviewVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.nakwon.mapper.boardMapper";
	
	@Override
	public void noticeinsert(NoticeVO vo) throws Exception {
		sqlSession.insert(namespace+".noticeinsert",vo);
	}
	
	@Override
	public void qnainsert(QnAVO vo) throws Exception {
		sqlSession.insert(namespace+".qnainsert",vo);
	}
	
	@Override
	public void reviewinsert(ReviewVO vo) throws Exception {
		sqlSession.insert(namespace+".reviewinsert",vo);
	}
	
	//공지 페이징부분
	@Override
	public List<NoticeVO> noticeCriteria(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".noticeCriteria", cri);
	}

	@Override
	public int noticeCountPaging(Criteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".noticecountPaging", cri);
	}
	
	//문의 페이징부분
	@Override
	public List<QnAVO> qnaCriteria(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".qnaCriteria", cri);
	}

	@Override
	public int qnaCountPaging(Criteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".qnacountPaging", cri);
	}
		
	//리뷰 페이징부분
	@Override
	public List<ReviewVO> reviewCriteria(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".reviewCriteria", cri);
	}

	@Override
	public int reviewCountPaging(Criteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".reviewcountPaging", cri);
	}
	
	//리스트
	@Override
	public List<NoticeVO> noticeListAll()throws Exception {
		return sqlSession.selectList(namespace+".noticeListAll");
	}
	
	@Override
	public List<QnAVO> qnaListAll()throws Exception {
		return sqlSession.selectList(namespace+".qnaListAll");
	}
	
	@Override
	public List<ReviewVO> reviewListAll()throws Exception {
		return sqlSession.selectList(namespace+".reviewListAll");
	}
}
