package com.peak.house.service;


import com.peak.house.commons.base.BaseService;
import com.peak.house.commons.domain.DataGridResultInfo;
import com.peak.house.po.*;

public interface AgentService extends BaseService<Agent>{

	public DataGridResultInfo findAgents(Agent agent);
	
	
}
