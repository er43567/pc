package cn.unclezhang.bean;
public class Problem {
	public static final String STATE_INITIAL = "initial";
	public static final String STATE_DEALING = "dealing";
	public static final String STATE_FINISHED = "finished";
	int sid, ref, whichItem, risk;
	String userId, choices, title, measure, expire, targetIds, functionary, acceptedIds, results, state,rem;
	String time;
	
	String acceptingUserName, acceptedUserName, functionaryName;
	String reportType;
	String text;
	public String getAcceptingUserName() {
		return acceptingUserName;
	}
	public void setAcceptingUserName(String acceptingUserName) {
		this.acceptingUserName = acceptingUserName;
	}
	public String getAcceptedUserName() {
		return acceptedUserName;
	}
	public void setAcceptedUserName(String acceptedUserName) {
		this.acceptedUserName = acceptedUserName;
	}
	public String getFunctionaryName() {
		return functionaryName;
	}
	public void setFunctionaryName(String functionaryName) {
		this.functionaryName = functionaryName;
	}
	/*public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}*/
	
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getWhichItem() {
		return whichItem;
	}
	public void setWhichItem(int whichItem) {
		this.whichItem = whichItem;
	}
	public int getRisk() {
		return risk;
	}
	public void setRisk(int risk) {
		this.risk = risk;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getChoices() {
		return choices;
	}
	public void setChoices(String choices) {
		this.choices = choices;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMeasure() {
		return measure;
	}
	public void setMeasure(String measure) {
		this.measure = measure;
	}
	public String getExpire() {
		return expire;
	}
	public void setExpire(String expire) {
		this.expire = expire;
	}
	public String getTargetIds() {
		return targetIds;
	}
	public void setTargetIds(String targetIds) {
		this.targetIds = targetIds;
	}
	public String getAcceptedIds() {
		return acceptedIds;
	}
	public void setAcceptedIds(String acceptedIds) {
		this.acceptedIds = acceptedIds;
	}
	public String getFunctionary() {
		return functionary;
	}
	public void setFunctionary(String functionary) {
		this.functionary = functionary;
	}
	public String getResults() {
		return results;
	}
	public void setResults(String results) {
		this.results = results;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
	public void setText(String text) {
		this.text = text;
	}
	public String getText() {
		return text;
	}
	public void setRem(String rem) {
		this.rem = rem;
	}
	public String getRem() {
		return rem;
	}
	@Override
	public String toString() {
		return "Problem [sid=" + sid + ", ref=" + ref + ", whichItem="
				+ whichItem + ", risk=" + risk + ", userId=" + userId
				+ ", choices=" + choices + ", title=" + title + ", measure="
				+ measure + ", expire=" + expire + ", targetIds=" + targetIds
				+ ", functionary=" + functionary + ", acceptedIds="
				+ acceptedIds + ", results=" + results + ", state=" + state
				+ ", time=" + time + ", acceptingUserName=" + acceptingUserName
				+ ", acceptedUserName=" + acceptedUserName
				+ ", functionaryName=" + functionaryName +
				", text=" + text + ", rem=" + rem + "]";
	}
	
}
