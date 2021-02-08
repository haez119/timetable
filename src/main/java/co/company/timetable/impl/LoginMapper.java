package co.company.timetable.impl;

import co.company.timetable.vo.Student;

public interface LoginMapper {
	
	public Student login(Student student);
	public String idCheck(String st_id);
	public void studentInsert(Student student);
	
}
