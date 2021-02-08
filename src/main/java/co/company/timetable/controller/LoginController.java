package co.company.timetable.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.company.timetable.impl.LoginMapper;
import co.company.timetable.vo.Student;

@Controller
public class LoginController {
	
	@Autowired LoginMapper loginDao;
	
	// 로그인
	@RequestMapping(value="/login")
	@ResponseBody
	public boolean Home(Student student, HttpSession session) throws IOException{
		student = loginDao.login(student);
		
		if(student == null) {
			return false;
		} else {
			session.setAttribute("student", student);
			return true;
		}
	}
	// 로그아웃
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpSession session) throws IOException{
		session.invalidate();
		return new ModelAndView("redirect:home");
	}
	
	//아이디 중복확인
	@RequestMapping(value="/idCheck")
	@ResponseBody
	public boolean idCheck(HttpServletRequest request) throws IOException{
		String result = loginDao.idCheck(request.getParameter("st_id"));
		
		if(result == null || result == "") {
			return true;
		} else {
			return false;
		}
	}
	
	
	
	// insert 
	@RequestMapping(value="/register")
	@ResponseBody
	public void register(Student student) throws IOException{

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
