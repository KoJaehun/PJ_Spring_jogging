package com.jogging.service.board;

import java.util.List;

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
	public List<BoardDTO> ListAll() {
		
		
		
		return bDao.listAll();
	}
	
	
	
}
