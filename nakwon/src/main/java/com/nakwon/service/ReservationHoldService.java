package com.nakwon.service;

import java.util.List;
import com.nakwon.domain.ReservationVO;

public interface ReservationHoldService {
	public void insertReservationHold(ReservationVO vo) throws Exception;
	
	public List<ReservationVO> rsrvHoldListAll() throws Exception;
}