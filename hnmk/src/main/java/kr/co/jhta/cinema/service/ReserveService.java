package kr.co.jhta.cinema.service;

import java.util.List;

import kr.co.jhta.cinema.dto.CommentDTO;
import kr.co.jhta.cinema.dto.CustomerDTO;
import kr.co.jhta.cinema.dto.NoticeDTO;
import kr.co.jhta.cinema.dto.ReserveDTO;

public interface ReserveService {
	//예매 테이블 추가
	public void insertReserve(ReserveDTO dto);
	//예매 디테일 테이블 추가
	public void insertReserveDt(ReserveDTO dto);
	//좌석 예약상태 완료로 변경
	public void updateAvail(String seatno);
	//예매내역 열람
	public ReserveDTO selectReserve(int customerno);
	//좌석 열람
	public List<ReserveDTO> selectRd(String ticketno);
	//회원 포인트 총금액의1%추가
	public void updatePoint (CustomerDTO cdto);
	//예매취소 reserve테이블 삭제
	public void deleteReserve(int customerno);
	//예매취소 reserve_detail테이블 삭제
	public void deleteRd(String ticketno);
	//예매취소 좌석 다시 선택가능으로 변경
	public void cancelSeatno(String seatno);
	//나의 문의내역 customerController 마이페이지에서사용
	public List<NoticeDTO> selectFAQ(int customerno);
	//나의 관람평들 customerController 마이페이지에서 사용
	public List<CommentDTO> selectComment(int customerno);
}
