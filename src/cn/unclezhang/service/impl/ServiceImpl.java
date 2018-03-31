package cn.unclezhang.service.impl;

import java.math.BigInteger;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import cn.lrxzl.lib.java.tool.Tool;
import cn.unclezhang.bean.Notice;
import cn.unclezhang.bean.Reply;
import cn.unclezhang.bean.Report;
import cn.unclezhang.bean.User;
import cn.unclezhang.conf.Conf;
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
			, String[] items, String choices, String rem, String time, String scope) {
		try {
			Report r = new Report();
			r.setUserId(userId);
			r.setType(type);
			r.setChoices(choices);
			r.setItems(items);
			r.setTargets(targets);
			r.setRem(rem);
			r.setTime(time);
			r.setScope(scope);
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
	public List<Report> loadReportsByDate(String type, String time) {
		time = time.length()>10?time.substring(0,10):time;
		try {
			System.out.println(time);
			return dao.findByHql("from Report where type=? and locate(?, time)>0"
					, new Object[]{type, time});
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
		if (notice == null || Conf.notice_回复.equals(type)) {
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
			System.out.println(userId);
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
		/*try {
			Notice notice = dao.findOneByHql("from Notice where ref=?", new Object[]{ref});
			if(notice.getReadIds()==null || "".equals(notice.getReadIds())
					|| notice.getReadIds().contains(userId) == false) {
				notice.setReadIds(notice.getReadIds() + "," + userId);
				dao.updateEntity(notice);
			}
		} catch (Exception e) {
			//e.printStackTrace();
			System.out.println("read notice exception but never mind.");
		}*/
		try {
			System.out.println(userId + " read notice " + ref);
			dao.updateBySql("update notice_tb set readIds=concat(ifnull(readIds, ''),',',?)"
					+ " where ref=? and (readIds is NULL or locate(?, readIds)<1)"
					+ " and locate(?, targetIds)>0 and type=?"
					, new Object[]{userId, ref, userId, userId, type});
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
	public List<String> loadHistoryColors() {
		try {
			List<String> li = dao.findBySql("select concat(time,'=',(locate('0', choices)>0 or locate('2', choices)>0 or locate('3', choices)>0 or locate('4', choices)>0 or locate('5', choices)>0))"
					+ " from report_tb");
			return li;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
