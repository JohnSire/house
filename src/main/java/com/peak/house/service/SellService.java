package com.peak.house.service;


import com.peak.house.commons.base.BaseService;
import com.peak.house.commons.domain.DataGridResultInfo;
import com.peak.house.po.Sell;

public interface SellService extends BaseService<Sell>{

	public DataGridResultInfo findSell(Sell sell);
	
}
