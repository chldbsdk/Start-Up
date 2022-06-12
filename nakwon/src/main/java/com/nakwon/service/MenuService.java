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
	
	public List<MenuVO> courseCode() throws Exception; //만찬 메뉴 정보 뽑기
	 
	public List<MenuVO> setCode() throws Exception; //정찬 메뉴 정보 뽑기
	
	public List<MenuVO> distinctMenuCode() throws Exception; //메뉴코드 중복 제거
	
	//페이징부분
	public List<MenuVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;
}