package cn.unclezhang.action;

import java.util.List;

import cn.lrxzl.ssh_base.support.MyActionSupport;
import cn.unclezhang.bean.User;

public class PageAction extends MyActionSupport {
	User user;
	List<User> users;
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	/*===========用户选择列表 页面===========*/
	public String loadUserChoosePage() {
		users = service.loadAllUsers();
		return "choose";
	}
	
	@Override
	public String getResult() {
		return result;
	}
}
