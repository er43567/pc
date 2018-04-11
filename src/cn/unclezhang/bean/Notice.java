package cn.unclezhang.bean;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class Notice {
	public static final int READ = 1;
	public static final int UNREAD = 0;
	
	public static final String TYPE_ExplosiveReport = "ExplosiveReport";
	public static final String TYPE_FirefightingReport = "FirefightingReport";
	public static final String TYPE_HotalReport = "HotalReport";
	public static final String TYPE_REPLY = "Reply";
	public static final String TYPE_TASK = "Task";
	public static final String TYPE_PROBLEM = "Problem";
	
	public static final int important_normal= 0;
	public static final int important_important = 1;
	public static final int important_urgent = 2;
	
	public String notice_民爆 = Report.report_民爆;
	public String notice_消防 = Report.report_消防;
	public String notice_旅馆 = Report.report_旅馆;
	public static String notice_回复 = "Reply";
	public static String notice_任务 = "Task";
	
	int sid,ref,impts;
	String userId,type,targetIds,title,content,readIds,readNames,time;
	
	int readState;
	String userName;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getReadState() {
		if (readIds == null) 
			return UNREAD;
		readState = readIds.contains(getSessionUserId())?READ:UNREAD;
		return readState;
	}
	User sessionUser;
	public String getSessionUserId() {
		if (sessionUser == null) {
			HttpSession session = ServletActionContext.getRequest().getSession();
			sessionUser = (User) session.getAttribute("user");
		}
		if (sessionUser == null) {
			return null;
		}
		return sessionUser.getUserId();
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getImpts() {
		return impts;
	}
	public void setImpts(int impts) {
		this.impts = impts;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTargetIds() {
		return targetIds;
	}
	public void setTargetIds(String targetIds) {
		this.targetIds = targetIds;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReadIds() {
		return readIds;
	}
	public void setReadIds(String readIds) {
		this.readIds = readIds;
	}
	public String getReadNames() {
		return readNames;
	}
	public void setReadNames(String readNames) {
		this.readNames = readNames;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "Notice [sid=" + sid + ", ref=" + ref + ", impts=" + impts
				+ ", userId=" + userId + ", type=" + type + ", targetIds="
				+ targetIds + ", title=" + title + ", content=" + content
				+ ", readIds=" + readIds + ", readNames=" + readNames
				+ ", time=" + time + ", readState=" + readState + ", userName="
				+ userName + "]";
	}
	
}
