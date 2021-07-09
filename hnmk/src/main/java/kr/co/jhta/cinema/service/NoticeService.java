package kr.co.jhta.cinema.service;

import java.util.List;

import kr.co.jhta.cinema.dto.NoticeDTO;


public interface NoticeService {
	
	// 고객센터 FAQ 모두 가져오기
	public List<NoticeDTO> readAll(int startNo, int endNo);
	
	//고객센터 공지사항 모두 가져오기
	public List<NoticeDTO> noticeAll(int startNo, int endNo);
	
	//공지사항 페이지 가져오기
	public int NoticeTotal();
	
	// 공지사항detail
	public NoticeDTO noticeOne(int nno);
	
	//important 공지사항
	public List<NoticeDTO> importantOne();
	
	//1:1문의 쓰기
	public void write(NoticeDTO dto);
	
	// 1:1문의 가져오기
	public List<NoticeDTO> inquiryAll(int startNo, int endNo);
	
	// 1:1문의 페이지 가져오기
	public int inquiryData();
	
	// 1:1문의 보기
	public NoticeDTO inquiryOne(int fno);

	// 1:1문의 댓글 가져오기
	public List<NoticeDTO> answerAll(int fno);
	
	// 1:1문의 댓글 달기
	public void insertAnswer(NoticeDTO dto);
	
	// 1:1문의 수정하기
	public void updateInquiry(NoticeDTO dto);
	
	// 1:1문의글 삭제하기
	public void deleteInquiry(int fno);
	
	// 1:1문의 조회수 업데이트
	public void faqUpdateHits(int fno);
		
	// 공지사항 조회수 업데이트
	public void notUpdateHits(int nno);
	
	// 1:1문의 비밀번호
	public int passChk(NoticeDTO dto) throws Exception;
}
