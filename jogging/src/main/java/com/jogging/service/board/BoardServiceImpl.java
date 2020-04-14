package com.jogging.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Transactional
	@Override
	public void delBoard(int bno) {
		bDao.deleteAttach(bno); // 첨부파일 삭제
		bDao.delBoard(bno); // 게시글 삭제
		
		// 기타 방법
		// 예) 90일 이후에 일괄삭제
		// tbl_board와 tbl_attach를 relation을 맺고
		// Cascade 작업을 통해 tbl_board에서 해당 게시글 삭제하면
		// 자동으로 tbl_attach에 해당 게시글 첨부파일 일괄삭제
		// 즉 첨부파일 DB에서 삭제하는 코드는 작성 안해도 됨!
	}
	
	
	@Transactional
	@Override
	public void write(BoardDTO bDto) {
		// tbl_board에 게시글 등록(type, title, content, writer)
		bDao.write(bDto);
		
		// tbl_attach에 해당 게시글 첨부파일 등록
		String[] files = bDto.getFiles();
		
		if(files == null) {
			return; // 첨부파일없음, 리턴해서 종료
		}
		for (String name : files) {
			// tbl_attach 테이블에 첨부파일 1건씩 등록
			bDao.addAttach(name);
		}
	}
	
	
	@Override
	public void updateBoard(BoardDTO bDto) {
		bDao.updateBoard(bDto);
		
		// 2. 해당 게시글 관련 첨부파일 모두 DB에서 삭제(tbl_attach)
		bDao.deleteAttach(bDto.getBno());
		
		// 3. 해당 게시글의 filecnt를 수정
		String[] files = bDto.getFiles();
		if(files == null) { // 첨부파일이 0 
			
		} else {
			
		}
		
		// 4. 수정시 존재하는 첨부파일 모두 DB에 등록
		if(files == null) return;
		for(String fullName: files) {
			bDao.updateAttach(fullName, bDto.getBno());
		}
		
		
	}
	
	@Transactional
	@Override
	public void answer(BoardDTO bDto) {
		// 답글 알고리즘
		// Current Status bDto:
		// answer : title, writer, type, content
		// main : bno, ref, re_level, re_step
		
		// 1) re_step을 수정
		// : ref가 같은 row중에 메인 게시글의 
		//   re_step보다 크기가 큰 값을 찾아
		//   전부 + 1 => updateStep()
		bDao.updateStep(bDto);
		
		// 2) 답글 DB에 INSERT
		bDto.setRe_level(bDto.getRe_level()+1);
		bDto.setRe_step(bDto.getRe_step()+1);
		bDao.answer(bDto);
		
		// tbl_attach에 해당 게시글 첨부파일 등록
		String[] files = bDto.getFiles();
				
		if(files == null) {
			return; // 첨부파일없음, 리턴해서 종료
		}
		for (String name : files) {
		// tbl_attach 테이블에 첨부파일 1건씩 등록
			bDao.addAttach(name);
		}
	}

	@Override
	public List<String> getAttach(int bno) {
		
		return bDao.getAttach(bno);
	}
	
	
	
}
