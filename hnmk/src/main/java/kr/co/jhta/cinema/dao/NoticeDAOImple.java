package kr.co.jhta.cinema.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jhta.cinema.dto.NoticeDTO;
import kr.co.jhta.cinema.dto.StartEnd;
import lombok.Setter;

@Repository
@Setter
public class NoticeDAOImple implements NoticeDAO{

	@Autowired
	private SqlSession ss;
	
	@Override
	public List<NoticeDTO> selectAll(int startNo, int endNo) {
		
		StartEnd se = new StartEnd(startNo, endNo);
		// 고객센터 FAQ 모두 가져오기
		return ss.selectList("kr.co.jhta.cinema.selectAll",se);
	}

	@Override	// 고객센터 공지사항 모두 가져오기
	public List<NoticeDTO> selectNoticeAll(int startNo, int endNo) {
		StartEnd se = new StartEnd(startNo,endNo);
		return ss.selectList("kr.co.jhta.cinema.selectNoticeAll",se);
	}

	@Override	// 공지사항 페이지
	public int noticeCountAllData() {
		return ss.selectOne("kr.co.jhta.cinema.noticeData");
	}

	@Override	// 공지사항detail
	public NoticeDTO noticeOne(int nno) {
		return ss.selectOne("kr.co.jhta.cinema.noticeOne",nno);
	}

	@Override
	public List<NoticeDTO> importantOne() {
		return ss.selectList("kr.co.jhta.cinema.importantAll");
	}

	@Override
	public void insertOne(NoticeDTO dto) {
		ss.insert("kr.co.jhta.cinema.writeOne",dto);
		
	}

	@Override	// 1:1문의 가져오기
	public List<NoticeDTO> inquiryAll(int startNo, int endNo) {
		StartEnd se = new StartEnd(startNo, endNo);
		return ss.selectList("kr.co.jhta.cinema.inquiryAll",se);
	}
	
	@Override	// 1:1문의 페이지 가져오기
	public int inquiryAllData() {
		return ss.selectOne("kr.co.jhta.cinema.inquiryData");
	}

	@Override	// 1:1문의 Detail페이지 보기
	public NoticeDTO inquiryOne(int fno) {
		return ss.selectOne("kr.co.jhta.cinema.inquiryOne",fno);
	}

	@Override	// 1:1문의 댓글 가져오기
	public List<NoticeDTO> answerAll(int fno) {
		return ss.selectList("kr.co.jhta.cinema.answerAll",fno);
	}

	@Override	// 1:1문의 댓글 달기
	public void insertAnswer(NoticeDTO dto) {
		ss.insert("kr.co.jhta.cinema.insertAnswer",dto);
		
	}

	@Override	// 1:1문의 수정하기
	public void updateInquiry(NoticeDTO dto) {
		ss.update("kr.co.jhta.cinema.updateInquiry",dto);
		
	}

	@Override	// 1:1문의 삭제하기
	public void deleteInquiry(int fno) {
		 ss.delete("kr.co.jhta.cinema.deleteInquiry",fno);
		
	}

	@Override	// 1:1문의 조회수 업데이트
	public void updateHitsFAQ(int fno) {
		ss.update("kr.co.jhta.cinema.updateFAQHits", fno);
		
	}

	@Override	// 공지사항 조회수 업데이트
	public void updateHitsNotice(int nno) {
		ss.update("kr.co.jhta.cinema.updateNoticeHits", nno);
		
	}

	@Override	// 1:1문의 비밀번호
	public int passChk(NoticeDTO dto) throws Exception {
		return ss.selectOne("kr.co.jhta.cinema.passChk",dto);
	}


}
