package com.hereo.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.service.MembersService;
import com.hereo.project.vo.MembersVO;


@Controller
public class HomeController {
	@Autowired
	MembersService membersService;
	
	@GetMapping(value = "/")
	public String home() {
		return "/home";
	}
	//회원가입 기능
	@GetMapping(value = "/signup")
	public String signupGet() {
		return "/login_etc/signup";
	}
	
	@PostMapping(value = "/signup")
	public ModelAndView signupPost(ModelAndView mv, MembersVO user) {
		boolean isSignup = membersService.insertUser(user);
		if(isSignup) {
		mv.setViewName("redirect:/");
		} else {
			mv.setViewName("redirect:/signup");
		}
		return mv;
	}
	//로그인 기능
	@GetMapping(value = "/login")
	public String login(HttpServletRequest request) {
		
		return "login_etc/login";
	}
	@PostMapping(value = "/login")
	public String loginPost(Model model, MembersVO user) {
		MembersVO loginUser = membersService.login(user);
		model.addAttribute("loginUser",loginUser);
		if(loginUser==null) {
			return "redirect:/login";
		} else {
			return "redirect:/login";
		}		
	}
	//로그아웃 기능
	@GetMapping(value = "/logout")
	public String logout(HttpServletResponse response, HttpSession session) {
		//추후 자동로그인 기능을 위해 user남겨둠
		MembersVO user = (MembersVO)session.getAttribute("loginUser");
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
}
	
