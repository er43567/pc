package cn.unclezhang.bean;

public class Notice {
	int sid,impts;
	String userId,type,targetIds,title,content,readIds,readNames,time;
	
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
		return "Push [sid=" + sid + ", impts=" + impts + ", type=" + type
				+ ", targetIds=" + targetIds + ", title=" + title
				+ ", content=" + content + ", readIds=" + readIds
				+ ", readNams=" + readNames + "]";
	}
}
