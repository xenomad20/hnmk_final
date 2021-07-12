package kr.co.jhta.cinema.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.cinema.dto.CommentDTO;
import lombok.Getter;
import lombok.Setter;

@Repository
@Getter
@Setter
public class CommentDAOImple implements CommentDAO {
	@Autowired
	private SqlSession ss;
	
	@Override
	public List<CommentDTO> readAll(int mno) {
		return ss.selectList("kr.co.jhta.cinema.commentAll", mno);
	}

	@Override
	public CommentDTO readOne(int mno, int customerno) {
		Map<String, Integer> parameters = new HashMap<String, Integer>();
		parameters.put("mno",  mno);
		parameters.put("customerno", customerno);
		return ss.selectOne("kr.co.jhta.cinema.commentOne", parameters);
	}

	@Override
	public void insertOne(CommentDTO dto) {
		
		ss.insert("kr.co.jhta.cinema.cminsertOne", dto);
	}
	
}
