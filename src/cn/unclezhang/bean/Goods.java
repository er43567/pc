package cn.unclezhang.bean;

public class Goods {
	//id,unitDefined 核定药量，yesterdayGained昨日领取，todayGained今日领取，todayUse 今日使用，todayStock今日回库，todayStock进入实际存库量
	int sid, unitDefined, yesterdayGained, todayGained, todayUse, todayReturn, todayStock;
	//type 类型：炸药，雷管
	String type, unit, userId, targetIds, acceptedIds;
	
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
}
