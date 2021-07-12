package kr.co.jhta.cinema.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jhta.cinema.dto.CustomerDTO;
import kr.co.jhta.cinema.dto.MovieDTO;
import kr.co.jhta.cinema.dto.NoticeDTO;
import kr.co.jhta.cinema.dto.ReserveDTO;
import kr.co.jhta.cinema.service.HomeService;
import kr.co.jhta.cinema.service.NoticeService;

@Controller
public class HomeController {	
	
	@Autowired
	NoticeService ns;
	
	@Autowired
	HomeService hs;
	
	//홈 페이지로 이동
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
		
		//공지사항 제목 보여주기
		List<NoticeDTO> list = ns.noticeAll(1, 5);
		model.addAttribute("list", list);
		
//		for (NoticeDTO dto: list) {
//			System.out.println(dto.getNtitle());
//		}
		
		//포스터 보여주기
		List<MovieDTO> listp = hs.homeBoxAll();
		model.addAttribute("listp", listp);
		
		return "home";
	}
	

}
