package com.peak.house.service;


import com.peak.house.commons.base.BaseService;
import com.peak.house.commons.domain.DataGridResultInfo;
import com.peak.house.po.Order;

public interface OrderService extends BaseService<Order>{

	public DataGridResultInfo findOrder(Order order);
	
}
