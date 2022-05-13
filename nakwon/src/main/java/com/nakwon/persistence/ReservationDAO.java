package com.nakwon.persistence;

import com.nakwon.domain.ReservationVO;

public interface ReservationDAO {
	public void insertReservation(ReservationVO vo)  throws Exception; //���� ���
}