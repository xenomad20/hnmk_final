package kr.co.jhta.cinema.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.cinema.dto.TheaterDTO;
import kr.co.jhta.cinema.service.TheaterService;
import lombok.Setter;

@Controller
@Setter
public class CinemaController {

	@Autowired
	TheaterService ts;
	
	@GetMapping("/theaterguide")
	public String cinema() {
		
		return "cinemaguide";
	}
	
	@GetMapping("/theater")
	public String theater(Model model,  @RequestParam(value = "cno", required = false) String cno) {
		if(cno != null) {
			int tcno = Integer.parseInt(cno);
			//상영관 영화관기준리스트
			TheaterDTO theaterOne = ts.theaterOne(tcno);
			model.addAttribute("theaterOne", theaterOne); //영화관 1개조회
		}
		return "theater";
	}
}
