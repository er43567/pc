
package cn.unclezhang.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.http.util.TextUtils;
import org.apache.struts2.json.annotations.JSON;






import cn.lrxzl.file.FileUtil;
import cn.lrxzl.lib.java.tool.Tool;
import cn.lrxzl.ssh_base.support.MyActionSupport;
import cn.unclezhang.bean.Goods;
import cn.unclezhang.bean.Notice;
import cn.unclezhang.bean.Problem;
import cn.unclezhang.bean.Reply;
import cn.unclezhang.bean.Report;
import cn.unclezhang.bean.Task;
import cn.unclezhang.bean.User;
import cn.unclezhang.conf.Conf;
import cn.unclezhang.relatives.RelativeHelper;

public class AjaxAction extends MyActionSupport {
	int from_id, page, count_per_page = 10;
	public void setPage(int page) {
		this.page = page;
		from_id = (page-1)*10;
	}
	List<String> list;
	public List<String> getList() {
		return list;
	}
	public void setList(List<String> list) {
		this.list = list;
	}
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
	
	@SuppressWarnings("unused")
	public String login() {
		/*if (isLogin()) {
			System.out.println("already logined");
			url = "main.jsp";
			return aa;
		}*/
		User tmp = service.findUserById(user.getUserId());
		//System.out.println(tmp.getPsw() + "," + user.getPsw());
		if (tmp == null) {
			setResult("账号错误");
			System.out.println("账号错误");
			return aa;
		} else if (!tmp.getPsw().equals(user.getPsw())) {
			setResult("密码错误");
			System.out.println("密码错误");
			return aa;
		}
		login(tmp);
		System.out.println("login success " + tmp);
		url = "main.jsp";
		return aa;
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
		if (!isLogin()) {
			setResult("did not login");
			return aa;
		}
		JSONObject jo = new JSONObject();
		jo.put("reportCount", "0");
		//service.loadReportCount();
		System.out.println(getSessionUserId());
		int ncount = service.loadNoticeCount(getSessionUserId());
		System.out.println("noticeCount:" + ncount);
		jo.put("noticeCount", ncount);
		setResult(jo.toString());
		return aa;
	}
	public String loadSessionUser() {
		user = getSessionUser();
		return aa;
	}
	/*===========用户设置页面===========*/
	public String updateHeadImg() {
		boolean bo = service.updateUserFiled(getSessionUserId(), "headImg", user.getHeadImg());
		if (!bo) {
			setResult("fail");
		} else {
			getSessionUser().setHeadImg(user.getHeadImg());
		}
		return aa;
	}
	
