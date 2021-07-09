package kr.co.jhta.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MovieDetailDTO {
	private int mno;
	private String showtimes;
	private String showflag;
	private String filmgrade;
	private String releasedate;
	private String director;
	private String cast;
	private String mintroduction;
	private int mratings;
	
}
