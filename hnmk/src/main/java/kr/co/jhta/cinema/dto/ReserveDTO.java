package kr.co.jhta.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ReserveDTO {
private String ticketno;
private int total;
private String rno;
private int customerno;
private int ssno;
private String seatno;
}
