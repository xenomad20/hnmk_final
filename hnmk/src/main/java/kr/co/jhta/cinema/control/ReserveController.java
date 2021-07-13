package kr.co.jhta.cinema.control;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.cinema.dto.CustomerDTO;
import kr.co.jhta.cinema.dto.MovieDTO;
import kr.co.jhta.cinema.dto.MovieDetailInfoDTO;
import kr.co.jhta.cinema.dto.ReserveDTO;
import kr.co.jhta.cinema.dto.ScheduleDTO;
import kr.co.jhta.cinema.dto.ScreenDTO;
import kr.co.jhta.cinema.dto.SeatDTO;
import kr.co.jhta.cinema.dto.TheaterDTO;
import kr.co.jhta.cinema.service.CustomerService;
import kr.co.jhta.cinema.service.MovieDetailService;
import kr.co.jhta.cinema.service.MovieService;
import kr.co.jhta.cinema.service.ReserveService;
import kr.co.jhta.cinema.service.TheaterService;
import lombok.Setter;

@Controller
@Setter
public class ReserveController {
	@Autowired
	MovieService ms;
	@Autowired
	TheaterService ts;
	@Autowired
	MovieDetailService mdsi;
	@Autowired
	ReserveService rs;
	@Autowired
	CustomerService cs;
	

	@GetMapping("/reserve") // parameter가 null 일때 허용해주는 코드
	public String reserveForm(Model model, @RequestParam(value = "cno", required = false) String cno,
			@RequestParam(value = "mno", required = false) String mno,
			@RequestParam(value = "sname", required = false) String sname,
			@RequestParam(value = "desc", required = false) String desc, HttpSession session) {
		Object obj = session.getAttribute("id");
		
		if (obj != null) {	
		String id= (String)obj;
		if (cno != null) {
			int ccno = Integer.parseInt(cno);
			// 상영관 영화관기준리스트
			List<ScreenDTO> screentheater = ts.screenTheaterAll(ccno);
			model.addAttribute("screentheater", screentheater); // 영화관기준 상영관리스트
			TheaterDTO theaterOne = ts.theaterOne(ccno);
			model.addAttribute("theaterOne", theaterOne); // 영화관 1개조회
		}
		if (mno != null) {
			int mmno = Integer.parseInt(mno);
			// 영화1건
			MovieDTO movieOne = ms.readOne(mmno);
			model.addAttribute("movieOne", movieOne); // 영화관 1개조회
		

		}
		if (sname != null && mno != null) {
			int mmno = Integer.parseInt(mno);
			ScheduleDTO schdto = new ScheduleDTO();
			schdto.setMno(mmno);
			schdto.setSname(sname);
			List<ScheduleDTO> schdtolist = ts.scheduleMnoSname(schdto);
			model.addAttribute("schdtolist", schdtolist); // 상영일정 영화,상영관 기준
		}
		if (desc != null) {
			model.addAttribute("desc", desc);
		}

		SimpleDateFormat format1 = new SimpleDateFormat("MM월dd일");
		// 오늘날짜
		Calendar c = Calendar.getInstance();
		String today = format1.format(c.getTime());

		// 내일날짜
		c.add(Calendar.DAY_OF_MONTH, +1);
		String tomorrow = format1.format(c.getTime());

		// 오늘기준 일주일 날짜리스트(오늘,내일이 있으니까 5개만)
		ArrayList<String> datelist = new ArrayList<String>();
		ArrayList<String> daylist = new ArrayList<String>();

		String[] day = { "일", "월", "화", "수", "목", "금", "토" };

		for (int i = 1; i <= 5; i++) {
			c.add(Calendar.DAY_OF_MONTH, +1);
			// 일주일 날짜
			String week = format1.format(c.getTime());
			datelist.add(week);
			// 일주일 요일
			String days = day[c.get(c.DAY_OF_WEEK) - 1];
			daylist.add(days);
		}

		// 영화리스트
		List<MovieDTO> movielist = ms.readAll();
		// 박스오피스리스트
		List<MovieDTO> movieBoxlist = ms.readBox();
		// 영화관리스트
		List<TheaterDTO> theaterlist = ts.theaterAll();

		model.addAttribute("today", today); // 오늘날짜
		model.addAttribute("tomorrow", tomorrow); // 내일날짜
		model.addAttribute("datelist", datelist); // 오늘 기준 일주일 날짜들
		model.addAttribute("daylist", daylist); // 오늘 기준 일주일 요일들
		model.addAttribute("movielist", movielist); // 영화리스트
		model.addAttribute("movieBoxlist", movieBoxlist); // 박스오피스리스트
		model.addAttribute("theaterlist", theaterlist); // 영화관리스트
		
		CustomerDTO cdto= cs.selectInfo(id);
		ReserveDTO reserveCheck= rs.selectReserve(cdto.getCustomerno());
		
		model.addAttribute("reserveCheck", reserveCheck); //이미 티켓이있으면 예매불가
		
		return "reserveForm";
		
		}else{
			return "redirect:loginForm.do";
		}
	}

