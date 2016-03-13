package com.peak.house.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.peak.house.exception.CustomException;
import com.peak.house.po.Users;
import com.peak.house.service.UserService;

@Controller
@RequestMapping("/back/user")
public class UserController {

	private static Logger logger = Logger.getLogger(UserController.class);
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/findList")
	public String findList(Model model, Users user){
		user.setType(0);
		model.addAttribute("user", user);
		model.addAttribute("dataGridResultInfo", userService.findUsers(user));
		
		return "background/user/user_list";
	}
	
	@RequestMapping("/delete/{ids}")
	public String deleteByIds(@PathVariable String ids) throws Exception{
		
		userService.deleteByIds(ids);
		
		return "redirect:/back/user/findList";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(Model model,String id){
		
		model.addAttribute("user", userService.findById(Long.parseLong(id)));
		model.addAttribute("formAction", "/back/user/update");
		
		return "background/user/user_edit";
	}
	
	@RequestMapping("/update")
	public String update(Model model,@Validated Users user, BindingResult result) throws Exception{
		user.setType(0);
		if(result.hasErrors()){
			List<ObjectError> errors = result.getAllErrors();
			model.addAttribute("errors", errors);
			model.addAttribute("user", user);
			
			return "background/user/user_edit";
		}
		userService.update(user);
		
		return "redirect:/back/user/findList";
	}
	
	@RequestMapping("/addForm")
	public String addForm(Model model){
		
		model.addAttribute("formAction", "/back/user/add");
		
		return "background/user/user_edit";
	}
	
	@RequestMapping("/add")
	public String add(Model model,@Validated Users user, BindingResult result) throws Exception{
		user.setType(0);
		if(result.hasErrors()){
			List<ObjectError> errors = result.getAllErrors();
			model.addAttribute("errors", errors);
			model.addAttribute("user", user);
			
			return "background/user/user_edit";
		}
		userService.add(user);
		
		return "redirect:/back/user/findList";
	}
	
	
}
