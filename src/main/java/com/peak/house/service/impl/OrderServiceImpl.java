package com.peak.house.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.peak.house.commons.base.BaseMapper;
import com.peak.house.commons.base.impl.BaseServiceImpl;
import com.peak.house.commons.domain.DataGridResultInfo;
import com.peak.house.dao.OrderMapper;
import com.peak.house.po.Order;
import com.peak.house.service.OrderService;

@Service("orderService")
public class OrderServiceImpl extends BaseServiceImpl<Order> implements OrderService{

	@Resource
	public OrderMapper orderMapper;
	
	@Override
	public BaseMapper<Order> getMapper() {
		return orderMapper;
	}

	public DataGridResultInfo findOrder(Order order) {
		
		DataGridResultInfo dataGridResultInfo = new DataGridResultInfo();
		dataGridResultInfo.setPageNum(order.getPageNum());
		//查询总记录数
		int count = orderMapper.findCount(order);
		dataGridResultInfo.setTotal((count+order.getPageSize()-1)/order.getPageSize());
		dataGridResultInfo.setList(orderMapper.findList(order));
		
		return dataGridResultInfo;
	}

}
