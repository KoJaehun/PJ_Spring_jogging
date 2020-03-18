package com.jogging.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class BoardDTO {
	
	private int bno;			// 번호
	private String type;		// 
	private String title;		// 제목
	private String content;		// 내용
	private String writer;		// 작성자
	private int viewcnt;		// 조회수
	private int replycnt;	// 댓글수
	private int goodcnt;		// 좋아요
	private String name;
	private Date regdate;		// 작성일자
	private Date updatedate;	// 수정일자
	private String show;		// 화면표시여부
	private String[] files;		// 첨부파일 이름 배열
	private int ref;			// 답변 그룹 번호
	private int re_step;		// 답변 출력 순번
	private int re_level;	// 답변 단계(계층형)
	
}
