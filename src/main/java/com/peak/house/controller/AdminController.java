package com.peak.house.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.peak.house.po.Users;
import com.peak.house.service.UserService;


@Controller
@RequestMapping("/back")
public class AdminController {

	@Resource
	private UserService userService;

	@RequestMapping("")
	public String index(){
		return "background/index";
	}

	@RequestMapping("admin/login")
	public String login(Model model,Users user,HttpSession session){
		Users admin = userService.login(user);
		if(admin != null){
			session.setAttribute("admin", admin);
			return "background/index";
		}
		return "background/login";
	}

	@RequestMapping("admin/logout")
	public String logout(Model model,HttpSession session){
		// 清除session
		session.invalidate();

		return "background/login";
	}

	@RequestMapping("admin/modify")
	public String modify(Model model){
		return "background/modify";
	}
}
