package com.nakwon.service;

import java.util.List;

import com.nakwon.domain.MenuVO;

public interface MenuService {
	public void insert(MenuVO vo) throws Exception;
	
	public MenuVO read(String MenuDetailCode) throws Exception;
	
	public List<MenuVO> menuListAll() throws Exception;
	
	public List<MenuVO> menuCodeListAll(String Code) throws Exception;
	
	public List<MenuVO> menuCode(String MenuCode) throws Exception;
	
	public MenuVO test(String MenuCode) throws Exception;
}