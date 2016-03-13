package com.peak.house.dao;

import java.util.List;

import com.peak.house.commons.base.BaseMapper;
import com.peak.house.po.*;


public interface HouseMapper extends BaseMapper<House>{
	
	public List<House> findSellList(House house);
	
	public int findSellCount(House house);
}