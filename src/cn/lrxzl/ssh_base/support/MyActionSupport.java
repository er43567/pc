package cn.lrxzl.ssh_base.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.unclezhang.bean.User;
import cn.unclezhang.service.IService;


public abstract class MyActionSupport {
	protected HttpSession session = ServletActionContext.getRequest().getSession();
	protected HttpServletRequest request = ServletActionContext.getRequest();
	protected HttpServletResponse response = ServletActionContext.getResponse();
	protected String aa = "success";
	protected IService service;
	public void setService(IService service) {
		this.service = service;
		service.receiveSessionUser(getSessionUser());
	}
	
	public void login(Loginable logger) {
		session.setAttribute("user", logger);
	}
	
	public void removeLogin() {
		session.removeAttribute("user");
	}
	
	public <T extends User> T getSessionUser() {
		return (T) session.getAttribute("user");
	}
	
	public String getSessionUserId() {
		if (isLogin()) {
			return ((Loginable) getSessionUser()).getId();
		}
		return null;
	}
	
	public boolean isLogin() {
		return getSessionUser() != null;
	}
	public boolean notLogin() {
		return getSessionUser() == null;
	}
	
	public interface Loginable {
		String getId();
	}
	
	protected String result = "success";
	public void setResult(String result) {
		this.result = result;
	}
	public abstract String getResult();
	
	
	public interface ISessionUserReceivable {
		/**
		 * 给数据库语句 
		 * 用于添加筛选条件  scope 以及 rank 字段
		 * @param user
		 */
		public void receiveSessionUser(User user);
	}
	
}

