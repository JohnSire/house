package com.peak.house.dao;

import java.util.List;

import com.peak.house.po.BaseCity;

public interface BaseCityMapper {

	public List<BaseCity> findList(String provinceCode);
}
