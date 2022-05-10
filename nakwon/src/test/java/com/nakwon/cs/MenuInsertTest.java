package com.nakwon.cs;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nakwon.domain.MenuVO;
import com.nakwon.persistence.MenuDAO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MenuInsertTest {
	@Inject
	private MenuDAO dao;
	
	@Test
	public void testInsertMember() throws Exception {
		MenuVO vo = new MenuVO();
		vo.setMenuTitle("��?");
		vo.setMenuContent("����");
		/* vo.setMenuImg(); */
		vo.setMenuPrice("2�����");
	    vo.setMenuIngredients("�̰�����");
	    vo.setMenuAllergy("����");
		dao.insert(vo);
	}
}
