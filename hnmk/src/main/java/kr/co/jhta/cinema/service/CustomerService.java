package kr.co.jhta.cinema.service;

import javax.servlet.http.HttpSession;

import kr.co.jhta.cinema.dto.CustomerDTO;

public interface CustomerService {
	
	//로그인 체크
	public boolean loginCheck(CustomerDTO dto, HttpSession session);
	
	//로그인 정보
	public CustomerDTO viewCustomer(CustomerDTO dto);
	
	//로그아웃
	public void logout(HttpSession session);
	
	//회원등록
	public boolean joinCustomer(CustomerDTO dto);
	
	//회원등록시 아이디 중복체크
	public int idDupCheck(CustomerDTO dto) throws Exception;
	
	//회원정보 열람
	public CustomerDTO selectInfo(String id);
	public CustomerDTO selectInfoCustomer(CustomerDTO dto);
	
	//회원정보 수정
	public void updateCustomer(CustomerDTO dto) throws Exception;
}
