package kr.co.jhta.cinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.cinema.dao.NoticeDAO;
import kr.co.jhta.cinema.dto.NoticeDTO;
import lombok.Setter;

@Service
@Setter
public class NoticeServiceImple implements NoticeService{

	@Autowired
	NoticeDAO dao;

	@Override
	public List<NoticeDTO> readAll(int startNo, int endNo) {
		
		return dao.selectAll(startNo, endNo);
	}

	@Override
	public List<NoticeDTO> noticeAll(int startNo, int endNo) {
		
		return dao.selectNoticeAll(startNo, endNo);
	}

	@Override
	public int NoticeTotal() {
		
		return dao.noticeCountAllData();
	}

	@Override
	public NoticeDTO noticeOne(int nno) {
		return dao.noticeOne(nno);
	}

	@Override
	public List<NoticeDTO> importantOne() {
		
		return dao.importantOne();
	}

	@Override
	public void write(NoticeDTO dto) {
		dao.insertOne(dto);
		
	}

	@Override
	public List<NoticeDTO> inquiryAll(int startNo, int endNo) {
		
		return dao.inquiryAll(startNo, endNo);
	}

	@Override
	public int inquiryData() {
		return dao.inquiryAllData();
	}

	@Override
	public NoticeDTO inquiryOne(int fno) {
		return dao.inquiryOne(fno);
	}

	@Override
	public List<NoticeDTO> answerAll(int fno) {
		return dao.answerAll(fno);
	}

	@Override
	public void insertAnswer(NoticeDTO dto) {
		dao.insertAnswer(dto);
		
	}

	@Override
	public void updateInquiry(NoticeDTO dto) {
		dao.updateInquiry(dto);
		
	}

	@Override
	public void deleteInquiry(int fno) {
		dao.deleteInquiry(fno);
		
	}

	@Override
	public void faqUpdateHits(int fno) {
		dao.updateHitsFAQ(fno);
		
	}

	@Override
	public void notUpdateHits(int nno) {
		dao.updateHitsNotice(nno);
		
	}

	@Override
	public int passChk(NoticeDTO dto) throws Exception {
		
		return dao.passChk(dto);
	}



}
