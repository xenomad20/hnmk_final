package kr.co.jhta.cinema.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.cinema.dto.ScheduleDTO;
import kr.co.jhta.cinema.dto.ScreenDTO;
import kr.co.jhta.cinema.dto.SeatDTO;
import kr.co.jhta.cinema.dto.TheaterDTO;
import lombok.Setter;

@Repository
@Setter
public class TheaterDAOImple implements TheaterDAO {
	@Autowired
	private SqlSession ss;
	
	@Override
	public List<TheaterDTO> theaterAll() {
		return ss.selectList("kr.co.jhta.cinema.theaterAll");
	}

	@Override
	public TheaterDTO theaterOne(int cno) {
		return ss.selectOne("kr.co.jhta.cinema.theaterAll",cno);
	}

	@Override
	public List<ScreenDTO> screenAll() {
		return ss.selectList("kr.co.jhta.cinema.screenAll");
	}

	@Override
	public List<ScreenDTO> screenTheater(int cno) {
		return ss.selectList("kr.co.jhta.cinema.screenAll",cno);
	}

	@Override
	public List<ScheduleDTO> scheduleMnoSname(ScheduleDTO dto) {
		return ss.selectList("kr.co.jhta.cinema.scheduleMnoSname",dto);
	}

	@Override
	public List<SeatDTO> seatScreen(String sname) {
		return ss.selectList("kr.co.jhta.cinema.seatScreen",sname);
	}

	@Override
	public ScheduleDTO scheduleAll(int ssno) {
		return ss.selectOne("kr.co.jhta.cinema.scheduleAll",ssno);
	}




	
}
