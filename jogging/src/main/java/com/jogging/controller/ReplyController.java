package com.jogging.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jogging.domain.ReplyDTO;
import com.jogging.service.reply.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService rService;
	
	@GetMapping("/list")
	public String lsit(int bno, Model model) {
		log.info(">>>> GET : Reply List Page");
		
		/* List<ReplyDTO> list = rService.list(bno);
		
		for (ReplyDTO replyDTO : list) {
			log.info(replyDTO.toString());
		} */
		
		// 앞에가 이름(list)이고 뒤에가 실제데이터 return 에 꼭 있어야한다. 없으면 null값이 들어간다.
		model.addAttribute("list", rService.list(bno));
		return "/board/commentlist";
	}
}
