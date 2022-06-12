package com.nakwon.service;

import java.util.List;

import com.nakwon.domain.Criteria;
import com.nakwon.domain.MenuVO;

public interface MenuService {
	public void insert(MenuVO vo) throws Exception;
	
	public MenuVO read(String MenuDetailCode) throws Exception;
	
	public void update(MenuVO vo) throws Exception;
	
	public List<MenuVO> menuListAll() throws Exception;
	
	public List<MenuVO> menuCodeListAll(String Code) throws Exception;
	
	public List<MenuVO> courseCode() throws Exception; //���� �޴� ���� �̱�
	 
	public List<MenuVO> setCode() throws Exception; //���� �޴� ���� �̱�
	
	public List<MenuVO> distinctMenuCode() throws Exception; //�޴��ڵ� �ߺ� ����
	
	//����¡�κ�
	public List<MenuVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;
}