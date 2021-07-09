package kr.co.jhta.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MovieDTO {
private int mno;
private String mtitle;
private String mtitleEng;
private String genre;
private String poster;
private String mregdate;
}
