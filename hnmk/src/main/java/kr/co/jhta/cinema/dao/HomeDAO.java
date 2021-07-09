package kr.co.jhta.cinema.dao;

import java.util.List;

import kr.co.jhta.cinema.dto.MovieDTO;

public interface HomeDAO {
	
	//홈에서 포스터 조회
	public List<MovieDTO> homeBoxAll();
	
}
