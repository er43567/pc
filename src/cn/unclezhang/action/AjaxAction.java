package cn.unclezhang.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.struts2.json.annotations.JSON;

import cn.lrxzl.lib.java.tool.Tool;
import cn.lrxzl.ssh_base.support.MyActionSupport;
import cn.unclezhang.bean.Notice;
import cn.unclezhang.bean.Reply;
import cn.unclezhang.bean.Report;
import cn.unclezhang.bean.User;
import cn.unclezhang.conf.Conf;

public class AjaxAction extends MyActionSupport {
	int from_id, page, count_per_page = 10;
	public void setPage(int page) {
		this.page = page;
		from_id = (page-1)*10;
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
	
	/*===========用户设置页面===========*/
	public String updateField() {
		//[^a-zA-Z0-9\_]
		service.updateUserFiled(getSessionUserId(), field, value);
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
		Report tmpr = null;
		if((tmpr=service.findTypeReportByDate(report.getType(), report.getTime())) != null) {
			setResult("reported");
			report = tmpr;
			return aa;
		}
		int sid = service.saveReport(getSessionUserId(), Tool.unescape(report.getType()+"")
				, Tool.unescape(report.getTargets()+""), Tool.unescape(items+"").split(",")
				, report.getChoices(), Tool.unescape(report.getRem()+""), report.getTime());
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
		System.out.println(Tool.unescape(notice.getTargetIds()));
		
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
		//notices = service.loadNoticeList(getSessionUserId(), from_id, count_per_page);
		List<Notice> li1 = service.loadNoticeList(getSessionUserId(), 0, 0, 0);
		List<Notice> li2 = service.loadNoticeList(getSessionUserId(), from_id, count_per_page, 1);
		List<Notice> li = new ArrayList<Notice>();
		li.addAll(li1);
		li.addAll(li2);
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
					, Conf.notice_回复, reply.getTargetId(), "回复", Tool.unescape(reply.getContent())
					, Conf.important_normal);
		}
		return aa;
	}
	
	public String loadReplyList() {
		replies = service.loadReplies(reply.getRef(), getSessionUserId(), 0, 0);
		if (replies == null) {
			setResult("fail");
		} else {
			service.readNotice(reply.getRef(), getSessionUserId(), Conf.notice_回复);
		}
		return aa;
	}
	
	
	/**
	 * API of History Page For Android 
	 */
	public String loadHistoryColors() {
		List<String> li = service.loadHistoryColors();
		if (li == null || li.size() == 0) {
			setResult("fail");
			return aa;
		}
		setResult(Arrays.toString(li.toArray()));
		return aa;
	}
	
	public String getResult() {
		return result;
	}
}
