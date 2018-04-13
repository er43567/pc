package cn.unclezhang.service;

import java.util.List;
import java.util.Map;

import cn.lrxzl.ssh_base.support.MyActionSupport.ISessionUserReceivable;
import cn.unclezhang.bean.Goods;
import cn.unclezhang.bean.Notice;
import cn.unclezhang.bean.Problem;
import cn.unclezhang.bean.Reply;
import cn.unclezhang.bean.Report;
import cn.unclezhang.bean.Task;
import cn.unclezhang.bean.User;

public interface IService extends ISessionUserReceivable {
	boolean updateUserFiled(String userId, String field, String value);

	List<User> loadAllUsers(boolean optimized);
	
	int saveReport(String userId, String type, String targets, 
			String[] items, String choices, String rem, String time, String scope, String imgs);

	Report findTypeReportByDate(String type, String date);

	void updateReport(int sid, String userId, String targets,
			String[] items, String choices, String rem);

	/**
	 * @param type
	 * @param time
	 * @param userId 可为null，为null时加载全部
	 * @return
	 */
	List<Report> loadUnitDateReports(String type, String time, String unitName);

	String saveNotice(String userId, int ref, String type, String targetIds, String title,
			String content, int impts);

	int loadNoticeCount(String userId);

	List<Notice> loadNoticeList(String userId, int from_id, int count_per_page, int readState);

	Report findReportById(int sid);
	
	void readNotice(int ref, String userId, String type);

	User findUserById(String userId);

	boolean saveReply(int ref, String userId, String targetId, String content);

	List<Reply> loadReplies(int ref, String whoLoad, int from_id, int len);

	/**
	 * @param userId Nullable, load whole data while null
	 * @return
	 */
	List<String> loadHistoryColors(String userId);
	/**
	 * @param date
	 * @param userId 可为null，为null时加载所有的
	 * @return
	 */
	String loadTypeStates(String date, String userId);

	int saveTask(String title, String content, String targetIds, int impt);

	Task loadLatestTask();
	
	List<Task> loadTasks(int from_id, int len);

	List<User> loadReportRelativedUsers();

	/*void updateAndNoticeProblem(String sessionUserId, int sid, int risk
			, int ref, int whichItem, String measure,
			String expire, String targetIds, String functionary);*/
	boolean firstUpdateAndNoticeProblem(int sid, int risk,
			String measure, String expire, String functionary);
	
	Problem loadProblem(int ref, int whichItem);

	List<Problem> loadProblemsByRef(int ref, String userId);
	
	List<Problem> createProblems(int ref, String choices, String[] items);

	boolean updateProblemFiled(int sid, String field, String value);

	Problem loadProblem(int sid);
	
	List<Problem> loadMyProblemList();

	int saveGoods(String userId, Goods goods);

	List<Goods> loadGoodsList(int from_id, int len);

}
