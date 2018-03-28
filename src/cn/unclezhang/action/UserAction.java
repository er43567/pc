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
	
	//手机端没有用到，调试时候浏览器使用
	public String login() {
		if (isLogin()) {
			return "main";
		}
		System.out.println(user);
		User tmp = service.findUserById(user.getUserId());
		if (tmp == null) {
			setResult("账号错误");
			return "login";
		} else if (!tmp.getPsw().equals(user.getPsw())) {
			setResult("密码错误");
			return "login";
		}
		
		login(tmp);
		setResult("登录失败！");
		return "main";
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
