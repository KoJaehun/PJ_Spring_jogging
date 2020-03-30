package com.jogging.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jogging.domain.ReplyDTO;

public interface ReplyDAO {
	
	// 이름을 붙여주고싶으면 @param을 붙인다
	// 없다면 param1 으로 불러야한다.
	
	
	// list <- Mapper id값과 같아야 한다.
	// 패키지의 경로랑 Mapper의 namespace와도 같아야한다.
	public List<ReplyDTO> list(@Param("bno") int bno);
	
	
	// 댓글 등록
	public void replyInsert(ReplyDTO rDto);


	public void replyCntPlus(int bno);


	public void replyDelete(@Param("rno")int rno);


	public void replyCntUpdate(@Param("bno")int bno, @Param("type")String type);
	
	
	
}
