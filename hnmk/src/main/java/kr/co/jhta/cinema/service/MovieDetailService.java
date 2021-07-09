package kr.co.jhta.cinema.service;

import kr.co.jhta.cinema.dto.MovieDTO;
import kr.co.jhta.cinema.dto.MovieDetailDTO;
import kr.co.jhta.cinema.dto.MovieDetailInfoDTO;
import kr.co.jhta.cinema.dto.MovieInfoDTO;

public interface MovieDetailService {
	//영화인포 한 행 불러오기
	public MovieDetailInfoDTO readDetailOne(int mno);
	//상영 일정 한 행 불러오기
}
