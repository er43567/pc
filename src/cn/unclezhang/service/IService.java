package cn.unclezhang.service;

import java.util.List;

import cn.unclezhang.bean.User;

public interface IService {
	void updateUserFiled(String userId, String field, String value);

	List<User> loadAllUsers();
}
