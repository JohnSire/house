package com.peak.house.service;


import com.peak.house.commons.base.BaseService;
import com.peak.house.commons.domain.DataGridResultInfo;
import com.peak.house.po.*;

public interface AttentionService extends BaseService<Attention>{

	public DataGridResultInfo findAttentions(Attention attention);
	
	
}