	public String updatePhone() {
		boolean bo = service.updateUserFiled(getSessionUserId(), "phone", user.getPhone());
		if (!bo) {
			setResult("fail");
		} else {
			getSessionUser().setPhone(user.getPhone());
		}
		return aa;
	}
	String newPsw;
	public String getNewPsw() {
		return newPsw;
	}
	public void setNewPsw(String newPsw) {
		this.newPsw = newPsw;
	}
	public String updatePsw() {
		if (getSessionUser().getPsw().equals(user.getPsw())) {
			boolean bo = service.updateUserFiled(getSessionUserId(), "psw", newPsw);
			if(!bo) {
				setResult("修改密码失败");
			}
		} else {
			setResult("旧密码错误");
		}
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
	boolean noPic = false;
	public void setNoPic(boolean noPic) {
		this.noPic = noPic;
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
		List<Report> tmprs = null;
		if((tmprs = service.loadUnitDateReports(report.getType(), report.getTime(), getSessionUser().getUnit())) != null) {
			if (tmprs.size() != 0) {
				//如果已经发布过改日期的表单
				if (getSessionUser().getRank()==1) {
					//判断是否位1级
					setResult("reported");
					return aa;
				}
			}
			//report = tmprs.get(0);
		}
		/*if((tmpr = service.findTypeReportByDate(report.getType(), report.getTime())) != null) {
			setResult("reported");
			report = tmpr;
			return aa;
		}*/
		
		/**
		 * 处理图片
		 */
		String tmp_htext = new String();
		String upload_path = request.getServletContext().getRealPath("/pages/upload");
		
		System.out.println("noPic:" + noPic);
		if (noPic == false) {
			String files[] = report.getFiles();
			if (files != null) {
				
			} else {
				System.out.println("files null");
			}
			for(int i=0;i<files.length;i++) {
				if(TextUtils.isEmpty(files[i]))continue;
				//files[i] = Tool.(files[i]);
				System.out.println(files[i]);
				String NewFileName = new Date().getTime()+""+((char)((Math.random()*26)+97))+((char)((Math.random()*26)+97));
				System.out.println(files[i].substring(0,100));
				String Ext = FileUtil.getImageExtFromBase64(files[i]);
				FileUtil.generateImage(files[i],upload_path,NewFileName,Ext);
				tmp_htext += NewFileName+"."+Ext+(i<files.length-1?";":"");
			}
			report.setImgs(tmp_htext);
		} else {
			report.setImgs("");
		}
		
		int sid = service.saveReport(getSessionUserId(), Tool.unescape(report.getType()+"")
				, Tool.unescape(report.getTargets()+""), Tool.unescape(items+"").split(",")
				, report.getChoices(), Tool.unescape(report.getRem()+""), report.getTime()
				, getSessionUser().getScope(), report.getImgs(), Tool.unescape(report.getCheckedUnit()));
		
		//创建所有问题
		if (items.startsWith(",")) {
			items = items.substring(1);
		}
		
		service.createProblems(sid, report.getChoices(), Tool.unescape(items+"").split(","));
		setResult(sid + "");
		
		return aa;
	}
	
	public String updateReport() {
		
		service.updateReport(report.getSid()
				, getSessionUserId()
				, Tool.unescape(report.getTargets()+"")
				, Tool.unescape(items+"").split(",")
				, report.getChoices()
				, Tool.unescape(report.getRem()+""));
		
		return aa;
	}
	
	public String updateProblemReform() {
		boolean bo = service.updateProblemReform(problem.getSid(), Tool.unescape(problem.getReform()));
		if(!bo) {
			setResult("fail");
		}
		return aa;
	}
	/**
	 * ============Notice===========
	 */
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
		//System.out.println(Tool.unescape(notice.getTargetIds()));
		String noticeSid = service.saveNotice(getSessionUserId(), notice.getRef()
				, Tool.unescape(notice.getType()), Tool.unescape(notice.getTargetIds())
				, Tool.unescape(notice.getTitle()), Tool.unescape(notice.getContent())
				, notice.getImpts());
		
		setResult(noticeSid);
		return aa;
	}
	
	List<Notice> notices;
	public List<Notice> getNotices() {
		return notices;
	}
	public void setNotices(List<Notice> notices) {
		this.notices = notices;
	}
	public String loadNoticeList() {
		if (page == 1) {
			notices = service.loadNoticeList(getSessionUserId(), 0, 0, Conf.not_read_yet);
			List<Notice> li = service.loadNoticeList(getSessionUserId(), from_id, count_per_page, Conf.has_read);
			notices.addAll(li);
		} else if (page != 1) {
			notices = service.loadNoticeList(getSessionUserId(), from_id, count_per_page, Conf.has_read);
		}
		return aa;
	}
	
	public String loadNoticeList1() {
		if(page == 1) {
			session.removeAttribute(getSessionUserId() + "_oldsize");
		}
		Object o = session.getAttribute(getSessionUserId() + "_oldsize");
		int oldSize = 0;
		if(o != null) oldSize = (Integer) o;
		List<Notice> li = new ArrayList<Notice>();
		List<Notice> li1 = null;
		boolean hasNotReads = false;
		System.out.println(page);
		if (page == 1) {
			li1 = service.loadNoticeList(getSessionUserId(), 0, 0, Conf.not_read_yet);
			System.out.println("li1.size = " + li1.size() + "," + oldSize);
			if (li1 != null && li1.size() != oldSize) {
				li.addAll(li1);
				oldSize = li1.size();
				session.setAttribute(getSessionUserId() + "_oldsize", oldSize);
				hasNotReads = true;
			}
		} else {
			if(hasNotReads)
				setPage(page-1);
			List<Notice> li2 = service.loadNoticeList(getSessionUserId(), from_id, count_per_page, Conf.has_read);
			li.addAll(li2);
		}
		
		/*if (li1 == null || li1.size() == 0) {
			if(hasNotReads)
				setPage(page-1);
			List<Notice> li2 = service.loadNoticeList(getSessionUserId(), from_id, count_per_page, Conf.has_read);
			li.addAll(li2);
		}*/
		
		notices = li;
		return aa;
	}
	/**
	 * ===========Reply===========
	 */
	Reply reply;
	List<Reply> replies;
	public Reply getReply() {
		return reply;
	}
	public void setReply(Reply reply) {
		this.reply = reply;
	}
	public List<Reply> getReplies() {
		return replies;
	}
	public void setReplies(List<Reply> replies) {
		this.replies = replies;
	}
	public String submitReply() {
		if (!isLogin()) {
			setResult("did not login");
			return aa;
		}
		boolean bo = service.saveReply(reply.getRef(), getSessionUserId()
				, reply.getTargetId(), Tool.unescape(reply.getContent()));
		if (!bo) {
			setResult("fail");
		} else {
			service.saveNotice(getSessionUserId(), reply.getRef()
					, Notice.notice_回复, reply.getTargetId(), "回复", Tool.unescape(reply.getContent())
					, Notice.important_normal);
		}
		return aa;
	}
	