	@GetMapping("/seat")
	public String seatForm(@RequestParam(value = "cno", required = false) String cno,
			@RequestParam(value = "mno", required = false) String mno,
			@RequestParam(value = "sname", required = false) String sname,
			@RequestParam(value = "ssno", required = false) String ssno, Model model, HttpSession session) {
		Object obj = session.getAttribute("id");
		if (obj != null) {	
		// 영화좌석 상영관기준
		if (sname != null) {
			List<SeatDTO> seatScreen = ts.seatScreen(sname);
			model.addAttribute("seatScreen", seatScreen);// 영화좌석
		}
		if (mno != null) {
			int mmno = Integer.parseInt(mno);
			// 영화1건
			MovieDTO movieOne = ms.readOne(mmno);
			model.addAttribute("movieOne", movieOne); // 영화관 1개조회
			
			
			MovieDetailInfoDTO mdidto = mdsi.readDetailOne(mmno);
			model.addAttribute("mdidto", mdidto); // 영화관디테일 1개조회(관란등급을위해)
		}
		if (cno != null) {
			int ccno = Integer.parseInt(cno);
			// 상영관 영화관기준리스트
			TheaterDTO theaterOne = ts.theaterOne(ccno);
			model.addAttribute("theaterOne", theaterOne); // 영화관 1개조회
		}
		if (ssno != null) {
			int sssno = Integer.parseInt(ssno);
			ScheduleDTO schdto = ts.scheduleAll(sssno);
			model.addAttribute("schdto", schdto);
		}

		model.addAttribute("mno", mno);
		model.addAttribute("cno", cno);
		model.addAttribute("sname", sname);

		return "seatForm";
		}else {
			return "redirect:loginForm.do";
		}
	}

