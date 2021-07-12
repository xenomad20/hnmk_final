package kr.co.jhta.cinema.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.cinema.dto.CommentDTO;
import kr.co.jhta.cinema.dto.MovieDTO;
import kr.co.jhta.cinema.dto.MovieDetailDTO;
import kr.co.jhta.cinema.dto.MovieDetailInfoDTO;
import kr.co.jhta.cinema.dto.MovieInfoDTO;
import kr.co.jhta.cinema.service.CommentService;
import kr.co.jhta.cinema.service.MovieDetailService;
import kr.co.jhta.cinema.service.MovieService;
import lombok.Setter;

@Controller
@Setter
public class MovieController {
	@Autowired
	MovieService ms;
	@Autowired
	MovieDetailService mds;
	@Autowired
	CommentService cs;
	
	@RequestMapping("/movie")
	public String movieShow(Model model) {
		
		List<MovieInfoDTO> showList = ms.readMovie(1);
		
		List<MovieInfoDTO> scheduleList = ms.readMovie(0);
		

		model.addAttribute("showList",showList);
		model.addAttribute("scheduleList",scheduleList);
		
		/* model.addAttribute("mno",1); */
		
		return "movie";
	}
	
	@RequestMapping("/detail")
	public String detail(@RequestParam("mno") String mno, Model model) {
		//System.out.println(mno);
		//mno 존재 x > movie로 되돌아가기
		if (mno == null) {
			return "/movie";
		//mno 존재 o > service에서 값 가져오기
		} else {
			int no = Integer.parseInt(mno);
			MovieDetailInfoDTO mdList = mds.readDetailOne(no);
			List<CommentDTO> cList = cs.readAll(no);
			//comment가 없을 때
			
			
			model.addAttribute("mdList", mdList);
			model.addAttribute("cList", cList);
		}
		
		
		return "/movieDetail";
	}
}
