package cn.unclezhang.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import cn.lrxzl.lib.java.tool.Tool;
import cn.lrxzl.ssh_base.support.MyActionSupport;
import cn.unclezhang.bean.Goods;
import cn.unclezhang.bean.Notice;
import cn.unclezhang.bean.Problem;
import cn.unclezhang.bean.Report;
import cn.unclezhang.bean.User;
import cn.unclezhang.conf.Conf;

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
		users = service.loadAllUsers(User.OPTIMIZED_TRUE);
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
	public String loadReportCreatePage() {
		report = new Report();
		report.setReportItems(Arrays.asList(Conf.getExplosives(getSessionUser().getRank())));
		System.out.println(report);
		return "theReport";
	}
	public String loadReportPage() {
		System.out.println(report);
		report = service.findReportById(report.getSid());
		System.out.println(report);
		User u = service.findUserById(report.getUserId());
		/*String X = u.getRank()>=2?"X":"";
		X = "X";*/
		report.setReportItems(Arrays.asList(Conf.getExplosives(u.getRank())));
		//标记已读
		service.readNotice(report.getSid(), getSessionUserId(), report.getType());
		return /*report.getType() + */"theReportHistory";
	}
	public String loadReportEditPage() {
		report = service.findReportById(report.getSid());
		User u = service.findUserById(report.getUserId());
		/*String X = u.getRank()>=2?"X":"";
		X = "X";*/
		report.setReportItems(Arrays.asList(Conf.getExplosives(u.getRank())));
		return /*report.getType() + X + */"theReportEdit";
	}
	public String loadReportReceivePage() {
		System.out.println(report.getSid());
		report = service.findReportById(report.getSid());
		System.out.println(report);
		User u = service.findUserById(report.getUserId());
		/*String X = u.getRank()>=2?"X":"";
		X = "X";*/
		report.setReportItems(Arrays.asList(Conf.getExplosives(u.getRank())));
		
		//标记已读
		service.readNotice(report.getSid(), getSessionUserId(), report.getType());
		return /*report.getType() + X + */"theReportReceive";
	}
	
//	public String loadReportItemsPage() {
//		report.setReportItems(Arrays.asList(Conf.getExplosives(getSessionUser().getRank())));
//		System.out.println(Arrays.toString(Conf.getExplosives(getSessionUser().getRank())));
//		return "ExplosiveReport" /*+ getSessionUser().getRank()*/;
//	}
	/*===========历史页面===========*/
	List<Report> reports;
	public List<Report> getReports() {
		return reports;
	}
	public void setReports(List<Report> reports) {
		this.reports = reports;
	}
	public String loadUnitDateReports() {
		if (report.getTime() == null) {
			report.setTime(Tool.time());
		}
		
		reports = service.loadUnitDateReports(report.getType(), report.getTime(), report.getUnit());
		if (reports == null || reports.size() == 0) {
			return "emptyReport";
		}
		System.out.println(report.getType());
		report = reports.get(0);
		
		User u = service.findUserById(report.getUserId());
		report.setReportItems(Arrays.asList(Conf.getExplosives(u.getRank())));
		//users = service.loadAllUsers();
		return /*report.getType() + */"theReportHistory";
	}
	
	/**
	 * 流程管控
	 */
	Problem problem;
	List<Problem> problems;
	public List<Problem> getProblems() {
		return problems;
	}
	public void setProblems(List<Problem> problems) {
		this.problems = problems;
	}
	public Problem getProblem() {
		return problem;
	}
	public void setProblem(Problem problem) {
		this.problem = problem;
	}
	public String loadProblemList() {
		System.out.println(problem.getRef());
		report = service.findReportById(problem.getRef());
		
		problems = service.loadProblemsByRef(report.getSid(), report.getUserId());
		System.out.println(problem.getRef() + "," + problem.getChoices());
		System.out.println("size:" + problems.size());
		/*if (problems == null || problems.size() == 0) {
			//创建所有问题
			problems = service.createProblems(problem.getRef(), problem.getChoices());
		}
		System.out.println("size:" + problems.size());
		*/
		User u = service.findUserById(report.getUserId());
		System.out.println(Arrays.toString(report.getItems()));
		for (int i=0;i<problems.size();i++) {
			System.out.println("rem" + i + report.getItems()[i]);
			Problem item = problems.get(i);
			item.setText(Conf.getExplosive(u.getRank(), item.getWhichItem()));
			//item.setRem(report.getItems()[item.getWhichItem()]);
		}
		//读取Problem的 Notice
		service.readNotice(problem.getRef(), getSessionUserId(), Notice.TYPE_PROBLEM);
		
		return "explosiveProblemList";
	}
	
	public String loadProblemPage() {
		problem = service.loadProblem(problem.getSid());
		
		/*report = service.findReportById(tmp.getRef());
		tmp.setRem(report.getItems()[tmp.getWhichItem()]);*/
		
		if (Problem.STATE_INITIAL.equals(problem.getState())) {
			List<User> userList = service.loadAllUsers(User.OPTIMIZED_TRUE);
			users = new ArrayList<User>();
			for (int i = 0; i < userList.size(); i++) {
				if (userList.get(i).getUnit().equals(getSessionUser().getUnit())) {
					users.add(userList.get(i));
				}
			}
			return "explosiveProblem";
		} else {
			if (problem.getResults() != null) {
				problem.setResults(problem.getResults().replaceAll("\n", "<br/>"));
			}
		}
		return "explosiveProblemReview";
	}
	
	public String loadMyProblemList() {
		problems = service.loadMyProblemList();
		for (int i=0; problems!=null && i<problems.size();i++) {
			//String choices = problems.get(i).getChoices();
			Problem tmpProblem = problems.get(i);
			Report tmpReport = service.findReportById(tmpProblem.getRef());
			
			User u = service.findUserById(tmpReport.getUserId());
			
			tmpProblem.setText("["+tmpReport.getChineseType()+ " " + tmpProblem.getTime() + "]<br/>" 
					+ Conf.getExplosive(u.getRank(), tmpProblem.getWhichItem()));
			//tmpProblem.setRem(tmpReport.getItems()[tmpProblem.getWhichItem()]);
			/*for (int j = 0; j < choices.length(); j++) {
				char c = choices.charAt(j);
				if (c!='1') {
					tmpProblem.setText("["+tmpProblem.getReportType()+ " " + tmpProblem.getTime() + "]<br/>" 
							+ Conf.explosive_contents[j]);
					
					tmpProblem.setRem(tmpReport.getItems()[j]);
					System.out.println(tmpProblem);
				}
			}*/
		}
		//去掉标题
		report.setType("");
		return "explosiveProblemList";
	}
	
	@Override
	public String getResult() {
		return result;
	}
}
