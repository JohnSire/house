package com.peak.house.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.peak.house.commons.base.BaseMapper;
import com.peak.house.commons.base.impl.BaseServiceImpl;
import com.peak.house.commons.domain.DataGridResultInfo;
import com.peak.house.dao.*;
import com.peak.house.po.*;
import com.peak.house.service.HouseService;

@Service("houseService")
public class HouseServiceImpl extends BaseServiceImpl<House> implements HouseService{

	@Resource
	public HouseMapper houseMapper;
	
	@Resource
	public BaseProvinceMapper baseProvinceMapper;
	@Resource
	public BaseCityMapper baseCityMapper;
	@Resource
	public BaseDistrictMapper baseDistrictMapper;
	
	
	@Override
	public BaseMapper<House> getMapper() {
		return houseMapper;
	}

	public DataGridResultInfo findHouses(House house) {
		DataGridResultInfo dataGridResultInfo = new DataGridResultInfo();
		dataGridResultInfo.setPageNum(house.getPageNum());
		//查询总记录数
		int count = houseMapper.findCount(house);
		dataGridResultInfo.setTotal((count+house.getPageSize()-1)/house.getPageSize());
		dataGridResultInfo.setList(houseMapper.findList(house));
		
		return dataGridResultInfo;
	}

	public DataGridResultInfo findSells(House house) {
		DataGridResultInfo dataGridResultInfo = new DataGridResultInfo();
		dataGridResultInfo.setPageNum(house.getPageNum());
		//查询总记录数
		int count = houseMapper.findSellCount(house);
		dataGridResultInfo.setTotal((count+house.getPageSize()-1)/house.getPageSize());
		dataGridResultInfo.setList(houseMapper.findSellList(house));
		
		return dataGridResultInfo;
	}

	public DataGridResultInfo findProvince() {
		DataGridResultInfo dataGridResultInfo = new DataGridResultInfo();
		dataGridResultInfo.setList(baseProvinceMapper.findList());
		return dataGridResultInfo;
	}

	public DataGridResultInfo findCity(String provinceCode) {
		DataGridResultInfo dataGridResultInfo = new DataGridResultInfo();
		dataGridResultInfo.setList(baseCityMapper.findList(provinceCode));
		return dataGridResultInfo;
	}

	public DataGridResultInfo findDistrict(String cityCode) {
		DataGridResultInfo dataGridResultInfo = new DataGridResultInfo();
		dataGridResultInfo.setList(baseDistrictMapper.findList(cityCode));
		return dataGridResultInfo;
	}

}
