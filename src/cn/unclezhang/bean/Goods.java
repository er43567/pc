package cn.unclezhang.bean;

public class Goods {
	//id,unitDefined 核定药量，yesterdayGained昨日领取，todayGained今日领取，todayUse 今日使用，todayStock今日回库，todayStock进入实际存库量
	int sid, unitDefined, yesterdayGained, todayGained, todayUse, todayReturn, todayStock;
	//type 类型：炸药，雷管
	String type, unit, userId, targetIds, acceptedIds, time;
	
	/**
	 * confirm1, confirm2, confirm3 :
	 * todayGained今日领取，todayUse今日使用，todayStock今日回库
	 */
	String confirms1, confirms2, confirms3;
	String confirmNames1, confirmNames2, confirmNames3;
	String acceptedNames;
	public String getAcceptedNames() {
		return acceptedNames;
	}
	public void setAcceptedNames(String acceptedNames) {
		this.acceptedNames = acceptedNames;
	}
	public String getConfirms1() {
		return confirms1;
	}
	public String getConfirms2() {
		return confirms2;
	}
	public String getConfirms3() {
		return confirms3;
	}
	public void setConfirms1(String confirms1) {
		this.confirms1 = confirms1;
	}
	public void setConfirms2(String confirms2) {
		this.confirms2 = confirms2;
	}
	public void setConfirms3(String confirms3) {
		this.confirms3 = confirms3;
	}
	public String getConfirmNames1() {
		return confirmNames1;
	}
	public String getConfirmNames2() {
		return confirmNames2;
	}
	public String getConfirmNames3() {
		return confirmNames3;
	}
	public void setConfirmNames1(String confirmNames1) {
		this.confirmNames1 = confirmNames1;
	}
	public void setConfirmNames2(String confirmNames2) {
		this.confirmNames2 = confirmNames2;
	}
	public void setConfirmNames3(String confirmNames3) {
		this.confirmNames3 = confirmNames3;
	}
	
	
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getUnitDefined() {
		return unitDefined;
	}
	public void setUnitDefined(int unitDefined) {
		this.unitDefined = unitDefined;
	}
	public int getYesterdayGained() {
		return yesterdayGained;
	}
	public void setYesterdayGained(int yesterdayGained) {
		this.yesterdayGained = yesterdayGained;
	}
	public int getTodayGained() {
		return todayGained;
	}
	public void setTodayGained(int todayGained) {
		this.todayGained = todayGained;
	}
	public int getTodayUse() {
		return todayUse;
	}
	public void setTodayUse(int todayUse) {
		this.todayUse = todayUse;
	}
	public int getTodayReturn() {
		return todayReturn;
	}
	public void setTodayReturn(int todayReturn) {
		this.todayReturn = todayReturn;
	}
	public int getTodayStock() {
		return todayStock;
	}
	public void setTodayStock(int todayStock) {
		this.todayStock = todayStock;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
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
	public String getAcceptedIds() {
		return acceptedIds;
	}
	public void setAcceptedIds(String acceptedIds) {
		this.acceptedIds = acceptedIds;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
