package kr.co.jhta.cinema.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.cinema.dto.CommentDTO;
import kr.co.jhta.cinema.dto.CustomerDTO;
import kr.co.jhta.cinema.dto.MovieDTO;
import kr.co.jhta.cinema.dto.MovieDetailDTO;
import kr.co.jhta.cinema.dto.MovieDetailInfoDTO;
import kr.co.jhta.cinema.dto.MovieInfoDTO;
import kr.co.jhta.cinema.service.CommentService;
import kr.co.jhta.cinema.service.CustomerService;
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
	CommentService cms;
	@Autowired
	CustomerService cs;
	
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
			List<CommentDTO> cList = cms.readAll(no);
			//comment가 없을 때
			
			//버튼 누를 때 로그인 여부 확인
			//비로그인 시 > 로그인으로 > 
			//						로그인 시 > 코멘트 입력
			
			
			model.addAttribute("mdList", mdList);
			model.addAttribute("cList", cList);
		}
		
		
		return "/movieDetail";
	}
	
//	//ajax로 정보 가져온 다음, 값 넣기
//	
//	@ResponseBody
//	@RequestMapping(value="/comment_insert", method=RequestMethod.POST)
//	public String comment_login(Model model, CustomerDTO dto, HttpSession session) {
//		Object obj = session.getAttribute("id");
//		if(obj!=null) {
//			String id = (String)obj;
//			
//			dto = cs.selectInfo(id);
//			model.addAttribute("cdto",dto);
//			
//			return "/comment_insert";
//		}else {
//			
//			return "redirect:loginForm.do";
//		}
//	}
//	
//	
}
