package kr.co.jhta.cinema.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.cinema.dao.CustomerDAO;
import kr.co.jhta.cinema.dto.CustomerDTO;

@Service
public class CustomerServiceImple implements CustomerService {
	
	@Autowired
	CustomerDAO customerDAO;
	
	//로그인 체크
	@Override
	public boolean loginCheck(CustomerDTO dto, HttpSession session) {
		boolean result = customerDAO.loginCheck(dto);
		if (result) { //true면 세션에 등록
			CustomerDTO dto2 = viewCustomer(dto);
			
			//세션 등록
			session.setAttribute("id", dto2.getId());
		}
		return result;
	}
	
	//로그인 정보
	@Override
	public CustomerDTO viewCustomer(CustomerDTO dto) {
		return customerDAO.viewCustomer(dto);
	}
	
	//로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate();		
	}
	
	//회원등록
	@Override
	public boolean joinCustomer(CustomerDTO dto) {		
//		int no = customerDAO.getNumber(); //시퀀스 다음값 얻어오기
//		dto.setNo(no);
		boolean result1 = customerDAO.joinCustomer(dto);
		boolean result2 = customerDAO.joinCustomerDetail(dto);
		return result1 && result2;
	}
	
	//회원등록시 아이디 중복체크
	@Override
	public int idDupCheck(CustomerDTO dto) throws Exception {
		return customerDAO.idDupCheck(dto);
	}
	
	//회원정보 열람 d
	@Override
	public CustomerDTO selectInfo(String id) {
		return customerDAO.selectInfo(id);
	}
	
	//회원정보 열람 c
	@Override
	public CustomerDTO selectInfoCustomer(CustomerDTO dto) {
		return customerDAO.selectInfoCustomer(dto);
	}
	
	//회원정보 수정
	@Override
	public void updateCustomer(CustomerDTO dto) throws Exception {
		customerDAO.updateCustomer(dto);		
	}	

}
