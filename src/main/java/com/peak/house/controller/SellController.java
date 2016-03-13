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
import com.peak.house.po.Sell;
import com.peak.house.service.SellService;

@Controller
@RequestMapping("/back/sell")
public class SellController {

	private static Logger logger = Logger.getLogger(SellController.class);
	
	@Resource
	private SellService sellService;
	
	@RequestMapping("/findList")
	public String findList(Model model, Sell sell){
		
		model.addAttribute("sell", sell);
		model.addAttribute("dataGridResultInfo", sellService.findSell(sell));
		
		return "background/sell/sell_list";
	}
	
	@RequestMapping("/delete/{ids}")
	public String deleteByIds(@PathVariable String ids) throws Exception{
		
		sellService.deleteByIds(ids);
		
		return "redirect:/back/sell/findList";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(Model model,String id){
		
		model.addAttribute("sell", sellService.findById(Long.parseLong(id)));
		model.addAttribute("formAction", "/back/sell/update");
		
		return "background/sell/sell_edit";
	}
	
	@RequestMapping("/update")
	public String update(Model model,@Validated Sell sell, BindingResult result) throws Exception{
		
		if(result.hasErrors()){
			List<ObjectError> errors = result.getAllErrors();
			model.addAttribute("errors", errors);
			model.addAttribute("sell", sell);
			
			return "background/sell/sell_edit";
		}
		sellService.update(sell);
		
		return "redirect:/back/sell/findList";
	}
	
	@RequestMapping("/addForm")
	public String addForm(Model model){
		
		model.addAttribute("formAction", "/back/sell/add");
		
		return "background/sell/sell_edit";
	}
	
	@RequestMapping("/add")
	public String add(Model model,@Validated Sell sell, BindingResult result) throws Exception{
		
		if(result.hasErrors()){
			List<ObjectError> errors = result.getAllErrors();
			model.addAttribute("errors", errors);
			model.addAttribute("sell", sell);
			
			return "background/sell/sell_edit";
		}
		sellService.add(sell);
		
		return "redirect:/back/sell/findList";
	}
	
	
}
