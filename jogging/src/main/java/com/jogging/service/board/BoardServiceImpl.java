package com.jogging.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jogging.domain.BoardDTO;
import com.jogging.persistence.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardServiceImpl implements BoardService{
	@Autowired
	private SqlSession sqlSession;
	
	private BoardDAO bDao;
	
	@Autowired
	public void BoardListDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	
	@Override
	public List<BoardDTO> ListAll(int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return bDao.listAll(map);
	}

	@Override
	public int countArticle() {
		
		return bDao.countArticle();
	}
	
	
	
}
