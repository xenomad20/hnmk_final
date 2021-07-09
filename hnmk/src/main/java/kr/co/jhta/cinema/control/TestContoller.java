package kr.co.jhta.cinema.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestContoller {
	@RequestMapping("/hello.do")
	public String hello() {
		return "hello";
	}
	
}
