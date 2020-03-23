package com.jogging.service.board;

import java.util.List;

import com.jogging.domain.BoardDTO;

public interface BoardService {
	
	// 게시글 갯수 계산
	public int countArticle(String search_option, String keyword);
	
	// 목록(페이지 나누기, 검색 기능 포함)
	public List<BoardDTO> ListAll(String search_option, String keyword, String sort_option, int start, int end);
	
	// 상세게시글
	

	public BoardDTO view(int bno);

	
	
		
}
