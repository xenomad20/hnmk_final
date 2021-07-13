package kr.co.jhta.cinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.cinema.dao.ReserveDAO;
import kr.co.jhta.cinema.dto.CommentDTO;
import kr.co.jhta.cinema.dto.CustomerDTO;
import kr.co.jhta.cinema.dto.NoticeDTO;
import kr.co.jhta.cinema.dto.ReserveDTO;

@Repository
public class ReserveServiceImple implements ReserveService {
	@Autowired
	ReserveDAO dao;
	
	@Override
	public void insertReserve(ReserveDTO dto) {
		dao.insertReserve(dto);
	}

	@Override
	public void insertReserveDt(ReserveDTO dto) {
		dao.insertReserveDt(dto);
	}

	@Override
	public void updateAvail(String seatno) {
		dao.updateAvail(seatno);
	}

	@Override
	public ReserveDTO selectReserve(int customerno) {
		return dao.selectReserve(customerno);
	}

	@Override
	public List<ReserveDTO> selectRd(String ticketno) {
		return dao.selectRd(ticketno);
	}

	@Override
	public void updatePoint(CustomerDTO cdto) {
	       dao.updatePoint(cdto);
	}

	@Override
	public void deleteReserve(int customerno) {
		dao.deleteReserve(customerno);
	}

	@Override
	public void deleteRd(String ticketno) {
		dao.deleteRd(ticketno);
	}

	@Override
	public void cancelSeatno(String seatno) {
		dao.cancelSeatno(seatno);
	}

	@Override
	public List<NoticeDTO> selectFAQ(int customerno) {
		return dao.selectFAQ(customerno);
	}

	@Override
	public List<CommentDTO> selectComment(int customerno) {
		return dao.selectComment(customerno);
	}
	
	
	

}
