package cn.unclezhang.bean;

public class Task {
	int sid, impt;
	String userId, targetIds, targetNames, title, content, time, scope;
	String userName,position;
	
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTargetIds() {
		return targetIds;
	}
	public void setTargetIds(String targetIds) {
		this.targetIds = targetIds;
	}
	public String getTargetNames() {
		return targetNames;
	}
	public void setTargetNames(String targetNames) {
		this.targetNames = targetNames;
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
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getImpt() {
		return impt;
	}
	public void setImpt(int impt) {
		this.impt = impt;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Override
	public String toString() {
		return "Task [sid=" + sid + ", impt=" + impt + ", userId=" + userId
				+ ", targetIds=" + targetIds + ", targetNames=" + targetNames
				+ ", title=" + title + ", content=" + content + ", time="
				+ time + "]";
	}
}
