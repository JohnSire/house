package com.peak.house.commons.base.impl;

import java.io.Serializable;

import com.peak.house.commons.base.BaseMapper;
import com.peak.house.commons.base.BaseService;
import com.peak.house.exception.CustomException;

public abstract class BaseServiceImpl<T> implements BaseService<T> {
	
	public abstract BaseMapper<T> getMapper() ;

	public T findById(Serializable id) {
		return getMapper().findById(id);
	}

	public void add(T t) throws Exception {
		getMapper().insert(t);		
	}

	public void update(T t) throws Exception{
		getMapper().update(t);		
	}
	
	public void deleteByIds(String ids) throws Exception{
		getMapper().deldetByIds(ids);
	}

}
