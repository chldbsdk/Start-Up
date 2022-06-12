package com.nakwon.persistence;

import java.util.Map;
import com.nakwon.domain.ReservationConfirmVO;

public interface ReservationConfirmDAO {
	
	public ReservationConfirmVO userReservationCheck(Map<String,String> Check) throws Exception; //예약자 예약 조회
	
	public void deleteReservationConfirm(Map<String,String> DeleteInfo) throws Exception; //예약 삭제
	
	public void modifyReservationConfirm(ReservationConfirmVO vo) throws Exception; //예약 수정
}
