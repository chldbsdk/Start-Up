package com.nakwon.cs;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nakwon.domain.ManagerVO;
import com.nakwon.domain.MenuVO;
import com.nakwon.persistence.ManagerDAO;
import com.nakwon.persistence.MenuDAO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MenuReadTest {
	@Inject
	private MenuDAO dao;
	
	@Test
	public void read() throws Exception {
		
		System.out.println(dao.read("WvwIoY"));
		
	}
	
}