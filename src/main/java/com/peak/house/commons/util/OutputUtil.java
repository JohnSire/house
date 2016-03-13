package com.peak.house.commons.util;

import javax.servlet.http.HttpServletResponse;

public class OutputUtil {
	
	public void returnJsonToWebAjax(HttpServletResponse response ,String jsonString) {
		try {
			// 设置返回编码格式
			response.setCharacterEncoding("utf-8");
			// 返回Json数据
			response.getWriter().write(jsonString);
			response.getWriter().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
