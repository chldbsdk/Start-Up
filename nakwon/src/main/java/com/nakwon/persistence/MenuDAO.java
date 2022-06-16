package com.nakwon.persistence;

import com.nakwon.domain.Criteria;
import com.nakwon.domain.MenuVO;
import java.util.List;

public interface MenuDAO {
	public void insert(MenuVO vo) throws Exception;
	
	public MenuVO read(String MenuDetailCode) throws Exception;
	
	public void update(MenuVO vo) throws Exception;
	
	public void delete(String MenuDetailCode) throws Exception;

	public List<MenuVO> menuListAll() throws Exception;
	
	public List<MenuVO> menuCodeListAll(String Code) throws Exception;	

	public List<MenuVO> courseCode() throws Exception; //���� �޴� �̱�
	
	public List<MenuVO> setCode() throws Exception; //���� �޴� �̱�
	
	public List<MenuVO> distinctMenuCode() throws Exception; //�޴��ڵ� �ߺ�����
	
	//����¡�κ�
	public List<MenuVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountPaging(Criteria cri) throws Exception;
}