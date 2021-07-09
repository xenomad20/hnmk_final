package kr.co.jhta.cinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.cinema.dao.MovieDAO;
import kr.co.jhta.cinema.dao.MovieDetailDAO;
import kr.co.jhta.cinema.dto.MovieDTO;
import kr.co.jhta.cinema.dto.MovieDetailDTO;
import kr.co.jhta.cinema.dto.MovieDetailInfoDTO;
import kr.co.jhta.cinema.dto.MovieInfoDTO;
import lombok.Getter;
import lombok.Setter;

@Service
@Setter
@Getter
public class MovieDetailServiceImple implements MovieDetailService {
	@Autowired
	MovieDetailDAO dao;
	
	@Override
	public MovieDetailInfoDTO readDetailOne(int mno) {
		return dao.movieDetailOne(mno);
		
	}
	
	
	
	

}
