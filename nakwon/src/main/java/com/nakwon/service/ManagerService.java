package com.nakwon.service;

import com.nakwon.domain.ManagerVO;

public interface ManagerService {
//	public ManagerVO login(ManagerVO vo, HttpSession session);
	public ManagerVO login(ManagerVO vo) throws Exception;
	
//	public String login(ManagerVO vo,HttpSession session) throws Exception;
//	public void logout(HttpSession session) throws Exception;
	
	
}