package com.nakwon.persistence;

import java.util.List;

import com.nakwon.domain.ReservationVO;

public interface ReservationHoldDAO {
	public void insertReservationHold(ReservationVO vo)  throws Exception; //���� ���
	
	public List<ReservationVO> rsrvHoldListAll() throws Exception;
}