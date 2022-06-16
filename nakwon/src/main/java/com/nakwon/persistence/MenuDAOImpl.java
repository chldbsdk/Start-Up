package com.nakwon.persistence;

import javax.inject.Inject;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nakwon.domain.Criteria;
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
	public MenuVO read(String MenuDetailCode) throws Exception {
		return sqlSession.selectOne(namespace+".read",MenuDetailCode);
	}
	
	@Override
	 public void update(MenuVO vo) throws Exception {
	    sqlSession.update(namespace + ".update", vo);
	 }
	
	@Override
	public void delete(String MenuDetailCode) throws Exception {
		sqlSession.delete(namespace+".delete",MenuDetailCode);
	}
	
	@Override
	public List<MenuVO> menuListAll()throws Exception {
		return sqlSession.selectList(namespace+".menuListAll");
	}
	
	@Override
	public List<MenuVO> menuCodeListAll(String Code)throws Exception {
		return sqlSession.selectList(namespace+".menuCodeListAll", Code);
	}
	
	@Override
	public List<MenuVO> courseCode() throws Exception { //���� �޴��� ���� �̱�
		return sqlSession.selectList(namespace+".courseClassification"); 
	}
	
	@Override
	public List<MenuVO> setCode() throws Exception { //���� �޴��� ���� �̱�
		return sqlSession.selectList(namespace+".setClassification");
	}
	
	@Override
	public List<MenuVO> distinctMenuCode() throws Exception { //�޴� �ڵ� �ߺ�����
		return sqlSession.selectList(namespace+".distinctMenuCode");
	}
	
	//����¡�κ�
	@Override
	public List<MenuVO> listCriteria(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int listCountPaging(Criteria cri) throws Exception {
	    return sqlSession.selectOne(namespace + ".countPaging", cri);
	}
}