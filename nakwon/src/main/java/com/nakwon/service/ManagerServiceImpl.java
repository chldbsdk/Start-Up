package com.nakwon.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.nakwon.domain.ManagerVO;
import com.nakwon.persistence.ManagerDAO;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Inject
	ManagerDAO dao;
	
	@Override
	public ManagerVO login(ManagerVO vo) throws Exception{
		return dao.login(vo);
	}
	
//	@Override
//	public String login(ManagerVO vo,HttpSession session) throws Exception {
//		String name = dao.login(vo);
//		if(name != null) { //技记 函荐 历厘
//			session.setAttribute("userid", vo.getUserid());
//			session.setAttribute("name", name);
//		}
//		return name;
//	}
//	
//	@Override
//	public void logout(HttpSession session) {
//		session.invalidate(); //技记 檬扁拳
//	}
}