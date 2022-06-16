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

	public List<MenuVO> courseCode() throws Exception; //만찬 메뉴 뽑기
	
	public List<MenuVO> setCode() throws Exception; //정찬 메뉴 뽑기
	
	public List<MenuVO> distinctMenuCode() throws Exception; //메뉴코드 중복제거
	
	//페이징부분
	public List<MenuVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountPaging(Criteria cri) throws Exception;
}