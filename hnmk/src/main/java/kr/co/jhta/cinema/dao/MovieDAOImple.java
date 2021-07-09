package kr.co.jhta.cinema.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.cinema.dto.MovieDTO;
import kr.co.jhta.cinema.dto.MovieInfoDTO;
import lombok.Getter;
import lombok.Setter;

@Repository
@Setter
@Getter
public class MovieDAOImple implements MovieDAO {
	@Autowired
	private SqlSession ss;
	
	@Override
	public List<MovieDTO> readAll() {
		return ss.selectList("kr.co.jhta.cinema.movieAll");
	}

	@Override
	public List<MovieDTO> movieBox() {
		return ss.selectList("kr.co.jhta.cinema.movieBox");
	}

	@Override
	public MovieDTO movieOne(int mno) {
		return ss.selectOne("kr.co.jhta.cinema.movieAll", mno);
	}

	@Override
	public List<MovieInfoDTO> showMovie(int showflag) {
		return ss.selectList("kr.co.jhta.cinema.showMovie",showflag);
	}


}
