package kr.co.jhta.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MovieDetailInfoDTO {
	private int mno;
	private String mtitle;
	private String mtitleEng;
	private String genre;
	private String poster;
	private String mregdate;
	private String showtimes;
	private String showflag;
	private String filmgrade;
	private String releasedate;
	private String director;
	private String cast;
	private String mintroduction;
	private int mratings;
}
