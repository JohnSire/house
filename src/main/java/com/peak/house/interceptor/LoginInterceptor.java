package com.peak.house.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.peak.house.po.Users;

public class LoginInterceptor implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object arg2, Exception arg3)
					throws Exception {

	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2, ModelAndView arg3) throws Exception {

	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		System.out.println("进入拦截器-------");
		//获取请求url
		String url = request.getRequestURI();
		if(url.indexOf("login")>=0){//放行登录界面
			System.out.println("进入拦截器-------放行登录");
			return true;
		}
		if(! url.contains("back")){//非后台，放行
			System.out.println("进入拦截器-------放行前台");
			return true;
		}
		
		//判断session
		HttpSession session  = request.getSession();
		Users admin = (Users) session.getAttribute("admin");
		
		if(admin!=null){//已登录   放行
			System.out.println("进入拦截器-------放行已登录");
			return true;
		}
		System.out.println("进入拦截器-------拦截并转发到登录");
		
//		response.sendRedirect(request.getContextPath()+ "/back/admin/login");
		request.getRequestDispatcher("/WEB-INF/background/login.jsp").forward(request, response);

		return false;
	}

}
