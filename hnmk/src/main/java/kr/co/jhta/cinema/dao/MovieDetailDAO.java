package kr.co.jhta.cinema.dao;

import kr.co.jhta.cinema.dto.MovieDTO;
import kr.co.jhta.cinema.dto.MovieDetailDTO;
import kr.co.jhta.cinema.dto.MovieDetailInfoDTO;
import kr.co.jhta.cinema.dto.MovieInfoDTO;

public interface MovieDetailDAO {
   //영화 디테일 한 행 조회
   public MovieDetailInfoDTO movieDetailOne(int mno);

}