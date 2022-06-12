package com.nakwon.service;

import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.nakwon.domain.ReservationConfirmVO;
import com.nakwon.persistence.ReservationConfirmDAO;

@Service
public class ReservationConfirmServiceImpl implements ReservationConfirmService {
	@Inject
	ReservationConfirmDAO dao;
	
	@Override
	public ReservationConfirmVO userReservationCheck(Map<String,String> Check) throws Exception{
		return dao.userReservationCheck(Check);
	}
	
	@Override
	public void deleteReservationConfirm(Map<String,String> DeleteInfo)throws Exception {
		dao.deleteReservationConfirm(DeleteInfo);
	}
	
	//예약 수정
	@Override
	public void modifyReservationConfirm(ReservationConfirmVO vo) throws Exception {
		dao.modifyReservationConfirm(vo);
	}
}
