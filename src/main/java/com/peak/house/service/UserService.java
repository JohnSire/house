package com.peak.house.service;


import com.peak.house.commons.base.BaseService;
import com.peak.house.commons.domain.DataGridResultInfo;
import com.peak.house.po.Users;

public interface UserService extends BaseService<Users>{

	public DataGridResultInfo findUsers(Users user);
	
	public Users login(Users user);
	
}
