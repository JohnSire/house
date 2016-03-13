package com.peak.house.dao;

import java.util.List;

import com.peak.house.commons.base.BaseMapper;
import com.peak.house.po.Attention;
import com.peak.house.po.House;


public interface AttentionMapper extends BaseMapper<Attention>{
	
	public List<House> findAttentionList(Attention attention);
	
	public int findAttentionCount(Attention attention);

	
}