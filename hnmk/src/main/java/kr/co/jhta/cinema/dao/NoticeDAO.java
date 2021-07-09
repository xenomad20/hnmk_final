package kr.co.jhta.cinema.dao;

import java.util.List;

import kr.co.jhta.cinema.dto.NoticeDTO;

public interface NoticeDAO {
	// 고객센터 FAQ 모두 가져오기				시작페이지번호~ 끝페이지번호
	public List<NoticeDTO> selectAll(int startNo, int endNo);
	
	// 고객센터 공지사항 모두 가져오기
	public List<NoticeDTO> selectNoticeAll(int startNo,int endNo);
	
	// 게심물이 몇개인지 가져오기
	public int noticeCountAllData();
	
	// 공지사항detail
	public NoticeDTO noticeOne(int nno);
	
	// important공지사항
	public List<NoticeDTO> importantOne();
	
	// 1:1문의 쓰기
	public void insertOne(NoticeDTO dto);
	
	// 1:1문의 모두 가져오기
	public List<NoticeDTO> inquiryAll(int startNo, int endNo);
	
	// 1:1문의 게시물 몇개인지
	public int inquiryAllData();
	
	// 1:1문의 보기
	public NoticeDTO inquiryOne(int fno);
	
	// 1:1문의 댓글 보기
	public List<NoticeDTO> answerAll(int fno);
	
	// 1:1문의 댓글 달기
	public void insertAnswer(NoticeDTO dto);
	
	// 1:1문의 수정하기
	public void updateInquiry(NoticeDTO dto);
	
	// 1:1문의 삭제하기
	public void deleteInquiry(int fno);
	
	// 1:1문의 조회수 업데이트
	public void updateHitsFAQ(int fno);

	// 공지사항 조회수 업데이트
	public void updateHitsNotice(int nno);
	
	// 1:1문의 비밀번호
	public int passChk(NoticeDTO dto) throws Exception;
}
