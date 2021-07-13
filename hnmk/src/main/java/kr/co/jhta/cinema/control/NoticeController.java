package kr.co.jhta.cinema.control;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import kr.co.jhta.cinema.dto.CustomerDTO;
import kr.co.jhta.cinema.dto.NoticeDTO;
import kr.co.jhta.cinema.service.CustomerService;
import kr.co.jhta.cinema.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	NoticeService ns;
	
	@Autowired
	CustomerService cs;

	@GetMapping("/notice.do")
	public String notice(CustomerDTO dto,HttpSession session, Model model, @RequestParam(name = "currentPageNo", defaultValue = "1") int currentPageNo) {

		// 페이지당 게시물 수
		int countPerPage = 7;
		// 시작번호
		int startNo = (currentPageNo - 1) * countPerPage + 1;
		// 끝번호
		int endNo = currentPageNo * countPerPage;
		


		// 							FAQ
		// 고객센터 FAQ 모두 list에 담아주기
		List<NoticeDTO> list = ns.readAll(startNo, endNo);
		model.addAttribute("list", list);
		
		
		
		//					1:1문의
		// 페이지당 게시물 수
		int countPerPage2 = 7;
		// 시작번호
		int startNo2 = (currentPageNo - 1) * countPerPage2 + 1;
		// 끝번호
		int endNo2 = currentPageNo * countPerPage2;
		// 총 페이지 수
		int totalCount2 = ns.inquiryData();
		int totalPage2 = (totalCount2 % countPerPage2 == 0) ? totalCount2/countPerPage2 : totalCount2/countPerPage2 + 1;

		// 페이지 시작 번호
		int startPageNo2 = currentPageNo - 5 <= 0 ? 1 : currentPageNo - 5;
		// 페이지 끝 번호
		int endPageNo2 = (startPageNo2 + 10 >= totalPage2) ? totalPage2 : startPageNo2 + 10;

		// 이전버튼
		boolean prev2 = currentPageNo > 3 ? true : false;
		// 다음버튼
		boolean next2 = currentPageNo + 3 >= totalPage2 ? false : true;

		// 파라미터로 담아주기
		model.addAttribute("currentPageNo2" + currentPageNo);
		model.addAttribute("startNo2", startNo2);
		model.addAttribute("endNo2", endNo2);
		model.addAttribute("countPerPage2", countPerPage2);
		model.addAttribute("totalCount2", totalCount2);
		model.addAttribute("totalPage2", totalPage2);
		model.addAttribute("prev2", prev2);
		model.addAttribute("next2", next2);
		model.addAttribute("startPageNo2", startPageNo2);
		model.addAttribute("endPageNo2", endPageNo2);
		
		List<NoticeDTO> inquiry = ns.inquiryAll(startNo2, endNo2);
		model.addAttribute("inquiry",inquiry);
		
				
		

		// 							공지사항
		// 페이지당 게시물 수
		int countPerPage1 = 7;
		// 시작번호
		int startNo1 = (currentPageNo - 1) * countPerPage1 + 1;
		// 끝번호
		int endNo1 = currentPageNo * countPerPage1;
		
		// 총 페이지 수
		int totalCount1 = ns.NoticeTotal();
		int totalPage1 = (totalCount1 % countPerPage1 == 0) ? totalCount1 / countPerPage1 : totalCount1 / countPerPage1 + 1;

		// 페이지 시작 번호
		int startPageNo1 = currentPageNo - 5 <= 0 ? 1 : currentPageNo - 5;
		// 페이지 끝 번호
		int endPageNo1 = (startPageNo1 + 10 >= totalPage1) ? totalPage1 : startPageNo1 + 10;

		// 이전버튼
		boolean prev1 = currentPageNo > 1 ? true : false;
		// 다음버튼
		boolean next1 = currentPageNo + 1 >= totalPage1 ? false : true;

		// 파라미터로 담아주기
		model.addAttribute("currentPageNo1" + currentPageNo);
		model.addAttribute("startNo1", startNo1);
		model.addAttribute("endNo1", endNo1);
		model.addAttribute("countPerPage1", countPerPage1);
		model.addAttribute("totalCount1", totalCount1);
		model.addAttribute("totalPage1", totalPage1);
		model.addAttribute("prev1", prev1);
		model.addAttribute("next1", next1);
		model.addAttribute("startPageNo1", startPageNo1);
		model.addAttribute("endPageNo1", endPageNo1);
		
		List<NoticeDTO> notice = ns.noticeAll(startNo1, endNo1);
		model.addAttribute("notice", notice);
		
		// important공지사항
		List<NoticeDTO> importantOne = ns.importantOne();
		model.addAttribute("important",importantOne);
		
		// id의 customerno 가져오기
		Object obj = session.getAttribute("id");
		if(obj!=null) {
			String id = (String)obj;
			
			CustomerDTO cdto = cs.selectInfo(id);
			model.addAttribute("cdto",cdto);
			model.addAttribute("id", id);
		}
		

		return "notice";
	}
	
	// 공지사항detail
	@RequestMapping("/noticeDetail.do")	
	public String detail(@RequestParam("nno")int nno,Model model) {
		model.addAttribute("detail",ns.noticeOne(nno));
		
		// 조회수 업데이트
		ns.notUpdateHits(nno);
		
		return "noticeDetail";
	}
	
	// 1:1문의 쓰기
	@GetMapping("/notice_write.do")
	public String write(Model model, CustomerDTO dto, HttpSession session) {
		Object obj = session.getAttribute("id");
		if(obj!=null) {
			String id = (String)obj;
			
			dto = cs.selectInfo(id);
			model.addAttribute("cdto",dto);
			
			return "notice_write";
		}else {
			
			return "redirect:loginForm.do";
		}
	}
	// 1:1문의 쓰기
	@PostMapping("/notice_write.do")
	public String writeForm(@ModelAttribute NoticeDTO dto, HttpServletRequest req) {
		ns.write(dto);
		return "redirect:/notice.do#tabs-3";
	}
	
	// 1:1문의 보기
	@GetMapping("/noticeDetail_inquiry.do")
	public String inquiry(@RequestParam(value = "fno" ,required = false, defaultValue = "0")int fno,Model model, CustomerDTO dto, HttpSession session) {
		Object obj = session.getAttribute("id");
		if(obj!=null) {
			String id = (String)obj;
			
			dto = cs.selectInfo(id);
			model.addAttribute("cdto",dto);
			model.addAttribute("inquiryOne",ns.inquiryOne(fno));
			model.addAttribute("answer",ns.answerAll(fno));
			
			// 조회수 업데이트
			ns.faqUpdateHits(fno);
			return "noticeDetail_inquiry";
		}else {
			return "redirect:loginForm.do";
		}
	}
	
	// 1:1문의 댓글달기
	@PostMapping("/noticeDetail_inquiry.do")
	public String insertAnswer(@ModelAttribute NoticeDTO dto, HttpServletRequest req) {
		ns.insertAnswer(dto);
		return "redirect:/noticeDetail_inquiry.do?fno="+dto.getFno();
	}
	
	// 1:1문의 수정하기
	@GetMapping("/inquiryModify.do")
	public ModelAndView updateInquiry(@RequestParam("fno")int fno) {
		return new ModelAndView("notice_inquiryModify","modify",ns.inquiryOne(fno));
	}
	
	// 1:1문의 수정하기
	@PostMapping("/inquiryModify.do")
	public String modifyInquiry(@ModelAttribute NoticeDTO dto) {
		ns.updateInquiry(dto);
		return "redirect:/noticeDetail_inquiry.do?fno="+dto.getFno();
		
	}
	
	// 1:1문의 삭제하기
	@PostMapping("/inquiryDelete.do")
	public String inquiryDelete(@RequestParam("fno")int fno) {
		ns.deleteInquiry(fno);
		return "redirect:/notice.do#tabs-3";
	}
	
	// 1:1문의 비밀번호
	@ResponseBody
	@GetMapping("/passChk.do")
	public int passChk(NoticeDTO dto) throws Exception{
		return ns.passChk(dto);
	}

}
