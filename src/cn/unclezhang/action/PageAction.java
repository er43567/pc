package cn.unclezhang.action;

import java.util.List;

import cn.lrxzl.lib.java.tool.Tool;
import cn.lrxzl.ssh_base.support.MyActionSupport;
import cn.unclezhang.bean.Goods;
import cn.unclezhang.bean.Notice;
import cn.unclezhang.bean.Problem;
import cn.unclezhang.bean.Report;
import cn.unclezhang.bean.User;
import cn.unclezhang.conf.Conf;
import cn.unclezhang.relatives.RelativeHelper;

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
		System.out.println(report.getSid());
		report = service.findReportById(report.getSid());
		System.out.println(report);
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
		
		reports = service.loadReportsByDate(report.getType(), report.getTime(), report.getUserId());
		if (reports == null || reports.size() == 0) {
			return "emptyReport";
		}
		System.out.println(report.getType());
		report = reports.get(0);
		//users = service.loadAllUsers();
		return report.getType() + "History";
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
		problems = service.loadProblemsByRef(problem.getRef());
		if (problems == null || problems.size() == 0) {
			//创建所有问题
			System.out.println(problem.getRef() + "," + problem.getChoices());
			problems = service.createProblems(problem.getRef(), problem.getChoices());
		}
		
		report = service.findReportById(problem.getRef());
		
		for (int i=0;i<problems.size();i++) {
			problems.get(i).setText(Conf.explosive_contents[problems.get(i).getWhichItem()]);
			problems.get(i).setRem(report.getItems()[i]);
		}
		//读取Problem的 Notice
		service.readNotice(problem.getRef(), getSessionUserId(), Notice.TYPE_PROBLEM);
		
		return "explosiveProblemList";
	}
	
	public String loadProblemPage() {
		Problem tmp;
		tmp = service.loadProblem(problem.getSid());
		if (Problem.STATE_INITIAL.equals(tmp.getState())) {
			users = service.loadAllUsers(User.OPTIMIZED_TRUE);
			return "explosiveProblem";
		} else {
			problem = tmp;
			if (problem.getResults() != null) {
				problem.setResults(problem.getResults().replaceAll("\n", "<br/>"));
			}
		}
		return "explosiveProblemReview";
	}
	
	public String loadMyProblemList() {
		problems = service.loadMyProblemList();
		
		for (int i=0;i<problems.size();i++) {
			String choices = problems.get(i).getChoices();
			Problem tmpProblem = problems.get(i);
			for (int j = 0; j < choices.length(); j++) {
				char c = choices.charAt(j);
				if (c!='1') {
					tmpProblem.setText(Conf.explosive_contents[j]);
					//tmpProblem.setRem(report.getItems()[i]);
				}
			}
		}
		
		System.out.println(problems.size());
		return "explosiveProblemList";
	}
	
	Goods goods;
	List<Goods> goodsList;
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	//get set
	public String loadGoodsList() {
		//1time userId
		//2time userId
		//3time userId
		//4time userId
		goodsList = service.loadAllGoods();
		return "goodsList";
	}
	@Override
	public String getResult() {
		return result;
	}
}
