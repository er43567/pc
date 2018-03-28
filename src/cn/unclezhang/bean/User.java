package cn.unclezhang.bean;

import org.apache.struts2.json.annotations.JSON;

import cn.lrxzl.ssh_base.support.MyActionSupport.Loginable;

public class User implements Loginable {
	String userId, psw, name, position, headImg, phone, scopes, time;
	
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

	public String getScopes() {
		return scopes;
	}

	public void setScopes(String scopes) {
		this.scopes = scopes;
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
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", psw=" + psw + ", name=" + name
				+ ", position=" + position + ", headImg=" + headImg
				+ ", phone=" + phone + ", scopes=" + scopes + ", time=" + time
				+ "]";
	}

	@Override
	public String getId() {
		return userId;
	}

}
