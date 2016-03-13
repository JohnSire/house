package com.peak.house.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.peak.house.commons.domain.DataGridResultInfo;
import com.peak.house.commons.util.ImageUtil;
import com.peak.house.exception.CustomException;
import com.peak.house.po.*;
import com.peak.house.service.*;

@Controller
@RequestMapping("/back/house")
public class HouseController {

	private static Logger logger = Logger.getLogger(HouseController.class);
	
	@Resource
	private HouseService houseService;
	
	@RequestMapping("/findList")
	public String findList(Model model, House house){
		
		model.addAttribute("house", house);
		model.addAttribute("dataGridResultInfo", houseService.findHouses(house));
		
		return "background/house/house_list";
	}
	
	@RequestMapping("/delete/{ids}")
	public String deleteByIds(@PathVariable String ids) throws Exception{
		
		houseService.deleteByIds(ids);
		
		return "redirect:/back/house/findList";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(Model model,String id){
		
		model.addAttribute("house", houseService.findById(Long.parseLong(id)));
		model.addAttribute("formAction", "/back/house/update");
		
		return "background/house/house_edit";
	}
	
	@RequestMapping("/update")
	public String update(Model model,@Validated House house, BindingResult result,
			MultipartFile pictureFile,HttpServletRequest request) throws Exception{
		
		if(result.hasErrors()){
			List<ObjectError> errors = result.getAllErrors();
			model.addAttribute("errors", errors);
			model.addAttribute("house", house);
			
			return "background/house/house_edit";
		}
		try {
			String path = request.getServletContext().getRealPath("/upload");
			System.out.println("------path:"+path);
			String filePath = ImageUtil.saveImage(path,pictureFile);
			//如果新上传了图片
            if(!filePath.equals("")){
            	house.setImage("/upload"+filePath);
            }
			System.out.println("--------imageNames:"+filePath);
			houseService.update(house);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/back/house/findList";
	}
	
	@RequestMapping("/addForm")
	public String addForm(Model model){
		
		model.addAttribute("formAction", "/back/house/add");
		
		return "background/house/house_edit";
	}
	
	@RequestMapping("/add")
	public String add(Model model,@Validated House house, BindingResult result,
			 MultipartFile pictureFile,HttpServletRequest request) throws Exception{
		
		if(result.hasErrors()){
			List<ObjectError> errors = result.getAllErrors();
			model.addAttribute("errors", errors);
			model.addAttribute("house", house);
			
			return "background/house/house_edit";
		}
		
		try {
			String path = request.getServletContext().getRealPath("/upload");
			System.out.println("------path:"+path);
			String filePath = ImageUtil.saveImage(path,pictureFile);
			house.setImage("/upload"+filePath);
			System.out.println("--------imageNames:"+filePath);
			houseService.add(house);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/back/house/findList";
	}
	
	@RequestMapping("/findProvince")
	public @ResponseBody DataGridResultInfo findProvince(){
		return houseService.findProvince();
	}
	
	@RequestMapping("/findCity")
	public @ResponseBody DataGridResultInfo findCity(String provinceCode){
		return houseService.findCity(provinceCode);
	}
	@RequestMapping("/findDistrict")
	public @ResponseBody DataGridResultInfo findDistrict(String cityCode){
		return houseService.findDistrict(cityCode);
	}
	
	
}
