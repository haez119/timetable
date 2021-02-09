package co.company.timetable.vo;

import lombok.Data;

@Data
public class TimeTable {
	private String tt_no;
	private String st_id;
	private String sb_id;
	private String week;
	private String tt_time; //시작시간
	private String color; // 글자색
	private String back_color; // 배경색
	
	// subject (같은 vo 사용해야 될 듯)
	private String sb_name;
	private String sb_time; // 강의시간
	
}
