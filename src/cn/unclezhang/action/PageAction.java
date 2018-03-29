package cn.unclezhang.action;

import java.util.List;

import cn.lrxzl.lib.java.tool.Tool;
import cn.lrxzl.ssh_base.support.MyActionSupport;
import cn.unclezhang.bean.Notice;
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
	Report report;
	public Report getReport() {
		return report;
	}
	public void setReport(Report report) {
		this.report = report;
	}
	public String loadReportPage() {
		report = service.findReportById(report.getSid());
		//标记已读
		service.readNotice(report.getSid(), getSessionUserId(), report.getType());
		return report.getType() + "History";
	}
	public String loadReportEditPage() {
		report = service.findReportById(report.getSid());
		return report.getType() + "Edit";
	}
	public String loadReportReceivePage() {
		report = service.findReportById(report.getSid());
		//标记已读
		service.readNotice(report.getSid(), getSessionUserId(), report.getType());
		return report.getType() + "Receive";
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
		if (report.getTime() == null) {
			report.setTime(Tool.time());
		}
		System.out.println(report.getType());
		reports = service.loadReportsByDate(report.getType(), report.getTime());
		if (reports == null || reports.size() == 0) {
			return "emptyReport";
		}
		report = reports.get(0);
		//users = service.loadAllUsers();
		return report.getType() + "History";
	}
	
	@Override
	public String getResult() {
		return result;
	}
}
