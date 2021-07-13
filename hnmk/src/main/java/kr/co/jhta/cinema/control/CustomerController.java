package kr.co.jhta.cinema.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.cinema.dto.CommentDTO;
import kr.co.jhta.cinema.dto.CustomerDTO;
import kr.co.jhta.cinema.dto.MovieDTO;
import kr.co.jhta.cinema.dto.NoticeDTO;
import kr.co.jhta.cinema.dto.ReserveDTO;
import kr.co.jhta.cinema.dto.ScheduleDTO;
import kr.co.jhta.cinema.service.CustomerService;
import kr.co.jhta.cinema.service.MovieService;
import kr.co.jhta.cinema.service.NoticeService;
import kr.co.jhta.cinema.service.ReserveService;
import kr.co.jhta.cinema.service.TheaterService;

@Controller
public class CustomerController {

	@Autowired
	CustomerService cs;

	@Autowired
	ReserveService rs;

	@Autowired
	TheaterService ts;
	
	@Autowired 
	MovieService ms;
	
	// 홈으로 이동
	@RequestMapping(value = "/loginHome.do", method = RequestMethod.GET)
	public String loginHome(@ModelAttribute CustomerDTO id, HttpSession session, HttpServletResponse response)
			throws Exception {
		session.setAttribute("id", id.getId());

		System.out.println("홈으로 이동=============================================");
		return "loginHome";
	}

	// 로그인폼으로 이동
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String loginForm() throws Exception {

		System.out.println("로그인폼으로 이동=============================================");
		return "loginForm";
	}

	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(@ModelAttribute CustomerDTO id, HttpSession session, HttpServletResponse response)
			throws Exception {

		session.setAttribute("id", id.getId());

		System.out.println("로그인=============================================");
		return "redirect:home";
	}

	// 로그아웃
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response) throws Exception {

		session.invalidate();

		System.out.println("로그아웃=============================================");
		return "redirect:home";
	}

	// 회원가입폼으로 이동
	@RequestMapping(value = "/joinForm.do", method = RequestMethod.GET)
	public String joinForm() throws Exception {

		System.out.println("회원가입폼으로 이동=============================================");
		return "joinForm";
	}

	// 회원등록
	@RequestMapping(value = "/joinProc.do", method = RequestMethod.GET)
	public String joinProc(@ModelAttribute CustomerDTO dto) throws Exception {

		cs.joinCustomer(dto);

		System.out.println("회원등록=============================================");
		return "loginForm";
	}

	// 회원등록시 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/idDupCheck", method = RequestMethod.GET)
	public String idDupCheck(CustomerDTO dto) throws Exception {

		System.out.println("아이디중복체크=========================================");
		return Integer.toString(cs.idDupCheck(dto));
	}

	// 마이페이지로 이동
		@RequestMapping(value = "/mypageForm.do", method = RequestMethod.GET)
		public String mypageForm(CustomerDTO dto, Model model, HttpSession session) throws Exception {
			Object obj = session.getAttribute("id");
			if(obj!=null) {
			String id = (String)obj;
			
			//회원정보들
			CustomerDTO cdto= cs.selectInfo(id);
			model.addAttribute("cdto", cdto);
			
			//관렴평
			List<CommentDTO> colist = rs.selectComment(cdto.getCustomerno());
			model.addAttribute("colist", colist);
				
			//문의내역
			List<NoticeDTO> nlist = rs.selectFAQ(cdto.getCustomerno());
			model.addAttribute("nlist", nlist);
			
			//예매정보들을 각각 모아옴
			
			ReserveDTO rdto = rs.selectReserve(cdto.getCustomerno());
			if(rdto!=null) {
			model.addAttribute("rdto", rdto); // (티켓번호)

			List<ReserveDTO> rlist = rs.selectRd(rdto.getTicketno());
			model.addAttribute("rlist", rlist);// (좌석)
			
			ScheduleDTO sdto= ts.scheduleAll(rdto.getSsno());
			model.addAttribute("sdto", sdto); //(상영관,관람일시)
			
			MovieDTO mdto= ms.readOne(sdto.getMno());
			model.addAttribute("mdto", mdto);// (영화제목)
			}
			
			return "mypageForm";
			
			}else {
				return "redirect:loginForm.do"; //로그인이 안되어있으면 돌아가라
			}
		}

	// 회원정보로 이동
	@RequestMapping(value = "/customerInfoForm.do", method = RequestMethod.GET)
	public String customerInfoForm(CustomerDTO dto, Model model , HttpSession session) throws Exception {
		Object obj = session.getAttribute("id");
		String id = (String)obj;
		
		CustomerDTO dto2 = cs.selectInfo(id);// 아이디기준으로 전제정보를 
		
		model.addAttribute("dto2", dto2);
	

		System.out.println("회원정보로 이동=============================================");
		return "customerInfoForm";
	}

	// 회원정보 수정폼으로 이동
	@RequestMapping(value = "/customerUpdateForm.do", method = RequestMethod.GET)
	public String customerUpdateForm() throws Exception {

		System.out.println("회원정보 수정폼으로 이동=============================================");
		return "customerUpdateForm";
	}

	// 회원정보 수정
//	@RequestMapping(value="/updateCustomer.do", method = RequestMethod.POST)
//	public String updateCustomer(CustomerDTO dto, Model model, HttpSession session) throws Exception{		
//		cs.updateCustomer(dto);	
//
//		session.invalidate();
//		System.out.println("회원정보 수정=============================================");
//		return "redirect:/";
//	}

	// 회원정보 탈퇴폼으로 이동
	@RequestMapping(value = "/customerDeleteForm.do", method = RequestMethod.GET)
	public String customerDeleteForm() throws Exception {

		System.out.println("회원정보 탈퇴폼으로 이동=============================================");
		return "customerDeleteForm";
	}

	// 회원정보 탈퇴
//	@RequestMapping(value="/deleteCustomer.do", method = RequestMethod.POST)
//	public String deleteCustomer(CustomerDTO dto, Model model, HttpSession session) throws Exception{		
//		cs.updateCustomer(dto);	
//
//		session.invalidate();
//		System.out.println("회원정보 탈퇴=============================================");
//		return "redirect:/";
//	}

}
