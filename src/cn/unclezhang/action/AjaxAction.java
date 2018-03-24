package cn.unclezhang.action;

import net.sf.json.JSONObject;

import org.apache.struts2.json.annotations.JSON;
import org.omg.PortableInterceptor.SUCCESSFUL;

import cn.lrxzl.ssh_base.support.MyActionSupport;
import cn.unclezhang.bean.User;

public class AjaxAction extends MyActionSupport {
	User user;
	@JSON(serialize=false)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	String url;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String login() {
		System.out.println(user.getUserId() + "," + user.getPsw());
		if ("123".equals(user.getUserId()) && "123".equals(user.getPsw())) {
			login(user);
			url = "main.jsp";
			return "success";
		}
		setResult("登录失败！");
		return "success";
	}
	
	String field, value;
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	/*===========首页===========*/
	public String loadIndexDatas() {
		JSONObject jo = new JSONObject();
		jo.put("reportCount", "88");
		jo.put("pushCount", "77");
		setResult(jo.toString());
		return aa;
	}
	
	/*===========用户设置页面===========*/
	public String updateField() {
		//[^a-zA-Z0-9\_]
		service.updateUserFiled(getUserId(), field, value);
		return aa;
	}
	
	public String getResult() {
		return result;
	}
}
