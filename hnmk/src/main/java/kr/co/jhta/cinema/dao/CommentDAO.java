package kr.co.jhta.cinema.dao;

import java.util.List;

import kr.co.jhta.cinema.dto.CommentDTO;

public interface CommentDAO {
	//코멘트 전체 조회
	public List<CommentDTO> readAll(int mno);
	//코멘트 하나 조회
	public CommentDTO readOne(int mno, int customerno);
	//코멘트 하나 추가
	public void insertOne(CommentDTO dto);
}
