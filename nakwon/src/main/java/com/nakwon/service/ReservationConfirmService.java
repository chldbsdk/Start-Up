package com.nakwon.service;


import java.util.Map;
import com.nakwon.domain.ReservationConfirmVO;

public interface ReservationConfirmService {
	public ReservationConfirmVO userReservationCheck(Map<String,String> Check) throws Exception;
	
	public void deleteReservationConfirm(Map<String,String> DeleteInfo) throws Exception;
	
	public void modifyReservationConfirm(ReservationConfirmVO vo) throws Exception; //예약수정
}
