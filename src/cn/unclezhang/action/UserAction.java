package cn.unclezhang.action;

import org.apache.struts2.json.annotations.JSON;

import cn.lrxzl.ssh_base.support.MyActionSupport;
import cn.unclezhang.bean.User;

public class UserAction extends MyActionSupport {
	User user;
	@JSON(serialize=false)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public String loadIndexPage() {
		System.out.println("isLogin:" + isLogin());
		if (isLogin()) {
			return "main";
		}
		return "login";
	}
	
	public String login() {
		if ("123".equals(user.getUserId()) && "456".equals(user.getUserId())) {
			login(user);
			return "explosiveIndex";
		}
		setResult("登录失败！");
		return "login";
	}
	
	public String logoff() {
		removeLogin();
		return "login";
	}
	
	@Override
	public String getResult() {
		return result;
	}
}
