package com.nakwon.persistence;

import javax.inject.Inject;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nakwon.domain.MenuVO;

@Repository
public class MenuDAOImpl implements MenuDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.nakwon.mapper.MenuMapper";
	
	@Override
	public void insert(MenuVO vo) throws Exception {
		sqlSession.insert(namespace+".insert",vo);
	}
	
	@Override
	public List<MenuVO> menuListAll()throws Exception {
		return sqlSession.selectList(namespace+".menuListAll");
	}
}