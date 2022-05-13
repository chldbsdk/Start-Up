package com.nakwon.service;

import java.util.List;

import com.nakwon.domain.MenuVO;

public interface MenuService {
	public void insert(MenuVO vo) throws Exception;
	
	public List<MenuVO> menuListAll() throws Exception;
}