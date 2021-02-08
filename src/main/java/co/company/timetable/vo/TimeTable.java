package co.company.timetable.vo;

import lombok.Data;

@Data
public class TimeTable {
	private String tt_no;
	private String st_id;
	private String sb_id;
	private String week;
	private String tt_time; //시작시간
	
}
