package com.nakwon.persistence;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.nakwon.domain.ReservationVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.nakwon.mapper.ReservationMapper";
	
	@Override
	public void insertReservation(ReservationVO vo) throws Exception { //���� ���
		sqlSession.insert(namespace+".insertReservation",vo);
	}

}