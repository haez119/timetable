package co.company.timetable.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.company.timetable.service.TimeService;
import co.company.timetable.vo.TimeTable;

@Controller
public class TimetableController {
	
	@Autowired TimeService service;
	
	// 시간표 등록 (insert 2번 해야 함)
	@RequestMapping(value="/timeTable/insert")
	@ResponseBody
	public void insert(HttpServletRequest request, TimeTable timeTable) throws IOException{
		service.timeInsert(timeTable);
	}
	
}
