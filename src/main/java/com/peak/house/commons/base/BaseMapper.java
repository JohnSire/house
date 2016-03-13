package com.peak.house.commons.base;

import java.io.Serializable;
import java.util.List;

import com.peak.house.exception.CustomException;

public interface BaseMapper<T> {

	public T findById(Serializable id);
	
	public List<T> findList(T t);
	
	public int findCount(T t);
	
	public void insert(T t) throws Exception;
	
	public void deldetByIds(String ids) throws Exception ;
	
	public void update(T t) throws Exception ;
}
