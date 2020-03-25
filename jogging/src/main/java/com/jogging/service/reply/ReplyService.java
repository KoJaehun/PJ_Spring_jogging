package com.jogging.service.reply;

import java.util.List;

import com.jogging.domain.ReplyDTO;

public interface ReplyService {
	public List<ReplyDTO> list(int bno);
}
