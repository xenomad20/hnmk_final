package kr.co.jhta.cinema.dao;

import java.util.List;

import kr.co.jhta.cinema.dto.MovieDTO;
import kr.co.jhta.cinema.dto.MovieInfoDTO;

public interface MovieDAO {
	//영화 전체조회
	public List<MovieDTO> readAll();
    //박스오피스조회 => 평점순위
	public List<MovieDTO> movieBox();
	//영화 1건조회
	public MovieDTO movieOne(int mno);
	// 상영or예정 영화 조회
	public List<MovieInfoDTO> showMovie(int showflag);

}
