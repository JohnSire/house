package com.peak.house.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peak.house.commons.domain.ResultInfo;
import com.peak.house.po.Attention;
import com.peak.house.po.Users;
import com.peak.house.service.AttentionService;
import com.peak.house.service.UserService;

@Controller
@RequestMapping("/user")
public class UserControllerFore {

	private static Logger logger = Logger.getLogger(UserControllerFore.class);
	
	@Resource
	private UserService userService;
	
	@Resource
	private AttentionService attentionService;
	
	@RequestMapping("/login")
	public String login(Users user,HttpSession session){
		Users user_ = userService.login(user);
		if(user_ != null){
			session.setAttribute("user", user_);
			return "redirect:/house/findList";
		}
		session.setAttribute("user", user);
		return "foreground/login";
	}
	
	@RequestMapping("/logout")
	public String logout(Model model,HttpSession session){
		// 清除session
		session.invalidate();

		return "foreground/login";
	}
	
	@RequestMapping("/registForm")
	public String registForm(){
		return "foreground/regist";
	}
	
	@RequestMapping("/regist")
	public String regist(Users user) throws Exception{
		user.setGender("male");
		user.setAddress("北京");
		userService.add(user);
		return "redirect:/user/login";
	}
	
	@RequestMapping("/findAttentions")
	public String findAttentions(Model model,Attention attention){
		model.addAttribute("dataGridResultInfo", attentionService.findAttentions(attention));
		return "foreground/attention";
	}
	
	@RequestMapping("/addAttention")
	public @ResponseBody ResultInfo addAttention(Attention attention){
		ResultInfo resultInfo  = new ResultInfo(1,1,"关注成功");
		try {
			attentionService.add(attention);
		} catch (Exception e) {
			resultInfo.setType(0);
			resultInfo.setMessageCode(0);
			resultInfo.setMessage("关注失败");
		}
		return resultInfo;
	}
	
	@RequestMapping("/cancleAttention")
	public String cancleAttention(Long id,HttpSession session){
		System.out.println("---"+id);
		Users user = (Users) session.getAttribute("user");
		try {
			attentionService.deleteByIds("("+id+")");
		} catch (Exception e) {
			return "redirect:/user/findAttentions?uid="+user.getId();
		}
		return "redirect:/user/findAttentions?uid="+user.getId();
	}
	
	
	
	
}
