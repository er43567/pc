package cn.unclezhang.relatives;

import java.util.ArrayList;
import java.util.List;

public class Unit {
	String name;
	List<Unit> sons;
	List<Unit> parents;
	List<Person> persons;
	
	public Unit(Unit parent, String name) {
		this.name = name;
		sons = new ArrayList<Unit>();
		parents = new ArrayList<Unit>();
		persons = new ArrayList<Person>();
		addParent(parent);
		if (parent != null)
			parent.addSon(this);
	}
	
	public Unit getParent(String unitName) {
		if (parents == null) {
			return null;
		}
		for (int i = 0; i < parents.size(); i++) {
			if (unitName.equals(parents.get(i).name)) {
				return parents.get(i);
			}
		}
		return null;
	}
	
	public String getPersonIds() {
		if (persons == null) {
			return null;
		}
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < persons.size(); i++) {
			sb.append("," + persons.get(i).name);
		}
		return sb.toString();
	}
	
	public void addSon(Unit e) {
		sons.add(e);
	}
	
	public void addParent(Unit e) {
		parents.add(e);
	}
	
	public void addPerson(Person e) {
		persons.add(e);
	}
	
	public Person getPerson(String userId) {
		for (int i = 0; i < persons.size(); i++) {
			if (persons.get(i).userId.equals(userId)) {
				return persons.get(i);
			}
		}
		return null;
	}
	
	public List<Unit> dfsSonUnits() {
		return Relatives.getSons(this);
	}
	
	public List<Unit> dfsParentUnits() {
		return Relatives.getParents(this);
	}
	
	public Unit searchUnitByUserId(String userId) {
		List<Unit> li = dfsSonUnits();
		if (li == null) {
			return null;
		}
		for (int i = 0; i < li.size(); i++) {
			if(li.get(i).getPerson(userId)!=null) {
				return li.get(i);
			}
		}
		return null;
	}
	
	public Unit searchUnitByUnitName(String name) {
		List<Unit> li = dfsSonUnits();
		if (li == null) {
			return null;
		}
		for (int i = 0; i < li.size(); i++) {
			if(li.get(i).name.equals(name)) {
				return li.get(i);
			}
		}
		return null;
	}
	
	public String getName() {
		return name;
	}
	
	@Override
	public String toString() {
		return name;
	}
}
