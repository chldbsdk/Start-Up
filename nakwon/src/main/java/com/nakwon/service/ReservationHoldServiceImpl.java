package com.nakwon.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.nakwon.domain.ReservationVO;
import com.nakwon.persistence.ReservationHoldDAO;

@Service
public class ReservationHoldServiceImpl implements ReservationHoldService {
	@Inject
	ReservationHoldDAO dao;
	
	@Override
	public void insertReservationHold(ReservationVO vo) throws Exception{
		dao.insertReservationHold(vo);
	}
	
	@Override
	public List<ReservationVO> rsrvHoldListAll() throws Exception {
		return dao.rsrvHoldListAll();
	}

}