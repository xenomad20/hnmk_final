package kr.co.jhta.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CustomerDTO {
	private int customerno;
	private String id;
	private String pwd;
	private int point;
	private String name;
	private String birth;
	private String hp;
	private String email;
	private String addres;
	private String addresdetail;
	private String customerregdate;	
}
