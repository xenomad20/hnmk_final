package kr.co.jhta.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class NoticeDTO {
	// FAQ
	private int fno;
	private String ftype;
	private String ftitle;
	private String fcontents;
	private String fregdate;
	private String fpwd;
	private int fhits;

	// 공지사항
	private int nno;
	private String ntitle;
	private String ncontents;
	private String nregdate;
	private int nhits;
	private int customerno;
	
	//회원
	private String id;
	
	//1:1문의 댓글
	private int ano;
	private String acontents;
	private String aregdate;

}
