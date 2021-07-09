package kr.co.jhta.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ScheduleDTO {
private int ssno;
private String ssdate;
private String starttime;
private String endtime;
private int mno;
private String sname;

}
