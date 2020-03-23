package com.jogging.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jogging.domain.BoardDTO;
import com.jogging.service.board.BoardService;
import com.jogging.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardContrller {
	
	@Autowired
	BoardService bService;
	
	@GetMapping("/list")
	public String list(
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="new") String sort_option,
			@RequestParam(defaultValue="all") String search_option,
			@RequestParam(defaultValue="") String keyword,
			Model model) {	
		
		log.info(">>>> GET Board Success");
		log.info(">>>> GET : Board List Page");
		
		// 게시글 갯수 계산
		int count = bService.countArticle(search_option, keyword);
		
		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardDTO> list = bService.ListAll(search_option, keyword, sort_option, start, end); 	// 게시글 목록
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		model.addAttribute("map", map);
		
		return "board/list";
	}
	
	@GetMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		log.info(">>>> GET : BOARD DEATIL PAGE");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDTO bDto=bService.view(bno);
		
		log.info(bDto.toString());
		HashMap<String,Object> map = new HashMap<>();
		map.put("one", bDto);
		model.addAttribute("map",map);
		return "board/view";
	}

}
