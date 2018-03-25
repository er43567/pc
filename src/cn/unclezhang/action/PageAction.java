package cn.unclezhang.action;

import java.util.List;

import cn.lrxzl.lib.java.tool.Tool;
import cn.lrxzl.ssh_base.support.MyActionSupport;
import cn.unclezhang.bean.Report;
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
	
	/*===========表单 页面===========*/
	String type;
	Report report;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Report getReport() {
		return report;
	}
	public void setReport(Report report) {
		this.report = report;
	}
	public String loadReportPage() {
		System.out.println(type);
		report = service.findTypeReportByDate(type, Tool.time().substring(0, 10));
		System.out.println(report);
		return "explosiveReport";
	}
	
	/*===========历史页面===========*/
	List<Report> reports;
	public List<Report> getReports() {
		return reports;
	}
	public void setReports(List<Report> reports) {
		this.reports = reports;
	}
	public String loadReportsByDate() {
		reports = service.loadReportsByDate(report.getTime());
		return "historyReports";
	}
	
	@Override
	public String getResult() {
		return result;
	}
}
