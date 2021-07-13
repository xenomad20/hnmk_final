package kr.co.jhta.cinema.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
import kr.co.jhta.cinema.dto.ReserveDTO;
import kr.co.jhta.cinema.dto.ScheduleDTO;
import kr.co.jhta.cinema.service.CommentService;
import kr.co.jhta.cinema.service.CustomerService;
import kr.co.jhta.cinema.service.MovieDetailService;
import kr.co.jhta.cinema.service.MovieService;
import kr.co.jhta.cinema.service.ReserveService;
import kr.co.jhta.cinema.service.TheaterService;
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
	@Autowired
	CustomerService cus;
	@Autowired
	ReserveService rs;
	@Autowired
	TheaterService ts;

	@RequestMapping("/movie")
	public String movieShow(Model model) {

		List<MovieInfoDTO> showList = ms.readMovie(1);

		List<MovieInfoDTO> scheduleList = ms.readMovie(0);

		model.addAttribute("showList", showList);
		model.addAttribute("scheduleList", scheduleList);

		/* model.addAttribute("mno",1); */

		return "movie";
	}

	@RequestMapping("/detail")
	public String detail(@RequestParam("mno") String mno, Model model, HttpSession session) {
		// System.out.println(mno);
		// mno 존재 x > movie로 되돌아가기
		if (mno == null) {
			return "/movie";
			// mno 존재 o > service에서 값 가져오기
		} else {
			int no = Integer.parseInt(mno);
			MovieDetailInfoDTO mdList = mds.readDetailOne(no);
			List<CommentDTO> cmList = cs.readAll(no);
			//버튼 누를 때 로그인 여부 확인
			//비로그인 시 > 로그인으로 > 
			//						로그인 시 > 코멘트 입력
			
			
			/////////추가내용///////////
			
			model.addAttribute("mno", no);
			// 코멘트작성하려할때 로그인이 안되어있으면 불가
			// location.href 에 파라미터값 영화번호 를 추가해주기위한 변수
			
			model.addAttribute("mno", no);
			Object obj = session.getAttribute("id");
			if (obj != null) { // 로그인이 되어있을때만 실행, 로그인이 안되어있으면 아래값들이 null값이 뜨기때문에 필수코드
				model.addAttribute("mno", no);
				String id = (String) obj;
				model.addAttribute("id", obj);
				// 코멘트작성하려할때 confilm창에서 취소를하면 현재 디테일페이지가보여줘야하기때문에

				// 코멘트작성하려할때 로그인은되어있는데 본인이 관람한 영화가아닐시에 불가

				// 예매한 영화번호를 알아오기위해
				CustomerDTO cdto = cus.selectInfo(id); // 현재 로그인되어있는 아이디의 회원정보중에 회원번호(customerno)를 가져와서
				ReserveDTO rdto = rs.selectReserve(cdto.getCustomerno()); // 상영일정번호(ssno)를 가져오기위해 예매목록에서
																			// 회원번호(customerno)를기준으로 조회
				if (rdto != null) { // 예매내역이 있으면해
					int ssno = rdto.getSsno();
					ScheduleDTO scdto = ts.scheduleAll(ssno);// 상영일정테이블에서 상영일정번호(ssno)를 기준으로 영화번호(mno)를 찾아옴
					model.addAttribute("idmno", scdto.getMno());// 현재 로그인되어있는 회원이 예매한 영화
					
					model.addAttribute("customerno", cdto.getCustomerno()); //comment테이블에 post로넘길때 hidden에사용할 회원번호가필요하기때문에
					
				} else { // 예매내역이없으면
					model.addAttribute("idmno", null); // null 만 전달
				}
				
			}
			////////////////////////////////////////////////////////
			model.addAttribute("mdList", mdList);
			model.addAttribute("cmList", cmList);
		}

		return "/movieDetail";
	}
	//코멘트 테이블에 insert
	@PostMapping("/detail")
	public String comment(@RequestParam("customerno")int customerno,
			@RequestParam("mno")String mno,
			@RequestParam("grade")int grade,
			@RequestParam("review")String review) {
		int mmno = Integer.parseInt(mno);
		CommentDTO codto = new CommentDTO();
		codto.setCustomerno(customerno);
		codto.setMno(mmno);
		codto.setMcgrade(grade);
		codto.setMccontents(review);
		
		cs.insertOne(codto);
		
		return"redirect:detail?mno="+mmno;
	}
}
