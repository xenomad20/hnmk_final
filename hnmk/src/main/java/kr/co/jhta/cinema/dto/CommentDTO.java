package kr.co.jhta.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CommentDTO {
	
	int mcno;
	String id;
	int mcgrade;
	String mccontents;
	String mcregdate;
	int customerno;
	int mno;
	String mtitle;
}
