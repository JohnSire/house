package com.peak.house.service;

import com.peak.house.commons.base.BaseService;
import com.peak.house.commons.domain.DataGridResultInfo;
import com.peak.house.po.*;

public interface HouseService extends BaseService<House>{

	public DataGridResultInfo findHouses(House house);
	
	public DataGridResultInfo findSells(House house);
	
	
	public DataGridResultInfo findProvince();
	
	public DataGridResultInfo findCity(String provinceCode);
	
	public DataGridResultInfo findDistrict(String cityCode);
	
	
}
