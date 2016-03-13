package com.peak.house.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.peak.house.commons.base.BaseMapper;
import com.peak.house.commons.base.impl.BaseServiceImpl;
import com.peak.house.commons.domain.DataGridResultInfo;
import com.peak.house.dao.UsersMapper;
import com.peak.house.po.Users;
import com.peak.house.service.UserService;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<Users> implements UserService{

	@Resource
	public UsersMapper userMapper;
	
	@Override
	public BaseMapper<Users> getMapper() {
		return userMapper;
	}

	public DataGridResultInfo findUsers(Users user) {
		
		DataGridResultInfo dataGridResultInfo = new DataGridResultInfo();
		dataGridResultInfo.setPageNum(user.getPageNum());
		//查询总记录数
		int count = userMapper.findCount(user);
		dataGridResultInfo.setTotal((count+user.getPageSize()-1)/user.getPageSize());
		dataGridResultInfo.setList(userMapper.findList(user));
		
		return dataGridResultInfo;
	}

	public Users login(Users user) {
		return userMapper.findByPhone(user);
	}

}
