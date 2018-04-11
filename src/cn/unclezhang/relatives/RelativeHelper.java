package cn.unclezhang.relatives;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import cn.unclezhang.bean.User;
import cn.unclezhang.dao.IDao;
import cn.unclezhang.service.IService;

public class RelativeHelper {
	static Unit root;
	public Unit rootUnit() {
		return root;
	}
	public static synchronized Unit build(IDao dao, IService service) {
		if (root == null) {
			List<User> users;
			try {
				users = dao.findByHql("from User");
				root = Relatives.build(users);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return root;
	}

	IDao dao;
	IService service;
	
	public RelativeHelper(IDao dao, IService service) {
		this.dao = dao;
		this.service = service;
		//root = build(dao, service);
	}
	
	private String getUserIdsByUnitNames(int rank, String...unitNames) {
		StringBuilder sql = new StringBuilder("select userId from user_tb where unit=?");
		if (rank > 0) {
			sql.append(" and rank=" + rank);
		}
		for (int i = 1; i < unitNames.length; i++) {
			sql.append(" or unit=?");
		}
		StringBuilder userIds = new StringBuilder();
		try {
			List<String> li = dao.findBySql(sql.toString(), unitNames);
			for (String userId : li) {
				userIds.append("," + userId);
			}
			return userIds.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String getUserNamesByUserIds(String userIds) {
		if (userIds == null) return null;
		if (userIds.contains("##")) {
			userIds = userIds.split("##")[1];
		}
		String ids[] = userIds.split(",");
		StringBuilder sql = new StringBuilder("select name from user_tb");
		if (ids.length>0) {
			sql.append(" where userId=?");
		}
		for (int i = 1; i < ids.length; i++) {
			sql.append(" or userId=?");
		}
		System.out.println(Arrays.toString(ids));
		StringBuilder names = new StringBuilder();
		try {
			List<String> li = dao.findBySql(sql.toString(), ids);
			for (String name : li) {
				names.append("," + name);
			}
			System.out.println(names);
			return names.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void main(String[] args) {
		String s = "啊1,啊2,a4##a1,a2,a4";
		//System.out.println(Arrays.toString(s.split(",|(##)")));
		String a[] = null;
		for (String string : a) {
			System.out.println(string);
		}
	}
	
	/**
	 * 
	 * @param unitName
	 * @return
	 */
	static Map<String, String[]> relativeUnits = new HashMap<String, String[]>();
	static {
		relativeUnits.put("跃进煤矿", new String[]{"跃进煤矿","安源派出所","安源公安分局"});
		relativeUnits.put("潘家冲煤矿", new String[]{"潘家冲煤矿","安源派出所","安源公安分局"});
		relativeUnits.put("五陂煤矿", new String[]{"五陂煤矿","五陂派出所","安源公安分局"});
		relativeUnits.put("久安公司", new String[]{"久安公司","城郊派出所","安源公安分局"});
		relativeUnits.put("神威公司", new String[]{"神威公司","青山派出所","安源公安分局"});
		
		relativeUnits.put("安源派出所", new String[]{"安源派出所","跃进煤矿","潘家冲煤矿","安源公安分局"});
		relativeUnits.put("五陂派出所", new String[]{"五陂派出所","五陂煤矿","安源公安分局"});
		relativeUnits.put("城郊派出所", new String[]{"城郊派出所","久安公司","安源公安分局"});
		relativeUnits.put("青山派出所", new String[]{"青山派出所","神威公司","安源公安分局"});
		
		relativeUnits.put("安源公安分局", new String[]{"跃进煤矿","潘家冲煤矿","五陂煤矿"
				,"久安公司","神威公司","安源派出所","五陂派出所","城郊派出所","青山派出所","安源公安分局"});
	}
	
	public String getReportNoticeUserIds(String unitName) {
		return getUserIdsByUnitNames(-1, relativeUnits.get(unitName));
	}
	
	public String getProblemNoticeUserIds(int rank, String unitName) throws Exception {
		List<String> li;
		String s = "";
		String userIds = getUserIdsByUnitNames(-1, relativeUnits.get(unitName));
		switch (rank) {
		case 1:
			li = dao.findBySql("select userId from user_tb where and unit=? and position=? or position=?"
					, new Object[]{"安全员", "法人代表"});
			for (int i = 0; li!=null && i < li.size(); i++) {
				if (userIds!=null&&userIds.contains(li.get(i))) {
					s += "," + li.get(i);
				}
			}
			break;
		case 2:
			li = dao.findBySql("select userId from user_tb where and position=? or position=? or position=?"
					, new Object[]{"监管民警", "分管副所长", "所长"});
			for (int i = 0; li!=null && i < li.size(); i++) {
				if (userIds!=null&&userIds.contains(li.get(i))) {
					s += "," + li.get(i);
				}
			}
			break;
		case 3:
			li = dao.findBySql("select userId from user_tb where position=? or position=? or  position=? or position=?"
					, new Object[]{"监管民警", "分管副所长","大队长","局领导"});
			for (int i = 0; li!=null && i < li.size(); i++) {
				if (userIds!=null&&userIds.contains(li.get(i))) {
					s += "," + li.get(i);
				}
			}
			break;
		case 4:
			break;
		}
		return s;
	}
	
	public String getReportCheckableUserIds(String unitName) {
		return getUserIdsByUnitNames(-1, relativeUnits.get(unitName));
	}
	
	/*public String getReportNoticeUserIds(String unitName) {
		Unit unit = root.searchUnitByUnitName(unitName);
		List<Unit> li1 = unit.dfsParentUnits();
		List<Unit> li2 = unit.dfsSonUnits();
		StringBuilder userIds = new StringBuilder();
		if (li1 != null) {
			for (Unit tmp : li1) {
				userIds.append("," + tmp.getPersonIds());
			}
		}
		if (li2 != null) {
			for (Unit tmp : li2) {
				userIds.append("," + tmp.getPersonIds());
			}
		}
		return userIds.toString();
	}*/
	
}