	@PostMapping("/pay")
	public String pay(@RequestParam("sname") String sname, @RequestParam("amount") String amount,
			@RequestParam("ssno") String ssno, @RequestParam("seatno1") String seatno1,
			@RequestParam("seatno2") String seatno2, @RequestParam("seatno3") String seatno3,
			@RequestParam("seatno4") String seatno4, HttpSession session) {
		Object obj = session.getAttribute("id");
		if (obj != null) {

			ReserveDTO dto = new ReserveDTO(); // 예매테이블에 담을 dto
			ReserveDTO dto2 = new ReserveDTO(); // 예매디테일테이블에 담을 dto
			
			if (sname != null && seatno1 != null && seatno2 != null && seatno3 != null && seatno4 != null
					&& amount != null && ssno != null) {

				int total = Integer.parseInt(amount);
				int sssno = Integer.parseInt(ssno);

				// seatform에서 seatno를 문자열자르기로 사용했기때문에 ex) A10 만나오게
				// reserve 테이블에 값을 넣을때 sname(상영관), seatno(좌석맨끝번호)를 붙여넣어야한다
				// ex)GANGNAM1+.+A10 => GANGNAM1.A10

				// 좌석 예약완료로 변경 0=빈좌석 1= 거리두기좌석 2=예매완료

				// 티켓번호 8자리 영어,숫자 섞여있는 문자열
				Random rnd = new Random();
				StringBuffer sb = new StringBuffer();

				for (int i = 0; i <= 8; i++) {
					if (rnd.nextBoolean()) {
						sb.append((char) (int) (rnd.nextInt(26) + 65));
					} else {
						sb.append(rnd.nextInt(10));
					}
				}

				String ticketno = sb.toString();

				if (seatno2 == "" && seatno3 == "" && seatno4 == "") {// 1명일때
					dto2.setTicketno(ticketno);
					dto2.setSeatno(sname + "." + seatno1);
					rs.insertReserveDt(dto2); // 예매 디테일 테이블 insert
					rs.updateAvail(sname + "." + seatno1); // 좌석완료

				} else if (seatno3 == "" && seatno4 == "") { // 2명일때
					dto2.setTicketno(ticketno);

					dto2.setSeatno(sname + "." + seatno1);
					rs.insertReserveDt(dto2); // 예매 디테일 테이블 insert
					rs.updateAvail(sname + "." + seatno1); // 좌석완료

					dto2.setSeatno(sname + "." + seatno2);
					rs.insertReserveDt(dto2); // 예매 디테일 테이블 insert
					rs.updateAvail(sname + "." + seatno2); // 좌석완료
				} else if (seatno4 == "") { // 3명일때
					dto2.setTicketno(ticketno);

					dto2.setSeatno(sname + "." + seatno1);
					rs.insertReserveDt(dto2); // 예매 디테일 테이블 insert
					rs.updateAvail(sname + "." + seatno1); // 좌석완료

					dto2.setSeatno(sname + "." + seatno2);
					rs.insertReserveDt(dto2); // 예매 디테일 테이블 insert
					rs.updateAvail(sname + "." + seatno2); // 좌석완료

					dto2.setSeatno(sname + "." + seatno3);
					rs.insertReserveDt(dto2); // 예매 디테일 테이블 insert
					rs.updateAvail(sname + "." + seatno3); // 좌석완료
				} else { // 4명일때
					dto2.setTicketno(ticketno);

					dto2.setSeatno(sname + "." + seatno1);
					rs.insertReserveDt(dto2); // 예매 디테일 테이블 insert
					rs.updateAvail(sname + "." + seatno1); // 좌석완료

					dto2.setSeatno(sname + "." + seatno2);
					rs.insertReserveDt(dto2); // 예매 디테일 테이블 insert
					rs.updateAvail(sname + "." + seatno2); // 좌석완료

					dto2.setSeatno(sname + "." + seatno3);
					rs.insertReserveDt(dto2); // 예매 디테일 테이블 insert
					rs.updateAvail(sname + "." + seatno3); // 좌석완료

					dto2.setSeatno(sname + "." + seatno4);
					rs.insertReserveDt(dto2); // 예매 디테일 테이블 insert
					rs.updateAvail(sname + "." + seatno4); // 좌석완료
				}

				String id = (String) obj;
				CustomerDTO cdto = cs.selectInfo(id);

				int addPoint = cdto.getPoint() + (total / 100); // 포인트=>보유포인트+총금액의1%
				cdto.setPoint(addPoint);
				cdto.setCustomerno(cdto.getCustomerno());
				rs.updatePoint(cdto);// 회원 포인트 update

				int no = cdto.getCustomerno();// 회원번호

				dto.setTicketno(ticketno); // 티켓번호
				dto.setTotal(total); // 총금액
				dto.setCustomerno(no); // 회원번호
				dto.setSsno(sssno); // 상영일정번호
				rs.insertReserve(dto); // 예메 테이블 insert

			}

			return "redirect:mypageForm.do";
		} else {
			return "redirect:loginForm.do";
		}
	}

	@PostMapping("/cancel")
	public String cancel(@RequestParam("customerno") int customerno, @RequestParam("ticketno") String ticketno,
			@RequestParam("sname") String sname, @RequestParam("seatno") String[] seatno) {

			
		//좌석을 배열로 받아와 배열이 몇개있는지(좌석수)에따라 나눔
		if(seatno.length==1) {
			rs.deleteReserve(customerno); // 예매테이블삭제
			rs.deleteRd(ticketno); // 예매디테일테이블(좌석)삭제
			rs.cancelSeatno(sname + "." + seatno[0]); // 좌석 선택가능으로 update
		}else if(seatno.length==2) {
			rs.deleteReserve(customerno); // 예매테이블삭제
			rs.deleteRd(ticketno); // 예매디테일테이블(좌석)삭제
			rs.cancelSeatno(sname + "." + seatno[0]); // 좌석 선택가능으로 update
			rs.cancelSeatno(sname + "." + seatno[1]); // 좌석 선택가능으로 update
		}else if(seatno.length==3) {
			rs.deleteReserve(customerno); // 예매테이블삭제
			rs.deleteRd(ticketno); // 예매디테일테이블(좌석)삭제
			rs.cancelSeatno(sname + "." + seatno[0]); // 좌석 선택가능으로 update
			rs.cancelSeatno(sname + "." + seatno[1]); // 좌석 선택가능으로 update
			rs.cancelSeatno(sname + "." + seatno[2]); // 좌석 선택가능으로 update
		}else {
			rs.deleteReserve(customerno); // 예매테이블삭제
			rs.deleteRd(ticketno); // 예매디테일테이블(좌석)삭제
			rs.cancelSeatno(sname + "." + seatno[0]); // 좌석 선택가능으로 update
			rs.cancelSeatno(sname + "." + seatno[1]); // 좌석 선택가능으로 update
			rs.cancelSeatno(sname + "." + seatno[2]); // 좌석 선택가능으로 update
			rs.cancelSeatno(sname + "." + seatno[3]); // 좌석 선택가능으로 update
		}

		return "redirect:mypageForm.do";
	}

}
