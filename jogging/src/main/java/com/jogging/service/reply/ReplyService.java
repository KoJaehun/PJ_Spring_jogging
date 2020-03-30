package com.jogging.service.reply;

import java.util.List;

import com.jogging.domain.ReplyDTO;

public interface ReplyService {
	/* 댓글 목록 */
	public List<ReplyDTO> list(int bno);
	
	/* 댓글 등록 */
	public void replyInsert(ReplyDTO rDto);
	
	/* 댓글 삭제 */
	public void replyDelete(int rno, int bno);
}
