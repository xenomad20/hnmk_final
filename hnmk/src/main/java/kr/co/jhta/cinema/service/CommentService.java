package kr.co.jhta.cinema.service;

import java.util.List;

import kr.co.jhta.cinema.dto.CommentDTO;

public interface CommentService {
	//코멘트 전체 조회
	public List<CommentDTO> readAll(int mno);
	//코멘트 한 건 조회
	public CommentDTO readOne(int mno, int customerno);
	//코멘트 값 생성
	public void insertOne(CommentDTO dto);
	
}
