package com.nakwon.persistence;

import com.nakwon.domain.ManagerVO;

public interface ManagerDAO {
	//매니저 로그인
	public ManagerVO login(ManagerVO vo) throws Exception;
	
	//매니저 로그인 체크
	//public String login(ManagerVO vo) throws Exception;
	
	
}