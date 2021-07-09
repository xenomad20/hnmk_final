package kr.co.jhta.cinema.service;

import java.lang.annotation.Annotation;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.cinema.dao.MovieDAO;
import kr.co.jhta.cinema.dto.MovieDTO;
import kr.co.jhta.cinema.dto.MovieInfoDTO;
import lombok.Setter;

@Setter
@Service
public class MovieServiceImple implements MovieService  {
	@Autowired
	MovieDAO dao;
	@Override
	public List<MovieDTO> readAll() {
		return dao.readAll();
	}
	@Override
	public List<MovieDTO> readBox() {
		return dao.movieBox();
	}
	@Override
	public MovieDTO readOne(int mno) {
		return dao.movieOne(mno);
	}
	@Override
	public List<MovieInfoDTO> readMovie(int showflag) {
		return dao.showMovie(showflag);
	}


	
	
}
