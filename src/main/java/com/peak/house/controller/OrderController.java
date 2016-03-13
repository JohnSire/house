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
import com.peak.house.po.Order;
import com.peak.house.service.OrderService;

@Controller
@RequestMapping("/back/order")
public class OrderController {

	private static Logger logger = Logger.getLogger(OrderController.class);
	
	@Resource
	private OrderService orderService;
	
	@RequestMapping("/findList")
	public String findList(Model model, Order order){
		
		model.addAttribute("order", order);
		model.addAttribute("dataGridResultInfo", orderService.findOrder(order));
		
		return "background/order/order_list";
	}
	
	@RequestMapping("/delete/{ids}")
	public String deleteByIds(@PathVariable String ids) throws Exception{
		
		orderService.deleteByIds(ids);
		
		return "redirect:/back/order/findList";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(Model model,String id){
		
		model.addAttribute("order", orderService.findById(Long.parseLong(id)));
		model.addAttribute("formAction", "/back/order/update");
		
		return "background/order/order_edit";
	}
	
	@RequestMapping("/update")
	public String update(Model model,@Validated Order order, BindingResult result) throws Exception{
		
		if(result.hasErrors()){
			List<ObjectError> errors = result.getAllErrors();
			model.addAttribute("errors", errors);
			model.addAttribute("order", order);
			
			return "background/order/order_edit";
		}
		orderService.update(order);
		
		return "redirect:/back/order/findList";
	}
	
	@RequestMapping("/addForm")
	public String addForm(Model model){
		
		model.addAttribute("formAction", "/back/order/add");
		
		return "background/order/order_edit";
	}
	
	@RequestMapping("/add")
	public String add(Model model,@Validated Order order, BindingResult result) throws Exception{
		
		if(result.hasErrors()){
			List<ObjectError> errors = result.getAllErrors();
			model.addAttribute("errors", errors);
			model.addAttribute("order", order);
			
			return "background/order/order_edit";
		}
		orderService.add(order);
		
		return "redirect:/back/order/findList";
	}
	
	
}
