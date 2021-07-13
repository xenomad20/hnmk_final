package kr.co.jhta.cinema.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.cinema.dto.CommentDTO;
import kr.co.jhta.cinema.dto.CustomerDTO;
import kr.co.jhta.cinema.dto.NoticeDTO;
import kr.co.jhta.cinema.dto.ReserveDTO;

@Repository
public class ReserveDAOImple implements ReserveDAO {
	@Autowired
	private SqlSession ss;
	
	@Override
	public void insertReserve(ReserveDTO dto) {
		ss.insert("kr.co.jhta.cinema.insertReserve", dto);
	}

	@Override
	public void insertReserveDt(ReserveDTO dto) {
		ss.insert("kr.co.jhta.cinema.insertReserveDt",dto);
	}

	@Override
	public void updateAvail(String seatno) {
		ss.update("kr.co.jhta.cinema.updateAvail", seatno);
	}

	@Override
	public ReserveDTO selectReserve(int customerno) {
		return ss.selectOne("kr.co.jhta.cinema.reserve.selectReserve", customerno);
	}

	@Override
	public List<ReserveDTO> selectRd(String ticketno) {
		return ss.selectList("kr.co.jhta.cinema.reserve.selectRd",ticketno);
	}

	@Override
	public void updatePoint(CustomerDTO cdto) {
		ss.update("kr.co.jhta.cinema.updatePoint",cdto);
	}

	@Override
	public void deleteReserve(int customerno) {
		ss.delete("kr.co.jhta.cinema.reserve.deleteReserve", customerno);
	}

	@Override
	public void deleteRd(String ticketno) {
		ss.delete("kr.co.jhta.cinema.reserve.deleteRd", ticketno);
	}

	@Override
	public void cancelSeatno(String seatno) {
		ss.update("kr.co.jhta.cinema.reserve.cancelSeatno", seatno);
	}

	@Override
	public List<NoticeDTO> selectFAQ(int customerno) {
		return ss.selectList("kr.co.jhta.cinema.selectFAQ",customerno);
	}

	@Override
	public List<CommentDTO> selectComment(int customerno) {
		return ss.selectList("kr.co.jhta.cinema.selectComment",customerno);
	}
	
	
}	
