package cn.unclezhang.bean;

import org.apache.struts2.json.annotations.JSON;

import cn.lrxzl.ssh_base.support.MyActionSupport.Loginable;

public class User implements Loginable {
	public static boolean OPTIMIZED_TRUE = true;
	public static boolean OPTIMIZED_FALSE = true;
	String userId, psw, name, position, headImg, phone, scope, time, unit;
	int rank;
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	@JSON(serialize=false)
	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", psw=" + psw + ", name=" + name
				+ ", position=" + position + ", headImg=" + headImg
				+ ", phone=" + phone + ", scope=" + scope + ", time=" + time
				+ "]";
	}

	@Override
	public String getId() {
		return userId;
	}

}
