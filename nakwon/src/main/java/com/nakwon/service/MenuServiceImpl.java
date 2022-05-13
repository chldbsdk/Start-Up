package com.nakwon.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.nakwon.domain.MenuVO;
import com.nakwon.persistence.MenuDAO;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService{
	@Inject
	MenuDAO dao;
	
	@Override
	public void insert(MenuVO vo) throws Exception{
		dao.insert(vo);
	}
	
	@Override
	public List<MenuVO> menuListAll()throws Exception {
		return dao.menuListAll();
	}
}