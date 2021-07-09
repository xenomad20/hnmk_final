package kr.co.jhta.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class TheaterDTO {
private	int cno;
private	String location;
private String cimg;
private String caddress;
private	String cdescript;
}
