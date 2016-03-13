package com.peak.house.controller;


import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.peak.house.po.*;
import com.peak.house.service.*;

@Controller
@RequestMapping("/house")
public class HouseControllerFore {

	private static Logger logger = Logger.getLogger(HouseControllerFore.class);
	
	@Resource
	private HouseService houseService;
	@Resource
	private SellService sellService;
	
	@RequestMapping("/findList")
	public String findList(Model model, House house){
		if(house!=null && house.getXprice()!=null){
			house.setPricex(house.getXprice() + 50);
		}
		model.addAttribute("house", house);
		model.addAttribute("dataGridResultInfo", houseService.findSells(house));
		
		return "foreground/home";
	}
	
	@RequestMapping("/detail/{sid}")
	public String houseDetail(Model model,@PathVariable("sid") Long sid ,House house){
		
		System.out.println("----------"+sid);
		house.setSid(sid);
		List<House> list = houseService.findSells(house).getList();
		if(list!=null && list.size()>0){
			model.addAttribute("house", list.get(0));
		}
		
		return "foreground/homedetail";
	}
	
	
}
