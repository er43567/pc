package cn.unclezhang.relatives;

public class Person {
	public String userId;
	public String name;
	public String phone;
	public String position;
	public String scope;
	public int rank;
	public Unit unit;
	
	public Person(Unit unit, String userId, String name, String phone, String position,
			String scope, int rank) {
		this.unit = unit;
		this.userId = userId;
		this.name = name;
		this.phone = phone;
		this.position = position;
		this.scope = scope;
		this.rank = rank;
		unit.addPerson(this);
	}

	@Override
	public String toString() {
		return "Person [userId=" + userId + "]";
	}
}
