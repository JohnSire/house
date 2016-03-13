package com.peak.house.dao;

import com.peak.house.commons.base.BaseMapper;
import com.peak.house.po.Users;


public interface UsersMapper extends BaseMapper<Users>{
	
	public Users findByPhone(Users user);
    
}