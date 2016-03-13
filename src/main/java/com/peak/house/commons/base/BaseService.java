package com.peak.house.commons.base;

import java.io.Serializable;

import com.peak.house.exception.CustomException;


public interface BaseService<T> {
	
	public T findById(Serializable id);
	
	public void add(T t) throws Exception;

	public void update(T t) throws CustomException, Exception ;
	
	public void deleteByIds(String ids) throws Exception;
}
