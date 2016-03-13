package com.peak.house.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.peak.house.commons.base.BaseMapper;
import com.peak.house.commons.base.impl.BaseServiceImpl;
import com.peak.house.commons.domain.DataGridResultInfo;
import com.peak.house.dao.SellMapper;
import com.peak.house.po.Sell;
import com.peak.house.service.SellService;

@Service("sellService")
public class SellServiceImpl extends BaseServiceImpl<Sell> implements SellService{

	@Resource
	public SellMapper sellMapper;
	
	@Override
	public BaseMapper<Sell> getMapper() {
		return sellMapper;
	}

	public DataGridResultInfo findSell(Sell sell) {
		
		DataGridResultInfo dataGridResultInfo = new DataGridResultInfo();
		dataGridResultInfo.setPageNum(sell.getPageNum());
		//查询总记录数
		int count = sellMapper.findCount(sell);
		dataGridResultInfo.setTotal((count+sell.getPageSize()-1)/sell.getPageSize());
		dataGridResultInfo.setList(sellMapper.findList(sell));
		
		return dataGridResultInfo;
	}

}
