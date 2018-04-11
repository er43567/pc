package cn.unclezhang.bean;

public class Report {
	public static final String report_民爆 = "ExplosiveReport";
	public static final String report_消防 = "FirefightingReport";
	public static final String report_旅馆 = "HotalReport";
	
	int sid, state;
	String type, userId, scope, targets, choices, rem, time;
	String choices0;
	String item1,item2,item3,item4,item5,
		item6,item7,item8,item9,item10,
		item11,item12,item13,item14,item15,
		item16,item17,item18,item19,item20,
		item21,item22,item23,item24,item25;
	int noticed;
	String userName;
	String phone;
	String wholeName;
	public String[] getItems() {
		return new String[]{
				item1,item2,item3,item4,item5,
				item6,item7,item8,item9,item10,
				item11,item12,item13,item14,item15,
				item16,item17,item18,item19,item20,
				item21,item22,item23,item24,item25
		};
	}
	public void setItems(String items[]) throws Exception {
		System.out.println("item len:" + items.length);
		if (items.length>=2) item1 = items[1];
		if (items.length>=3) item2 = items[2];
		if (items.length>=4) item3 = items[3];
		if (items.length>=5) item4 = items[4];
		if (items.length>=6) item5 = items[5];
		if (items.length>=7) item6 = items[6];
		if (items.length>=8) item7 = items[7];
		if (items.length>=9) item8 = items[8];
		if (items.length>=10) item9 = items[9];
		if (items.length>=11) item10 = items[10];
		if (items.length>=12) item11 = items[11];
		if (items.length>=13) item12 = items[12];
		if (items.length>=14) item13 = items[13];
		if (items.length>=15) item14 = items[14];
		if (items.length>=16) item15 = items[15];
		if (items.length>=17) item16 = items[16];
		if (items.length>=18) item17 = items[17];
		if (items.length>=19) item18 = items[18];
		if (items.length>=20) item19 = items[19];
		if (items.length>=21) item20 = items[20];
		if (items.length>=22) item21 = items[21];
		if (items.length>=23) item22 = items[22];
		if (items.length>=24) item23 = items[23];
		if (items.length>=25) item24 = items[24];
		if (items.length>=26) item25 = items[25];
		/*System.out.println("===" + Arrays.toString(items));
		for(int i=1;i<items.length;i++) {
			Field f = this.getClass().getDeclaredField("item"+i);
			f.setAccessible(true);
			f.set(this, items[i]);
		}*/
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getWholeName() {
		return wholeName;
	}
	public void setWholeName(String wholeName) {
		this.wholeName = wholeName;
	}
	
	/*public static void main(String[] args) throws IllegalArgumentException, IllegalAccessException {
		Report tt = new Report();
		try {
			Field f = tt.getClass().getDeclaredField("item1");
			f.setAccessible(true);
			f.set(tt, "sdf");
			System.out.println(tt.getItem1());
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		}
	}*/
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getTargets() {
		return targets;
	}
	public void setTargets(String targets) {
		this.targets = targets;
	}
	public String getRem() {
		return rem;
	}
	public void setRem(String rem) {
		this.rem = rem;
	}
	public String getChoices() {
		return choices;
	}
	public void setChoices(String choices) {
		this.choices = choices;
	}
	
	
	public int getNoticed() {
		return noticed;
	}
	public void setNoticed(int noticed) {
		this.noticed = noticed;
	}
	/*==========*/
	
	public String getItem1() {
		return item1;
	}
	public void setItem1(String item1) {
		this.item1 = item1;
	}
	public String getItem2() {
		return item2;
	}
	public void setItem2(String item2) {
		this.item2 = item2;
	}
	public String getItem3() {
		return item3;
	}
	public void setItem3(String item3) {
		this.item3 = item3;
	}
	public String getItem4() {
		return item4;
	}
	public void setItem4(String item4) {
		this.item4 = item4;
	}
	public String getItem5() {
		return item5;
	}
	public void setItem5(String item5) {
		this.item5 = item5;
	}
	public String getItem6() {
		return item6;
	}
	public void setItem6(String item6) {
		this.item6 = item6;
	}
	public String getItem7() {
		return item7;
	}
	public void setItem7(String item7) {
		this.item7 = item7;
	}
	public String getItem8() {
		return item8;
	}
	public void setItem8(String item8) {
		this.item8 = item8;
	}
	public String getItem9() {
		return item9;
	}
	public void setItem9(String item9) {
		this.item9 = item9;
	}
	public String getItem10() {
		return item10;
	}
	public void setItem10(String item10) {
		this.item10 = item10;
	}
	public String getItem11() {
		return item11;
	}
	public void setItem11(String item11) {
		this.item11 = item11;
	}
	public String getItem12() {
		return item12;
	}
	public void setItem12(String item12) {
		this.item12 = item12;
	}
	public String getItem13() {
		return item13;
	}
	public void setItem13(String item13) {
		this.item13 = item13;
	}
	public String getItem14() {
		return item14;
	}
	public void setItem14(String item14) {
		this.item14 = item14;
	}
	public String getItem15() {
		return item15;
	}
	public void setItem15(String item15) {
		this.item15 = item15;
	}
	public String getItem16() {
		return item16;
	}
	public void setItem16(String item16) {
		this.item16 = item16;
	}
	public String getItem17() {
		return item17;
	}
	public void setItem17(String item17) {
		this.item17 = item17;
	}
	public String getItem18() {
		return item18;
	}
	public void setItem18(String item18) {
		this.item18 = item18;
	}
	public String getItem19() {
		return item19;
	}
	public void setItem19(String item19) {
		this.item19 = item19;
	}
	public String getItem20() {
		return item20;
	}
	public void setItem20(String item20) {
		this.item20 = item20;
	}
	public String getItem21() {
		return item21;
	}
	public void setItem21(String item21) {
		this.item21 = item21;
	}
	public String getItem22() {
		return item22;
	}
	public void setItem22(String item22) {
		this.item22 = item22;
	}
	public String getItem23() {
		return item23;
	}
	public void setItem23(String item23) {
		this.item23 = item23;
	}
	public String getItem24() {
		return item24;
	}
	public void setItem24(String item24) {
		this.item24 = item24;
	}
	public String getItem25() {
		return item25;
	}
	public void setItem25(String item25) {
		this.item25 = item25;
	}
	public String getChoices0() {
		return choices0;
	}
	public void setChoices0(String choices0) {
		this.choices0 = choices0;
	}
	
	@Override
	public String toString() {
		return "Report [sid=" + sid + ", state=" + state + ", type=" + type
				+ ", userId=" + userId + ", scope=" + scope + ", targets="
				+ targets + ", choices=" + choices + ", rem=" + rem + ", time="
				+ time + ", noticed=" + noticed + ", userName=" + userName
				+ ", phone=" + phone + ", wholeName=" + wholeName + "]";
	}
	
}
