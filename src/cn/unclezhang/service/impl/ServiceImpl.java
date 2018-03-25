package cn.unclezhang.service.impl;

import java.util.List;

import cn.lrxzl.lib.java.tool.Tool;
import cn.unclezhang.bean.Notice;
import cn.unclezhang.bean.Report;
import cn.unclezhang.bean.User;
import cn.unclezhang.dao.IDao;
import cn.unclezhang.service.IService;

public class ServiceImpl implements IService {
	private IDao dao;
	public void setDao(IDao dao) {
		this.dao = dao;
	}
	
	@Override
	public void updateUserFiled(String userId, String field, String value) {
		try {
			dao.updateBySql("update user_tb set " + field + "=? where userId=?"
					, new Object[]{ value, userId});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<User> loadAllUsers() {
		try {
			return dao.findByHql("from User");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/*@Override
	public void saveReport(String userId, String type, String targets,
			String[] items, String rem) {
		Report r = new Report();
		try {
			r.setUserId(userId);
			r.setType(type);
			r.setItems(items);
			r.setTargets(targets);
			r.setRem(rem);
			r.setTime(Tool.time());
			dao.saveEntity(r);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/

	@Override
	public int saveReport(String userId, String type, String targets
			, String[] items, String choices, String rem) {
		try {
			Report r = new Report();
			r.setUserId(userId);
			r.setType(type);
			r.setChoices(choices);
			r.setItems(items);
			r.setTargets(targets);
			r.setRem(rem);
			r.setTime(Tool.time());
			return (Integer) dao.saveEntity(r);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	@Override
	public Report findTypeReportByDate(String type, String date) {
		try {
			date = date.length()>10?date.substring(0,10):date;
			return dao.findOneByHql("from Report where type=? and locate(?, time)>=1"
					,new Object[]{type, date});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void updateReport(int sid, String userId, String targets,
			String[] items, String choices, String rem) {
		try {
			Report r = findReport(sid);
			r.setTargets(targets);
			r.setItems(items);
			r.setChoices(choices);
			r.setRem(rem);
			dao.updateEntity(r);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Report findReport(int id) throws Exception {
		return dao.findOneByHql("from Report where sid=?", new Object[]{id});
	}

	@Override
	public List<Report> loadReportsByDate(String time) {
		time = time.length()>10?time.substring(0,10):time;
		try {
			return dao.findByHql("from Report where locate(?, time)", new Object[]{time});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void savePush(String userId, String type, String targetIds,
			String title, String content, int impts) {
		Notice notice = new Notice();
		notice.setUserId(userId);
		notice.setType(type);
		notice.setTargetIds(targetIds);
		notice.setTitle(title);
		notice.setContent(content);
		notice.setImpts(impts);
		notice.setTime(Tool.time());
		try {
			dao.saveEntity(notice);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