	public String loadReplyList() {
		replies = service.loadReplies(reply.getRef(), getSessionUserId(), 0, 0);
		if (replies == null) {
			setResult("fail");
		} else {
			service.readNotice(reply.getRef(), getSessionUserId(), Notice.notice_回复);
		}
		return aa;
	}
	
	/**
	 * API of History Page For Android 
	 */
	public String loadHistoryColors() {
		List<String> li = service.loadHistoryColors(report.getUnit());
		if (li == null || li.size() == 0) {
			setResult("fail");
			return aa;
		}
		setResult(Arrays.toString(li.toArray()));
		return aa;
	}
	String date;
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String loadTypeStatesByDate() {
		String rst = service.loadTypeStates(date, report.getUnit());
		if (rst == null) {
			setResult("fail");
		}
		setResult(rst);
		return aa;
	}
	
	/**
	 * History Report
	 */
	/*List<User> users;
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}*/
	List<String> units;
	public List<String> getUnits() {
		return units;
	}
	public void setUnits(List<String> units) {
		this.units = units;
	}
	public String loadMyRelativesUnits() {
		/*users = service.loadReportRelativedUsers();
		for (int i = 0; i < users.size(); i++) {
			User u = users.get(i);
			u.setHeadImg(null);
		}*/
		units = Arrays.asList(RelativeHelper.getRelativeUnits(getSessionUser().getUnit()));
		return aa;
	}
	
