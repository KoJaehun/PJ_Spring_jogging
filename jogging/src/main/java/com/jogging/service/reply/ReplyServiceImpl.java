package com.jogging.service.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional
	@Override
	public void replyInsert(ReplyDTO rDto) {
		// 비즈니스 로직
		// 해당 게시글에 댓글을 등록하고,
		// 해당 게시글의 reply_cnt를 +1함.
		// 1. 댓글 등록
		rDao.replyInsert(rDto);
		
		// 2. 게시글 댓글 수 + 1
		
		String type = "plus";
		rDao.replyCntUpdate(rDto.getBno(), type);
		
	}
	@Transactional
	@Override
	public void replyDelete(int rno, int bno) {
		rDao.replyDelete(rno);
		String type = "minus";
		
		rDao.replyCntUpdate(bno,type);
		
		
	}

	

	

}
