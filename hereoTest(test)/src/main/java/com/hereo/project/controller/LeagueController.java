package com.hereo.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.service.MembersService;
import com.hereo.project.vo.MembersVO;


@Controller
public class LeagueController {
	@Autowired
	MembersService membersService;
	
	@RequestMapping(value = "/league/main", method = RequestMethod.GET)
	public ModelAndView leagueMain(ModelAndView mv) {
		mv.setViewName("/league/league-main");
		return mv;
	}
	
	
	
	
}
	
