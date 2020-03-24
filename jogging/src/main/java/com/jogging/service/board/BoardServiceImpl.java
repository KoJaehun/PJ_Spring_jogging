package com.jogging.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public List<BoardDTO> ListAll(String search_option, String keyword, String sort_option, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("sort_option", sort_option);
		map.put("start", start);
		map.put("end", end);
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		
		return bDao.listAll(map);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		
		return bDao.countArticle(map);
	}

	@Override
	public BoardDTO view(int bno) {
		
		return bDao.view(bno);
	}

	@Override
	public void increaseViewCnt(int bno, HttpSession session) {
		// now_time : 현재시간
		// plus_time : 조회수 + 1 시간
		// now_time - plus_time = 조회수 + 1 증가후 지난시간

		// 조회수 +1 증가
		// bDao.increaseViewCnt(bno);
		
		long update_time = 0; // 조회수 +1 증가한 시간
		
		if(session.getAttribute("update_time_"+bno) != null) {
			// 최근에 조회수를 올린 시간
			update_time = (long)session.getAttribute("update_time_"+bno);
		}
		// 현재시간 
		long current_time = System.currentTimeMillis();
		
		// 일정시간이 경과한 후 조회수 증가 처리 ( 1Day)
		if(current_time - update_time > 24*60*60*1000) {
			// DB에서 조회수 +1 증가
			bDao.increaseViewCnt(bno);
			// 조회수 올린 시간 저장
			session.setAttribute("update_time_"+bno, current_time);
		}
		

	}
	
	
	
}
