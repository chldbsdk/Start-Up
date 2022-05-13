package com.nakwon.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.nakwon.domain.ReservationVO;
import com.nakwon.persistence.ReservationDAO;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Inject
	ReservationDAO dao;
	
	@Override
	public void insertReservation(ReservationVO vo) throws Exception{
		dao.insertReservation(vo);
	}

}