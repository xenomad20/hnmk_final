package kr.co.jhta.cinema.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.cinema.dto.CustomerDTO;

@Repository
public class CustomerDAOImple implements CustomerDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	//로그인 체크
	@Override
	public boolean loginCheck(CustomerDTO dto) {
		String name = sqlSession.selectOne("loginCheck", dto);
		return (name == null) ? false : true;
	}
	
	//로그인 정보
	@Override
	public CustomerDTO viewCustomer(CustomerDTO dto) {
		return sqlSession.selectOne("viewCustomer", dto);
	}
	
	//로그아웃
	@Override
	public void logout(HttpSession session) {
		
	}
	
	//회원등록: customer 테이블
	@Override
	public boolean joinCustomer(CustomerDTO dto) {
		System.out.println("dto:" + dto.getId() + ":" + dto.getPwd());
		int count = sqlSession.insert("insertCustomer", dto);
		return count > 0 ? true : false;
	}
	
	//회원등록: customer_detail 테이블
	@Override
	public boolean joinCustomerDetail(CustomerDTO dto) {
		System.out.println("Customerregdate:" + dto.getCustomerregdate());
		int count = sqlSession.insert("insertCustomerDetail", dto);
		return count > 0 ? true : false;
	}
	
	//회원등록시 아이디 중복체크
	@Override
	public int idDupCheck(CustomerDTO dto) {
		return sqlSession.selectOne("idDupCheck", dto);
	}
	
	//회원정보 열람 d 
		@Override
		public CustomerDTO selectInfo(String id) {
			return sqlSession.selectOne("kr.co.jhta.cinema.customer.selectInfo", id);
		}	
		
	//회원정보 열람 c
	@Override
	public CustomerDTO selectInfoCustomer(CustomerDTO dto) {
		return sqlSession.selectOne("selectInfoCustomer", dto);
	}	
	
	//회원정보 수정: customer 테이블
	@Override
	public void updateCustomer(CustomerDTO dto) {
		sqlSession.update("updateCustomer", dto);
		
	}
	
	//회원정보 수정: customer_detail 테이블
	@Override
	public void updateCustomerDetail(CustomerDTO dto) {
		sqlSession.update("updateCustomerDetail", dto);
		
	}
	
}