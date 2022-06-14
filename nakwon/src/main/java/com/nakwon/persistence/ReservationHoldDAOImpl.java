package com.nakwon.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.nakwon.domain.Criteria;
import com.nakwon.domain.ReservationHoldVO;

@Repository
public class ReservationHoldDAOImpl implements ReservationHoldDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.nakwon.mapper.ReservationHoldMapper";
	
	//예약 등록
	@Override
	public void insertReservationHold(ReservationHoldVO vo) throws Exception { 
		sqlSession.insert(namespace+".insertReservationHold", vo);
	}
	
	//예약 보류 리스트
	@Override
	public List<ReservationHoldVO> rsrvHoldListAll()throws Exception {
		return sqlSession.selectList(namespace+".rsrvHoldListAll");
	}

	//예약 보류 리스트 개수
		@Override
		public int listCountPaging(Criteria cri) throws Exception {
			return sqlSession.selectOne(namespace+".listCountPaging", cri);
		}

		@Override
		public List<ReservationHoldVO> listCriteria(Criteria cri)throws Exception {
			return sqlSession.selectList(namespace+".listCriteria", cri);
		}
		
		@Override
		public ReservationHoldVO userReservationCheck(Map<String,String> Check) throws Exception {
			return sqlSession.selectOne(namespace+".userReservationCheck", Check);
		}
		
		public void deleteReservationHold(Map<String,String> DeleteInfo)throws Exception {
			sqlSession.delete(namespace+".deleteReservationHold", DeleteInfo);
		}
		
		@Override
		public void modifyReservationHold(ReservationHoldVO vo) throws Exception { //예약 수정
			sqlSession.update(namespace + ".modifyReservationHold", vo);
		}
		
		@Override
		public ReservationHoldVO reservationRead(String RsrvCode) throws Exception { //게시글 등록, return 조회한 vo
		  return sqlSession.selectOne(namespace + ".reservationModify", RsrvCode);
		}
}