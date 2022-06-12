package com.nakwon.persistence;

import java.util.List;

import com.nakwon.domain.IntroduceVO;

public interface IntroduceDAO {
	public void introduceinsert(IntroduceVO vo) throws Exception;
	
	public List<IntroduceVO> introduceListAll() throws Exception;
}
