package com.jogging.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jogging.domain.BoardDTO;
import com.jogging.service.board.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardContrller {
	
	@Autowired
	BoardService bService;
	
	@GetMapping("/list")
	public String board(Model model) {	
		log.info(">>>> GET Board Success");
		log.info(">>>> GET : Board List Page");
		
		List<BoardDTO> list = bService.ListAll();
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		model.addAttribute("map", map);
		
		return "board/list";
	}

}
