package com.peak.house.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.peak.house.commons.base.BaseMapper;
import com.peak.house.commons.base.impl.BaseServiceImpl;
import com.peak.house.commons.domain.DataGridResultInfo;
import com.peak.house.dao.*;
import com.peak.house.po.*;
import com.peak.house.service.AgentService;

@Service("agentService")
public class AgentServiceImpl extends BaseServiceImpl<Agent> implements AgentService{

	@Resource
	public AgentMapper agentMapper;
	
	@Override
	public BaseMapper<Agent> getMapper() {
		return agentMapper;
	}

	public DataGridResultInfo findAgents(Agent agent) {
		DataGridResultInfo dataGridResultInfo = new DataGridResultInfo();
		dataGridResultInfo.setPageNum(agent.getPageNum());
		//查询总记录数
		int count = agentMapper.findCount(agent);
		dataGridResultInfo.setTotal((count+agent.getPageSize()-1)/agent.getPageSize());
		dataGridResultInfo.setList(agentMapper.findList(agent));
		
		return dataGridResultInfo;
	}

}
