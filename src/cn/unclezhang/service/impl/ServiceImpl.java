package cn.unclezhang.service.impl;

import java.util.List;

import cn.unclezhang.bean.User;
import cn.unclezhang.dao.IDao;
import cn.unclezhang.service.IService;

public class ServiceImpl implements IService {
	private IDao dao;
	public void setDao(IDao dao) {
		this.dao = dao;
	}
	
	@Override
	public void updateUserFiled(String userId, String field, String value) {
		try {
			dao.updateBySql("update user_tb set " + field + "=? where userId=?"
					, new Object[]{ value, userId});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<User> loadAllUsers() {
		try {
			return dao.findByHql("from User");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
