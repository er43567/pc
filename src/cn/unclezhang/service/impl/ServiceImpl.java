package cn.unclezhang.service.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.http.util.TextUtils;

import cn.lrxzl.lib.java.tool.Tool;
import cn.lrxzl.ssh_base.support.MyActionSupport.ISessionUserReceivable;
import cn.unclezhang.bean.Goods;
import cn.unclezhang.bean.Notice;
import cn.unclezhang.bean.Problem;
import cn.unclezhang.bean.Reply;
import cn.unclezhang.bean.Report;
import cn.unclezhang.bean.Task;
import cn.unclezhang.bean.User;
import cn.unclezhang.conf.Conf;
import cn.unclezhang.dao.IDao;
import cn.unclezhang.relatives.RelativeHelper;
import cn.unclezhang.relatives.Relatives;
import cn.unclezhang.service.IService;

public class ServiceImpl implements IService {
	private IDao dao;
	public void setDao(IDao dao) {
		this.dao = dao;
	}
	
	User user;
	@Override
	public void receiveSessionUser(User user) {
		this.user = user;
	}
	
	@Override
	public boolean updateUserFiled(String userId, String field, String value) {
		try {
			field = StringEscapeUtils.escapeSql(field);
			dao.updateBySql("update user_tb set " + field + "=? where userId=?" 
					, new Object[]{ value, userId});
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<User> loadAllUsers(boolean optimized) {
		try {
			List<User> li = dao.findByHql("from User");
			if(optimized) {
				for (int i = 0; i < li.size(); i++) {
					li.get(i).setHeadImg("");
				}
			}
			return li;
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
			, String[] items, String choices, String rem, String time
			, String scope, String imgs, String checkedUnit) {
		try {
			Report r = new Report();
			r.setUserId(userId);
			r.setType(type);
			r.setUnit(user.getUnit());
			r.setChoices(choices);
			r.setItems(items);
			r.setImgs(imgs);
			r.setCheckedUnit(checkedUnit);
			
			RelativeHelper rh = new RelativeHelper(dao, this);
			targets = rh.getReportNoticeUserIds(user.getUnit());
			r.setTargets(targets);
			
			r.setRem(rem);
			r.setTime(time);
			r.setScope(scope);
			r.setChoices0(choices);
			int sid = (Integer) dao.saveEntity(r);
			
			/**
			 * 推送
			 */
			if(targets!=null) {
				//去掉自己
				targets.replace("," + user.getUserId(), "");
			}
			saveNotice(userId, sid, type, targets, "", "", Notice.important_normal);
			
			return sid;
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
	public List<Report> loadUnitDateReports(String type, String time, String unitName) {
		time = time.length()>10?time.substring(0,10):time;
		try {
			System.out.println(time);
			
			return dao.findByHql("from Report where type=? and locate(?, time)>0 and unit=?"
					, new Object[]{type, time, unitName});
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String saveNotice(String userId, int ref, String type, String targetIds,
			String title, String content, int impts) {
		Notice notice = null;
		try {
			notice = dao.findOneByHql("from Notice where ref=? and type=?"
					, new Object[]{ref,type});
			System.out.println("found "+ ref + ":" + notice);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		/**
		 * 如果是回复类型，则添加回复Notice
		 * 如果不是回复类型，则更新Notice
		 */
		if (notice == null || Notice.notice_回复.equals(type)) {
			notice = new Notice();
			notice.setRef(ref);
			notice.setUserId(userId);
			notice.setType(type);
			notice.setTargetIds(targetIds);
			notice.setTitle(title);
			notice.setContent(content);
			notice.setImpts(impts);
			notice.setTime(Tool.time());
			try {
				return dao.saveEntity(notice) + "";
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("exist");
			//notice.setTargetIds(targetIds);
			notice.setTitle(title);
			notice.setContent(content);
			notice.setImpts(impts);
			//notice.setReadIds("");//清空已阅读人员名单
			/**
			 * 添加targetIds 
			 */
			if (notice.getTargetIds()==null || "".equals(notice.getTargetIds())) {
				notice.setTargetIds(targetIds);
			} else if (targetIds.contains("##")) {
				String ids[] = targetIds.split("##")[1].split(",");
				for (int i = 0; i < ids.length; i++) {
					if (notice.getTargetIds().contains(ids[i]) == false) {
						notice.setTargetIds(notice.getTargetIds() + "," + ids[i]);
					}
				}
			} else {
				System.out.println("What Happend?");
			}
			
			try {
				dao.updateEntity(notice);
				return notice.getSid() + "";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "fail";
	}
	
	@Override
	public int loadNoticeCount(String userId) {
		try {
			List<BigInteger> li = dao.findBySql("select count(*) from notice_tb"
					+ " where locate(?, targetIds)>0 and (readIds is null or locate(?, readIds)=0)"
					, new Object[]{userId, userId});
			if (li == null)
				return 0;
			return li.get(0).intValue();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Notice> loadNoticeList(String userId, int from_id, int len, int readState) {
		try {
			List<Notice> li = dao.findByHql("from Notice where locate(?, targetIds)>0 and locate(?, ifnull(readIds,''))"+(readState==1?">":"<=")+"0 order by sid desc"
					, new Object[]{userId, userId}, from_id, len);
			/*Collections.sort(li, new Comparator<Notice>() {
				@Override
				public int compare(Notice o1, Notice o2) {
					return o1.getReadState() - o2.getReadState();
				}
			});*/
			return li;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	

	@Override
	public Report findReportById(int sid) {
		try {
			return dao.findOneByHql("from Report where sid=?", new Object[]{sid});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	@Override
	public void readNotice(int ref, String userId, String type) {
		try {
			System.out.println("notice read " + ref + "," + userId + "," + type);
			if (ref == -1) {
				//for Task
				dao.updateBySql("update notice_tb set readIds=concat(ifnull(readIds, ''),',',?)"
						+ " where (readIds is NULL or locate(?, readIds)<1)"
						+ " and locate(?, targetIds)>0 and type=?"
						, new Object[]{userId, userId, userId, type});
			} else {
				//else
				dao.updateBySql("update notice_tb set readIds=concat(ifnull(readIds, ''),',',?)"
						+ " where ref=? and (readIds is NULL or locate(?, readIds)<1)"
						+ " and locate(?, targetIds)>0 and type=?"
						, new Object[]{userId, ref, userId, userId, type});
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 

	@Override
	public User findUserById(String userId) {
		try {
			return dao.findOneByHql("from User where userId=?", new Object[]{userId});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean saveReply(int ref, String userId, String targetId, String content) {
		Reply reply = new Reply();
		reply.setRef(ref);
		reply.setUserId(userId);
		reply.setTargetId(targetId);
		reply.setContent(content);
		reply.setTime(Tool.time());
		reply.setState(0);
		try {
			dao.saveEntity(reply);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public List<Reply> loadReplies(int ref, String whoLoad, int from_id, int len) {
		try {
			List<Reply> li = dao.findByHql("from Reply where ref=?"
					, new Object[]{ref}
					, from_id, len);
			/*dao.updateBySql("update notice_tb set readIds=? where ref=? and locate(?, targetIds)>0"
					, new Object[]{ref, whoLoad});*/
			return li;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<String> loadHistoryColors(String unit) {
		try {
			/**
			 * 当所有为1的时候 则为绿色
			 * 当含有2 3 4 5 6 ...的时候 则为红色
			 * 
			 * 如果红色解决，则为橙色
			 * 如果绿色未被安全员确认 则为蓝色
			 * 
			 * 1:green
			 * 2:red
			 * 3:orange
			 * 4:blue
			 */
			String choicesStateSql = "if(replace(choices,'1','')='', if(softerConfirm, 1, 4), if((select count(ptb.state)>0 from problem_tb ptb where ptb.ref=rtb.sid and ptb.state!='finished'), 2, 3))";
			List<String> li = dao.findBySql("select concat(time,'=',"+choicesStateSql+")"
					+ " from report_tb rtb where unit=?", new Object[]{unit});
			System.out.println("===>" + Arrays.toString(li.toArray()));
			return li;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public String loadTypeStates(String date, String unitName) {
		date = date.substring(0, 10);
		try {
			//String choicesStateSql = "(locate('0', choices)>0 or locate('2', choices)>0 or locate('3', choices)>0 or locate('4', choices)>0 or locate('5', choices)>0 or locate('6', choices)>0)";
			String choicesStateSql = "if(replace(choices,'1','')='', if(softerConfirm, 1, 4), if((select count(ptb.state)>0 from problem_tb ptb where ptb.ref=rtb.sid and ptb.state!='finished'), 2, 3))";
			List<Object[]> li;
			if (unitName == null) {
				li = dao.findBySql("select type, "+choicesStateSql+" from report_tb rtb where time=?"
						, new Object[]{date});
			} else {
				li = dao.findBySql("select type, "+choicesStateSql+" from report_tb rtb where time=? and unit=?"
						, new Object[]{date, unitName});
			}
			String typeStates = "";
			for (int i = 0; i < li.size(); i++) {
				typeStates += li.get(i)[0] + "=" + li.get(i)[1]+";";
			}
			System.out.println("[" + date + "]" + typeStates);
			return typeStates;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int saveTask(String title, String content, String targetIds, int impt) {
		Task task = new Task();
		task.setUserId(user.getUserId());
		task.setTime(Tool.time());
		task.setContent(content);
		task.setTitle(title);
		task.setTargetIds(targetIds);
		task.setImpt(impt);
		task.setScope(user.getScope());
		try {
			return (Integer) dao.saveEntity(task);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	@Override
	public Task loadLatestTask() {
		try {
			return dao.findOneByHql("from Task where locate(?, targetIds)>0 order by sid desc"
					, new Object[]{user.getUserId()});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<Task> loadTasks(int from_id, int len) {
		try {
			List<Task> li = dao.findByHql("from Task where locate(?, targetIds)>0 order by sid desc"
					, new Object[]{user.getUserId()}, from_id, len);
			RelativeHelper rh = new RelativeHelper(dao, this);
			for (Task t : li) {
				t.setTargetNames(rh.getUserNamesByUserIds(t.getTargetIds()));
			}
			return li;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<User> loadReportRelativedUsers() {
		try {
			RelativeHelper rh = new RelativeHelper(dao, this);
			String userIds = rh.getReportCheckableUserIds(user.getUnit());
			System.out.println(user.getUnit() + ":" + userIds);
			if (userIds!=null) {
				if (userIds.startsWith(",")) {
					userIds = userIds.substring(1);
				}
				String uids[] = userIds.split(",");
				StringBuilder hql = new StringBuilder("from User where userId=?");
				for (int i = 1; i < uids.length; i++) {
					hql.append(" or userId=?");
				}
				return dao.findByHql(hql.toString(), uids);
			}
			//return dao.findByHql("from User where rank<=?", new Object[]{rank});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean firstUpdateAndNoticeProblem(int sid, int risk
			, String measure, String expire, String functionary) {
		
		Problem p = loadProblem(sid);
		p.setSid(sid);
		p.setRisk(risk);
		p.setUserId(user.getUserId());
		p.setMeasure(measure);
		p.setExpire(expire);
		p.setFunctionary(functionary);
		p.setTime(Tool.time());
		p.setState(Problem.STATE_DEALING);
		
		RelativeHelper rh = new RelativeHelper(dao, this);
		//rh.getProblemNoticeUserIds(user.getRank(), user.getUnit())
		try {
			Report report = dao.findOneByHql("from Report where sid=?", new Object[]{p.getRef()});
			String checkedUnit = report.getCheckedUnit();
			if (risk == 1) {
				checkedUnit = null;
			}
			p.setTargetIds(rh.getProblemTargetIdsByRisk(risk, report.getUnit(), checkedUnit, report.getUserId()));
			dao.updateEntity(p);
			//推送
			saveNotice(user.getUserId(), p.getRef(), Notice.TYPE_PROBLEM
					, p.getTargetIds() + "," + p.getFunctionary()
					, "", "", Notice.important_important);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Problem loadProblem(int ref, int whichItem) {
		try {
			return dao.findOneByHql("from Problem where ref=? and whichItem=?"
					, new Object[]{ref, whichItem});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public Problem loadProblem(int sid) {
		try {
			Problem p = dao.findOneByHql("from Problem where sid=?"
					, new Object[]{sid});
			readNotice(p.getSid(), user.getUserId(), Notice.TYPE_PROBLEM);
			
			RelativeHelper rh = new RelativeHelper(dao, this);
			//注入用户名字
			p.setAcceptedUserName(rh.getUserNamesByUserIds(p.getAcceptedIds()));
			p.setAcceptingUserName(rh.getUserNamesByUserIds(p.getTargetIds()));
			p.setFunctionaryName(rh.getUserNamesByUserIds(p.getFunctionary()));
			
			if (p.getAcceptedUserName()==null) {
				p.setAcceptedUserName("");
			}
			if (p.getAcceptingUserName()==null) {
				p.setAcceptingUserName("");
			}
			if (p.getFunctionaryName()==null) {
				p.setFunctionaryName("");
			}
			
			p.setAcceptedUserName(p.getAcceptedUserName().replaceAll(",", " ").trim());
			p.setAcceptingUserName(p.getAcceptingUserName().replaceAll(",", " ").trim());
			p.setFunctionaryName(p.getFunctionaryName().replaceAll(",", " ").trim());
			
			return p;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public List<Problem> loadProblemsByRef(int ref, String userId) {
		try {
			//edit 2018/4/20 11.56
			/*List<Problem> li = dao.findByHql("from Problem where ref=? and userId=? order by sid desc"
					, new Object[]{ref, userId});*/
			List<Problem> li = dao.findByHql("from Problem where ref=? order by sid desc"
					, new Object[]{ref});
			return li;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Problem> createProblems(int ref, String choices, String items[]) {
		try {
			List<Problem> li = new ArrayList<Problem>();
			for (int i = 0; i < choices.length(); i++) {
				char c = choices.charAt(i);
				if (c != '1') {
					Problem p = new Problem();
					p.setRef(ref);
					p.setUserId(user.getUserId());
					p.setTime(Tool.time());
					p.setChoices(choices);
					p.setWhichItem(i);
					p.setRem(items[i]);//,,,,, 从第1个开始
					p.setState(Problem.STATE_INITIAL);
					dao.saveEntity(p);
					li.add(p);
				}
			}
			return li;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean updateProblemFiled(int sid, String field, String value) {
		try {
			dao.updateBySql("update problem_tb set "+field+"=? where sid=?"
					, new Object[]{value, sid});
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Problem> loadMyProblemList() {
		try {
			return dao.findByHql("from Problem where (userId=? or locate(?, targetIds)>0) and state!='finished' order by sid desc"
					, new Object[]{user.getUserId(), user.getUserId()});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<Problem> loadMyFinishedProblemList() {
		try {
			return dao.findByHql("from Problem where (userId=? or locate(?, targetIds)>0) and state='finished' order by sid desc"
					, new Object[]{user.getUserId(), user.getUserId()});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int saveGoods(String userId, Goods goods) {
		goods.setUnit(user.getUnit());
		goods.setTime(Tool.time());
		if (goods.getConfirms1() == null) {
			goods.setConfirms1("");
		}if (goods.getConfirms2() == null) {
			goods.setConfirms2("");
		}if (goods.getConfirms3() == null) {
			goods.setConfirms3("");
		}
		try {
			int n = (Integer) dao.saveEntity(goods);
			return n;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public List<Goods> loadGoodsList(String unit, int from_id, int len) {
		try {
			return dao.findByHql("from Goods where unit=? order by sid desc"
					, new Object[]{unit}, from_id, len);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Goods loadGoodsById(int sid) {
		try {
			RelativeHelper rh = new RelativeHelper(dao, this);
			Goods g = dao.findOneByHql("from Goods where sid=?", new Object[]{sid});
			
			g.setConfirmNames1(rh.getUserNamesByUserIds(g.getConfirms1()));
			g.setConfirmNames2(rh.getUserNamesByUserIds(g.getConfirms2()));
			g.setConfirmNames3(rh.getUserNamesByUserIds(g.getConfirms3()));
			
			if (g.getConfirmNames1()!=null)
				g.setConfirmNames1(g.getConfirmNames1().replaceAll(",", " "));
			if (g.getConfirmNames2()!=null)
				g.setConfirmNames2(g.getConfirmNames2().replaceAll(",", " "));
			if (g.getConfirmNames3()!=null)
				g.setConfirmNames3(g.getConfirmNames3().replaceAll(",", " "));
			
			return g;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public List<User> loadTaskTargetsUsers() {
		RelativeHelper rh = new RelativeHelper(dao, this);
		try {
			String userids = rh.getTaskChooseUsers(user.getUnit());
			return dao.findByHql("from User where rank<=? and locate(userId, '"+userids+"')>0"
						, new Object[]{user.getRank()});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean updateProblemReform(int sid, String reform) {
		try {
			dao.updateBySql("update problem_tb set reform=? where sid=?"
						, new Object[]{reform, sid});
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean confirmGoods(String userId, int sid, int type) {
		Goods goods = loadGoodsById(sid);
		switch (type) {
		case 1:
			goods.setConfirms1(goods.getConfirms1() + " " + userId);
			
			break;
		case 2:
			goods.setConfirms2(goods.getConfirms2() + " " + userId);
			
			break;
		case 3:
			goods.setConfirms3(goods.getConfirms3() + " " + userId);
			
			break;
		}
		
		try {
			dao.updateEntity(goods);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean softerConfirm(String userId, int sid) {
		try {
			dao.updateBySql("update report_tb set softerConfirm=1 where sid=?", new Object[]{sid});
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<String> loadLoopCtrlUnitList(String unit, int rank) {
		try {
			List<String> li = null;
			if (rank == 2) {
				li = dao.findBySql("select unit from user_tb where rank=1 and parentUnit=? group by unit"
						, new Object[]{unit});
			} else if (rank == 3 || rank == 4) {
				li = dao.findBySql("select unit from user_tb where rank=1 group by unit");
			}
			return li;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean updateGoods(int sid, int todayGained, int todayUse, int todayReturn) {
		Goods g = loadGoodsById(sid);
		
		g.setTodayGained(todayGained);
		g.setTodayUse(todayUse);
		g.setTodayReturn(todayReturn);
		
		try {
			dao.updateEntity(g);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Report loadReportById(int sid) {
		try {
			return dao.findOneByHql("from Report where sid=?", new Object[]{sid});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Problem> loadMyRelativeUnitsProblemList(boolean wasFinished, String unit, int from_id, int len) {
		/*RelativeHelper rh = new RelativeHelper(dao, this);
		String uids = rh.getUserIdsByUnitNames(-1, relativeUnits);*/
		String relativeUnits[] = RelativeHelper.getRelativeUnits(unit);
		List<Problem> li;
		try {
			/*if (wasFinished) {
				li = dao.findByHql("from Problem where locate(userId, ?)>0 and state='finished' order by sid desc"
						, new Object[]{uids}, from_id, len);
				
			} else {
				li = dao.findByHql("from Problem where locate(userId, ?)>0 and state!='finished' order by sid desc"
						, new Object[]{uids}, from_id, len);
			}*/
			if (wasFinished) {
				li = dao.findByHql("from Problem where locate(unit, ?)>0 and state='finished' order by sid desc"
						, new Object[]{Arrays.toString(relativeUnits)}, from_id, len);
			} else {
				li = dao.findByHql("from Problem where locate(unit, ?)>0 and state!='finished' order by sid desc"
						, new Object[]{Arrays.toString(relativeUnits)}, from_id, len);
			}
			return li;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
