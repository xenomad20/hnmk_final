package kr.co.jhta.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ScreenDTO {
private String sname;
private int emptyseat;
private int totalseat;
private int cno;
}
