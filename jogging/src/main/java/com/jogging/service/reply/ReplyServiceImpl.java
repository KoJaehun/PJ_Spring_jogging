package com.jogging.service.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jogging.domain.ReplyDTO;
import com.jogging.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private SqlSession sqlSession;
	
	private ReplyDAO rDao;
	@Autowired
	public void newReplyDAO() {
		rDao = sqlSession.getMapper(ReplyDAO.class);
	}
	
	@Override
	public List<ReplyDTO> list(int bno) {
		return rDao.list(bno);
	}

}
