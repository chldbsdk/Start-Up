package com.nakwon.persistence;

import com.nakwon.domain.MenuVO;
import java.util.List;

public interface MenuDAO {
	public void insert(MenuVO vo) throws Exception;
	
	public List<MenuVO> menuListAll() throws Exception;
	
	public List<MenuVO> menuCodeListAll(String Code) throws Exception;
}