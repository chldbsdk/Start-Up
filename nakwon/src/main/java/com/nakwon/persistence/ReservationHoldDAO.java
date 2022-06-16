package com.nakwon.persistence;

import java.util.List;
import java.util.Map;
import com.nakwon.domain.ReservationHoldVO;

public interface ReservationHoldDAO {
	public void insertReservationHold(ReservationHoldVO vo)  throws Exception; //���� ���
	
	public List<ReservationHoldVO> rsrvHoldListAll() throws Exception; //���� ����Ʈ ��������
	
	public int listCountPaging(com.nakwon.domain.Criteria cri) throws Exception;
	
	public List<ReservationHoldVO> listCriteria(com.nakwon.domain.Criteria cri) throws Exception;
	
	public ReservationHoldVO userReservationCheck(Map<String,String> Check) throws Exception;
	
	public void deleteReservationHold(Map<String,String> DeleteInfo) throws Exception;
	
	public void modifyReservationHold(ReservationHoldVO vo) throws Exception; //���� ����
	
	 public ReservationHoldVO reservationRead(String RsrvCode) throws Exception; //������ ���� ��ȸ
}