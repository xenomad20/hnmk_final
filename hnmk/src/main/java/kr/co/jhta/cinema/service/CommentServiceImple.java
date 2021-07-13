package kr.co.jhta.cinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.cinema.dao.CommentDAO;
import kr.co.jhta.cinema.dto.CommentDTO;
import lombok.Getter;
import lombok.Setter;

@Service
@Getter
@Setter
public class CommentServiceImple implements CommentService{
	@Autowired
	CommentDAO dao;
	
	@Override
	public List<CommentDTO> readAll(int mno) {
		return dao.readAll(mno);
	}

	@Override
	public CommentDTO readOne(int mno, int customerno) {
		return dao.readOne(mno, customerno);
	}

	@Override
	public void insertOne(CommentDTO dto) {
		dao.insertOne(dto);
	}

}
