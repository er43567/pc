package cn.unclezhang.bean;
public class Reply {
	int sid,state;
	String userId,targetIds,content,img,time;
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	@Override
	public String toString() {
		return "Reply [sid=" + sid + ", state=" + state + ", userId=" + userId
				+ ", targetIds=" + targetIds + ", content=" + content
				+ ", img=" + img + "]";
	}
}
