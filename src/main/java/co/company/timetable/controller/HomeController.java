package co.company.timetable.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {
	
	@RequestMapping(value="/")
	public ModelAndView Main(HttpServletResponse response) throws IOException{
		return new ModelAndView("redirect:home");
	}
	
	@RequestMapping(value="/home")
	public ModelAndView Home(HttpServletRequest request) throws IOException{

		return new ModelAndView("home");
	}
}
