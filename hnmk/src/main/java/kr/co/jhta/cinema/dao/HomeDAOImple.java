package kr.co.jhta.cinema.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.cinema.dto.MovieDTO;
import lombok.Setter;

@Repository
@Setter
public class HomeDAOImple implements HomeDAO {

	@Autowired
	SqlSession sqlSession;
	
	//홈에서 포스터 조회
	@Override
	public List<MovieDTO> homeBoxAll() {
		return sqlSession.selectList("kr.co.jhta.cinema.home.selectHomeBox");
	}
	
}
