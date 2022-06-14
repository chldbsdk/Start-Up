package com.nakwon.service;

import java.util.List;

import com.nakwon.domain.Criteria;
import com.nakwon.domain.NoticeVO;
import com.nakwon.domain.QnAVO;
import com.nakwon.domain.ReviewVO;

public interface BoardService {
	public void noticeinsert(NoticeVO vo) throws Exception;
	public void qnainsert(QnAVO vo) throws Exception;
	public void reviewinsert(ReviewVO vo) throws Exception;
	
	//��������¡�κ�
	public List<NoticeVO> noticeCriteria(Criteria cri) throws Exception;
			
	public int noticeCountPaging(Criteria cri) throws Exception;
		
	//���� ����¡�κ�
	public List<QnAVO> qnaCriteria(Criteria cri) throws Exception;
				
	public int qnaCountPaging(Criteria cri) throws Exception;
			
	//���� ����¡�κ�
	public List<ReviewVO> reviewCriteria(Criteria cri) throws Exception;
				
	public int reviewCountPaging(Criteria cri) throws Exception;
	
	//����Ʈ�̴ºκ�
	public List<NoticeVO> noticeListAll() throws Exception;
	public List<QnAVO> qnaListAll() throws Exception;
	public List<ReviewVO> reviewListAll() throws Exception;
}