	/**
	 * Task
	 */
	Task task;
	List<Task> tasks;
	String headImg;
	public Task getTask() {
		return task;
	}
	public void setTask(Task task) {
		this.task = task;
	}
	public List<Task> getTasks() {
		return tasks;
	}
	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}
	public String getHeadImg() {
		return headImg;
	}
	public String publishTask() {
		if (!isLogin()) {
			setResult("fail");
			return aa;
		}
		int taskSid = service.saveTask(Tool.unescape(task.getTitle()), Tool.unescape(task.getContent())
				, Tool.unescape(task.getTargetIds() + "," + getSessionUserId()), task.getImpt());
		if (taskSid == -1) {
			setResult("fail");
		} else {
			service.saveNotice(getSessionUserId()
					, taskSid
					, Notice.notice_任务
					, Tool.unescape(task.getTargetIds())
					, Tool.unescape(task.getTitle())
					, Tool.unescape(task.getContent())
					, task.getImpt());
		}
		return aa;
	}
	
	public String loadLatestTask() {
		task = service.loadLatestTask();
		if (task == null) {
			return aa;
		}
		headImg = service.findUserById(task.getUserId()).getHeadImg();
		service.readNotice(task.getSid(), getSessionUserId(), Notice.notice_任务);
		return aa;
	}
	
	public String loadTasks() {
		tasks = service.loadTasks(from_id, count_per_page);
		service.readNotice(-1, getSessionUserId(), Notice.notice_任务);
		return aa;
	}
	/**
	 * 流程管控 processCtrl problem
	 */
	Problem problem;
	public Problem getProblem() {
		return problem;
	}
	public void setProblem(Problem problem) {
		this.problem = problem;
	}
	String selectedUnit;
	public void setSelectedUnit(String selectedUnit) {
		this.selectedUnit = selectedUnit;
	}
	public String firstUpdateAndNoticeProblem() {
		/*RelativeHelper rh = new RelativeHelper(null, service);
		problem.setTargetIds(rh.getUserIdsByUnitNames(-1, selectedUnit));
		System.out.println(problem.getTargetIds());*/
		
		boolean bo = service.firstUpdateAndNoticeProblem(problem.getSid()
				, problem.getRisk()
				, Tool.unescape(problem.getMeasure())
				, Tool.unescape(problem.getExpire())
				, problem.getFunctionary());
		if (bo == false) {
			setResult("fail");
		}
		return aa;
	}
	
	public String addProblemResult() {
		boolean bo = service.updateProblemFiled(problem.getSid() , "results", Tool.unescape(problem.getResults()));
		if (!bo) {
			setResult("fail");
		}
		return aa;
	}
	
	public String confirmProblem() {
		problem = service.loadProblem(problem.getSid());
		try {
			if (problem.getTargetIds().contains(getSessionUserId())) {
				
				service.updateProblemFiled(problem.getSid(), "acceptedIds"
						, problem.getAcceptedIds()+","+getSessionUserId());
				problem.setAcceptedIds(problem.getAcceptedIds()+","+getSessionUserId());
				//检测问题是否完成
				String targetIds = problem.getTargetIds();
				if (targetIds != null) {
					String acceptedIds[] = problem.getAcceptedIds().split(",");
					System.out.println("getAcceptedIds:" + problem.getAcceptedIds());
					for (int i = 0; i < acceptedIds.length; i++) {
						targetIds = targetIds.replaceAll(acceptedIds[i], "");
					}
					targetIds = targetIds.replaceAll(",", "");
					System.out.println("targetIds:" + targetIds);
					if (targetIds.trim().equals("")) {
						problem.setState(Problem.STATE_FINISHED);
						service.updateProblemFiled(problem.getSid(), "state", Problem.STATE_FINISHED);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			setResult("fail");
		}
		return aa;
	}
	List<Problem> problems;
	public List<Problem> getProblems() {
		return problems;
	}
	public void setProblems(List<Problem> problems) {
		this.problems = problems;
	}
	
	public String loadMyRelUnitsProblemList() {
		if (page == 1) {
			problems = service.loadMyRelativeUnitsProblemList(false, getSessionUser().getUnit(), from_id, count_per_page);
			if (problems == null) {
				problems = new ArrayList<Problem>();
			}
			List<Problem> finishedProblems = service.loadMyRelativeUnitsProblemList(true, getSessionUser().getUnit(), from_id, count_per_page);
			if (finishedProblems != null) {
				problems.addAll(finishedProblems);
			}
		} else {
			problems = service.loadMyRelativeUnitsProblemList(true, getSessionUser().getUnit(), from_id, count_per_page);
		}
		
		for (int i=0; problems!=null && i<problems.size(); i++) {
			Problem tmpProblem = problems.get(i);
			Report tmpReport = service.findReportById(tmpProblem.getRef());
			User u = service.findUserById(tmpReport.getUserId());
			/*String beCheckedUnitText = " ";
			if (!TextUtils.isEmpty(tmpReport.getCheckedUnit())) {
				beCheckedUnitText = "检查" + tmpReport.getCheckedUnit() + " ";
			}*/
			tmpProblem.setText("[" + tmpReport.getUnit() + " " + tmpProblem.getTime().substring(0, 16) + "]<br/>" 
					+ Conf.getExplosive(u.getRank(), tmpProblem.getWhichItem()));
		}
		//去掉标题
		report.setType("");
		return "explosiveProblemList";
	}
	
	/**
	 * 闭环管理
	 * loopCtrl
	 */
	Goods goods;
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public String saveGoods() {
		goods.setType(Tool.unescape(goods.getType()));//unEscape
		int n = service.saveGoods(getSessionUser().getUserId(), goods);
		if (n == -1) {
			setResult("fail");
		}
		return aa;
	}
	public String updateGoods() {
		boolean bo = service.updateGoods(goods.getSid(), goods.getTodayGained(), goods.getTodayUse(), goods.getTodayReturn());
		if (!bo) {
			setResult("fail");
		}
		return aa;
	}
	List<Goods> goodsList;
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	public String loadGoodsList() {
		System.out.println(Tool.unescape(goods.getUnit()));
		goodsList = service.loadGoodsList(Tool.unescape(goods.getUnit())
				, from_id, count_per_page);
		System.out.println(goodsList.size());
		return aa;
	}
	
	int confirmType;
	public void setConfirmType(int confirmType) {
		this.confirmType = confirmType;
	}
	public String confirmGoods() {
		boolean bo = service.confirmGoods(getSessionUserId(), goods.getSid(), confirmType);
		if (!bo) {
			setResult("fail");
		}
		return aa;
	}
	
	
	public String softerConfirmReport() {
		if (!getSessionUser().getPosition().equals("安全员")) {
			//如果不是安全员
			setResult("fail");
			return aa;
		}
		boolean bo = service.softerConfirm(getSessionUserId(), report.getSid());
		if (!bo) {
			setResult("fail");
		}
		return aa;
	}
	
	public String loadLoopCtrlUnitList() {
		list = service.loadLoopCtrlUnitList(getSessionUser().getUnit(), getSessionUser().getRank());
		return aa;
	}
	
	public String getResult() {
		return result;
	}
	
}
