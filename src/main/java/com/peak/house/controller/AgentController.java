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
import com.peak.house.po.*;
import com.peak.house.service.*;

@Controller
@RequestMapping("/back/agent")
public class AgentController {

	private static Logger logger = Logger.getLogger(AgentController.class);
	
	@Resource
	private AgentService agentService;
	
	@RequestMapping("/findList")
	public String findList(Model model, Agent agent){
		
		model.addAttribute("agent", agent);
		model.addAttribute("dataGridResultInfo", agentService.findAgents(agent));
		
		return "background/agent/agent_list";
	}
	
	@RequestMapping("/delete/{ids}")
	public String deleteByIds(@PathVariable String ids) throws Exception{
		
		agentService.deleteByIds(ids);
		
		return "redirect:/back/agent/findList";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(Model model,String id){
		
		model.addAttribute("agent", agentService.findById(Long.parseLong(id)));
		model.addAttribute("formAction", "/back/agent/update");
		
		return "background/agent/agent_edit";
	}
	
	@RequestMapping("/update")
	public String update(Model model,@Validated Agent agent, BindingResult result) throws Exception{
		
		if(result.hasErrors()){
			List<ObjectError> errors = result.getAllErrors();
			model.addAttribute("errors", errors);
			model.addAttribute("agent", agent);
			
			return "background/agent/agent_edit";
		}
		agentService.update(agent);
		
		return "redirect:/back/agent/findList";
	}
	
	@RequestMapping("/addForm")
	public String addForm(Model model){
		
		model.addAttribute("formAction", "/back/agent/add");
		
		return "background/agent/agent_edit";
	}
	
	@RequestMapping("/add")
	public String add(Model model,@Validated Agent agent, BindingResult result) throws Exception{
		
		if(result.hasErrors()){
			List<ObjectError> errors = result.getAllErrors();
			model.addAttribute("errors", errors);
			model.addAttribute("agent", agent);
			
			return "background/agent/agent_edit";
		}
		agentService.add(agent);
		
		return "redirect:/back/agent/findList";
	}
	
	
}
