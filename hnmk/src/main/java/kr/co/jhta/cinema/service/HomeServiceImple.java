package kr.co.jhta.cinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.cinema.dao.HomeDAO;
import kr.co.jhta.cinema.dto.MovieDTO;
import lombok.Setter;

@Setter
@Service
public class HomeServiceImple implements HomeService {
	
	@Autowired
	HomeDAO dao;

	//홈에서 포스터 조회
	@Override
	public List<MovieDTO> homeBoxAll() {
		return dao.homeBoxAll();
	}
	
}
