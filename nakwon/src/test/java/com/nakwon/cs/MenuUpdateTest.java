package com.nakwon.cs;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nakwon.domain.ManagerVO;
import com.nakwon.domain.MenuVO;
import com.nakwon.persistence.MenuDAO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MenuUpdateTest {
	@Inject
	private MenuDAO dao;
	
	@Test
	public void testInsertMember() throws Exception {
		MenuVO vo = new MenuVO();
		vo.setCode("nakwon00");
		vo.setCodeName("Nakwon2022!");
		vo.setMenuDetailCode("xHkp7m");
		dao.update(vo);
		
	}
}
	
