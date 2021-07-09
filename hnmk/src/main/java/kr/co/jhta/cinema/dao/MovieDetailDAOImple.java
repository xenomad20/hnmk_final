package kr.co.jhta.cinema.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.cinema.dto.MovieDTO;
import kr.co.jhta.cinema.dto.MovieDetailDTO;
import kr.co.jhta.cinema.dto.MovieDetailInfoDTO;
import kr.co.jhta.cinema.dto.MovieInfoDTO;
import lombok.Getter;
import lombok.Setter;

@Repository
@Setter
@Getter
public class MovieDetailDAOImple implements MovieDetailDAO {
   @Autowired
   private SqlSession ss;

   @Override
   public MovieDetailInfoDTO movieDetailOne(int mno) {	
	   // TODO Auto-generated method stub
	   return ss.selectOne("kr.co.jhta.cinema.movieDetailOne", mno);
   }
   
      
   



}