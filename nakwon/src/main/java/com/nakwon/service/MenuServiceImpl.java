package com.nakwon.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.nakwon.domain.Criteria;
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
	public MenuVO read(String MenuDetailCode) throws Exception {
		return dao.read(MenuDetailCode);
	}
	
	@Override
	public void update(MenuVO vo) throws Exception {
		dao.update(vo);
	}
	
	@Override
	public List<MenuVO> menuListAll()throws Exception {
		return dao.menuListAll();
	}
	
	@Override
	public List<MenuVO> menuCodeListAll(String Code)throws Exception {
		return dao.menuCodeListAll(Code);
	}
	
	@Override
	public List<MenuVO> courseCode() throws Exception { //만찬 메뉴들 정보 뽑기
		return dao.courseCode();
	}
	
	@Override
	public List<MenuVO> setCode() throws Exception { //정찬 메뉴들 정보 뽑기
		return dao.setCode();
	}
	
	@Override
	public List<MenuVO> distinctMenuCode() throws Exception { //메뉴코드 중복제거
		return dao.distinctMenuCode();
	}
	
	@Override
	public List<MenuVO> listCriteria(Criteria cri) throws Exception {
	    return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
	    return dao.countPaging(cri);
	}
}