package com.peak.house.dao;

import java.util.List;

import com.peak.house.po.BaseDistrict;

public interface BaseDistrictMapper {
	
	public List<BaseDistrict> findList(String cityCode);
}
