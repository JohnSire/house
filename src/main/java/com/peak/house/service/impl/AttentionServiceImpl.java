package com.peak.house.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.peak.house.commons.base.BaseMapper;
import com.peak.house.commons.base.impl.BaseServiceImpl;
import com.peak.house.commons.domain.DataGridResultInfo;
import com.peak.house.dao.*;
import com.peak.house.po.*;
import com.peak.house.service.AttentionService;

@Service("attentionService")
public class AttentionServiceImpl extends BaseServiceImpl<Attention> implements AttentionService{

	@Resource
	public AttentionMapper attentionMapper;

	@Override
	public BaseMapper<Attention> getMapper() {
		return attentionMapper;
	}
	public DataGridResultInfo findAttentions(Attention attention) {
		DataGridResultInfo dataGridResultInfo = new DataGridResultInfo();
		dataGridResultInfo.setPageNum(attention.getPageNum());
		//查询总记录数
		int count = attentionMapper.findAttentionCount(attention);
		dataGridResultInfo.setTotal((count+attention.getPageSize()-1)/attention.getPageSize());
		dataGridResultInfo.setList(attentionMapper.findAttentionList(attention));
		
		return dataGridResultInfo;
	}


}
