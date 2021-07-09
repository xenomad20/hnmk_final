package kr.co.jhta.cinema.service;

import java.util.List;

import kr.co.jhta.cinema.dto.MovieDTO;
import kr.co.jhta.cinema.dto.MovieInfoDTO;

public interface MovieService {
	//영화 전체 조회
	public List<MovieDTO> readAll();
	//박스오피스 조회
	public List<MovieDTO> readBox();
	//영화 1건 조회
	public MovieDTO readOne(int mno);
	//상영 or 예정 영화 조회
	public List<MovieInfoDTO> readMovie(int showflag);
}
