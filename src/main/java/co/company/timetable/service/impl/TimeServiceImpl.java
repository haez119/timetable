package co.company.timetable.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.timetable.impl.TimeMapper;
import co.company.timetable.service.TimeService;
import co.company.timetable.vo.TimeTable;

@Service
public class TimeServiceImpl implements TimeService {

	@Autowired TimeMapper dao;

	@Override
	public void timeInsert(TimeTable timeTable) {
		dao.insertSubject(timeTable);
		dao.insertTimeTable(timeTable);
	}
	
	

}
