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
			, String[] items, String choices, String rem, String time, String scope) {
		try {
			RelativeHelper rh = new RelativeHelper(dao, this);
			targets = rh.getReportNoticeUserIds(user.getUnit());
			
			Report r = new Report();
			r.setUserId(userId);
			r.setType(type);
			r.setChoices(choices);
			r.setItems(items);
			r.setTargets(targets);
			r.setRem(rem);
			r.setTime(time);
			r.setScope(scope);
			r.setChoices0(choices);
			int sid = (Integer) dao.saveEntity(r);
			
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
	public List<Report> loadReportsByDate(String type, String time, String userId) {
		time = time.length()>10?time.substring(0,10):time;
		try {
			System.out.println(time);
			if (userId == null) {
				return dao.findByHql("from Report where type=? and locate(?, time)>0"
						, new Object[]{type, time});
			} else {
				return dao.findByHql("from Report where type=? and locate(?, time)>0 and userId=?"
						, new Object[]{type, time, userId});
			}
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
	public List<String> loadHistoryColors(String userId) {
		try {
			//String choicesStateSql = "(locate('0', choices)>0 or locate('2', choices)>0 or locate('3', choices)>0 or locate('4', choices)>0 or locate('5', choices)>0 or locate('6', choices)>0)";
			String choicesStateSql = "if((locate('0', choices)>0 or locate('2', choices)>0 or locate('3', choices)>0 or locate('4', choices)>0 or locate('5', choices)>0 or locate('6', choices)>0),if((select (count(ptb.state)>0) from problem_tb ptb where ptb.ref=rtb.sid and ptb.state!='finished'),1,2),0)";
			//select concat(time,'=',if((locate('0', choices)>0 or locate('2', choices)>0 or locate('3', choices)>0 or locate('4', choices)>0 or locate('5', choices)>0),(select (count(ptb.state)>0)+1 from problem_tb ptb where ptb.ref=rtb.sid and ptb.state!='finished'),0)) from report_tb rtb where userId='a11';
			List<String> li;
			if (userId == null) {
				li = dao.findBySql("select concat(time,'=',"+choicesStateSql+")"
						+ " from report_tb rtb");
			} else {
				li = dao.findBySql("select concat(time,'=',"+choicesStateSql+")"
						+ " from report_tb rtb where userId=?", new Object[]{userId});
			}
			System.out.println(Arrays.toString(li.toArray()));
			return li;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public String loadTypeStates(String date, String userId) {
		date = date.substring(0, 10);
		try {
			//String choicesStateSql = "(locate('0', choices)>0 or locate('2', choices)>0 or locate('3', choices)>0 or locate('4', choices)>0 or locate('5', choices)>0 or locate('6', choices)>0)";
			String choicesStateSql = "if((locate('0', choices)>0 or locate('2', choices)>0 or locate('3', choices)>0 or locate('4', choices)>0 or locate('5', choices)>0 or locate('6', choices)>0),if((select (count(ptb.state)>0) from problem_tb ptb where ptb.ref=rtb.sid and ptb.state!='finished'),1,2),0)";
			List<Object[]> li;
			if (userId == null) {
				li = dao.findBySql("select type, "+choicesStateSql+" from report_tb rtb where time=?"
						, new Object[]{date});
			} else {
				li = dao.findBySql("select type, "+choicesStateSql+" from report_tb rtb where time=? and userId=?"
						, new Object[]{date, userId});
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
			return dao.findOneByHql("from Task order by sid desc");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<Task> loadTasks(int from_id, int len) {
		try {
			return dao.findByHql("from Task order by sid desc", from_id, len);
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
		
		try {
			p.setTargetIds(rh.getProblemNoticeUserIds(user.getRank(), user.getUnit()));
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
			
			return p;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public List<Problem> loadProblemsByRef(int ref) {
		try {
			List<Problem> li = dao.findByHql("from Problem where ref=?"
					, new Object[]{ref});
			return li;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Problem> createProblems(int ref, String choices) {
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
			return dao.findByHql("from Problem where (userId=? or locate(?, targetIds)>0) and state='dealing'"
					, new Object[]{user.getUserId(), user.getUserId()});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void saveGoods(Goods goods) {
		//goods.setTime(Tool.time());
		try {
			dao.saveEntity(goods);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<Goods> loadAllGoods() {
		try {
			return dao.findByHql("from Goods order by time desc");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
