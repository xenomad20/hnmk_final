package kr.co.jhta.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MovieInfoDTO {
   private int mno;
   private String mtitle;
   private String mtitleeng;
   private String releasedate;
   private String poster;
   private String mintroduction;
   private String filmgrade;
}
// movie와 movie_detail 테이블을 natural join한 값을 담아주기 위해 만든 dto