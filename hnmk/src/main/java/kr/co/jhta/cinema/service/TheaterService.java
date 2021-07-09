package kr.co.jhta.cinema.service;

import java.util.List;

import kr.co.jhta.cinema.dto.ScheduleDTO;
import kr.co.jhta.cinema.dto.ScreenDTO;
import kr.co.jhta.cinema.dto.SeatDTO;
import kr.co.jhta.cinema.dto.TheaterDTO;

public interface TheaterService {
	//영화관 전체 조회
	public List<TheaterDTO> theaterAll();
	//영화관 1건 조회
	public TheaterDTO theaterOne(int cno);
	//상영관 전체 조회
	public List<ScreenDTO> screenAll();
	//상영관 영화관기준으로 조회 (ex 무슨영화관 몇관,몇관,몇관)
	public List<ScreenDTO> screenTheaterAll(int cno);
	//스케줄 영화,상영관 기준으로 조회 (ex 몇관 무슨영화가 몇시)
	public List<ScheduleDTO> scheduleMnoSname(ScheduleDTO dto);
	//좌석 상영관 기준으로 조회(ex 몇관 무슨좌석)
	public List<SeatDTO> seatScreen(String sname);
	//스케줄 스케줄번호기준
	public ScheduleDTO scheduleAll(int ssno);
	
}
