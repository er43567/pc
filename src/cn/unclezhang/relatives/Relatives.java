package cn.unclezhang.relatives;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import cn.lrxzl.lib.java.tool.Tool;
import cn.unclezhang.bean.User;

public class Relatives {
	private static void dfsParents(List<Unit> li, Unit unit) {
		if (unit == null) {
			return;
		}
		if (li == null) {
			li = new ArrayList<Unit>();
		}
		for (int i = 0; i < unit.parents.size(); i++) {
			if (unit.parents.get(i) != null) {
				li.add(unit.parents.get(i));
				dfsParents(li, unit.parents.get(i));
			}
		}
	}
	
	private static void dfsSons(List<Unit> li, Unit unit) {
		if (unit == null) {
			return;
		}
		if (li == null) {
			li = new ArrayList<Unit>();
		}
		for (int i = 0; i < unit.sons.size(); i++) {
			if (unit.sons.get(i) != null) {
				li.add(unit.sons.get(i));
				dfsSons(li, unit.sons.get(i));
			}
		}
	}
	
	public static List<Unit> getParents(Unit unit) {
		List<Unit> li = new ArrayList<Unit>();
		dfsParents(li, unit);
		return li;
	}
	
	public static List<Unit> getSons(Unit unit) {
		List<Unit> li = new ArrayList<Unit>();
		dfsSons(li, unit);
		return li;
	}
	
	public static Unit getUnit(Unit root, String name) {
		if (root.name.equals(name)) {
			return root;
		}
		List<Unit> li = new ArrayList<Unit>();
		dfsSons(li, root);
		for (int i = 0; i < li.size(); i++) {
			if (li.get(i).name.equals(name)) {
				return li.get(i);
			}
		}
		return null;
	}
	
	public static Person getPerson(Unit root, String userId) {
		List<Unit> li = new ArrayList<Unit>();
		dfsSons(li, root);
		for (int i = 0; i < li.size(); i++) {
			Person tmp = li.get(i).getPerson(userId);
			if (tmp != null) {
				return tmp;
			}
		}
		return null;
	}
	
	public static void newPerson(Unit unit, String userId, String name
			, String phone, String position, String scope, int rank) {
		new Person(unit, userId, name, phone, position, scope, rank);
	}
	
	public static Unit build(List<User> users) {
		Unit root = new Unit(null, "安源公安分局");
		
		Unit u1 = new Unit(root, "安源派出所");
		Unit u11 = new Unit(u1, "跃进煤矿");
		Unit u12 = new Unit(u1, "潘家冲煤矿");
		
		Unit u2 = new Unit(root, "五陂派出所");
		Unit u21 = new Unit(u2, "五陂煤矿");
		
		Unit u3 = new Unit(root, "城郊派出所");
		Unit u31 = new Unit(u3, "久安公司");
		
		Unit u4 = new Unit(root, "青山派出所");
		Unit u41 = new Unit(u4, "久安公司");
		
		
		for (int i = 0; i < users.size(); i++) {
			User tmpUser = users.get(i);
			Unit tmpUnit = getUnit(root, tmpUser.getUnit());
			if (tmpUnit != null) {
				newPerson(tmpUnit, tmpUser.getUserId(), tmpUser.getName()
						, tmpUser.getPhone(), tmpUser.getPosition()
						, tmpUser.getScope(), tmpUser.getRank());
			}
		}
		
		Unit tmpUnit = getUnit(root, "潘家冲煤矿");
		System.out.println(Arrays.toString(tmpUnit.persons.toArray()));
		
		List<Unit> li = new ArrayList<Unit>();
		li.add(root);
		dfsSons(li, root);
		System.out.println(Arrays.toString(li.toArray()));
		
		Unit one = getUnit(root, "潘家冲煤矿");
		li = new ArrayList<Unit>();
		dfsParents(li, one);
		System.out.println(Arrays.toString(li.toArray()));
		
		return root;
	}
	
}
