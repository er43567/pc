package cn.unclezhang.action;

import net.sf.json.JSONObject;

import org.apache.struts2.json.annotations.JSON;

import cn.lrxzl.lib.java.tool.Tool;
import cn.lrxzl.ssh_base.support.MyActionSupport;
import cn.unclezhang.bean.Notice;
import cn.unclezhang.bean.Report;
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
	/*===========表单提交页面===========*/
	String items;
	Report report;
	public String getItems() {
		return items;
	}
	public void setItems(String items) {
		this.items = items;
	}
	public Report getReport() {
		return report;
	}
	public void setReport(Report report) {
		this.report = report;
	}
	public String saveReport() {
		if (notLogin()) {
			setResult("未登录");
			return aa;
		}
		if (report.getChoices()==null) {
			System.out.println("choices = null");
			return aa;
		}
		int sid = service.saveReport(getUserId(), Tool.unescape(report.getType()+"")
				, Tool.unescape(report.getTargets()+""), Tool.unescape(items+"").split(",")
				, report.getChoices(), Tool.unescape(report.getRem()+""));
		setResult(sid+"");
		return aa;
	}
	
	public String updateReport() {
		service.updateReport(report.getSid()
				, getUserId()
				, Tool.unescape(report.getTargets()+"")
				, Tool.unescape(items+"").split(",")
				, report.getChoices()
				, Tool.unescape(report.getRem()+""));
		return aa;
	}
	
	
	Notice notice;
	public Notice getNotice() {
		return notice;
	}
	public void setNotice(Notice notice) {
		this.notice = notice;
	}
	public String noticeOthers() {
		if (notLogin()) {
			setResult("未登录");
			return aa;
		}
		System.out.println(Tool.unescape(notice.getTargetIds()));
		service.savePush(getUserId()
				, Tool.unescape(notice.getType()), Tool.unescape(notice.getTargetIds())
				, Tool.unescape(notice.getTitle()), Tool.unescape(notice.getContent())
				, notice.getImpts());
		
		return aa;
	}
	
	public String getResult() {
		return result;
	}
}
