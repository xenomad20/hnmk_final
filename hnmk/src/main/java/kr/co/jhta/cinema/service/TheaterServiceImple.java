package kr.co.jhta.cinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.cinema.dao.TheaterDAO;
import kr.co.jhta.cinema.dto.ScheduleDTO;
import kr.co.jhta.cinema.dto.ScreenDTO;
import kr.co.jhta.cinema.dto.SeatDTO;
import kr.co.jhta.cinema.dto.TheaterDTO;
@Service
public class TheaterServiceImple implements TheaterService {
	@Autowired
	TheaterDAO dao;
	
	@Override
	public List<TheaterDTO> theaterAll() {
		return dao.theaterAll();
	}

	@Override
	public TheaterDTO theaterOne(int cno) {
		return dao.theaterOne(cno);
	}

	@Override
	public List<ScreenDTO> screenAll() {
		return dao.screenAll();
	}

	@Override
	public List<ScreenDTO> screenTheaterAll(int cno) {
		return dao.screenTheater(cno);
	}

	@Override
	public List<ScheduleDTO> scheduleMnoSname(ScheduleDTO dto) {
		return dao.scheduleMnoSname(dto);
	}

	@Override
	public List<SeatDTO> seatScreen(String sname) {
		return dao.seatScreen(sname);
	}

	@Override
	public ScheduleDTO scheduleAll(int ssno) {
		return dao.scheduleAll(ssno);
	}


}
