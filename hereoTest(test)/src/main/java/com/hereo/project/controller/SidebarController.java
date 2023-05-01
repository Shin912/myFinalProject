package com.hereo.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SidebarController {
	
	
	@RequestMapping(value = "/sidebar/sbteam", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		mv.setViewName("/sidebar/sb-team_main");
		return mv;
	}
	@RequestMapping(value = "/sidebar/sbleague", method = RequestMethod.GET)
	public ModelAndView league(ModelAndView mv) {
		mv.setViewName("/sidebar/sb-league-main");
		return mv;
	}
}
