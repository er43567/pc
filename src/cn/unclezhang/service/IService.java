package cn.unclezhang.service;

import java.util.List;

import cn.unclezhang.bean.Notice;
import cn.unclezhang.bean.Reply;
import cn.unclezhang.bean.Report;
import cn.unclezhang.bean.User;

public interface IService {
	void updateUserFiled(String userId, String field, String value);

	List<User> loadAllUsers();
	
	int saveReport(String userId, String type, String targets, 
			String[] items, String choices, String rem, String time);

	Report findTypeReportByDate(String type, String date);

	void updateReport(int sid, String userId, String targets,
			String[] items, String choices, String rem);

	List<Report> loadReportsByDate(String type, String time);

	String saveNotice(String userId, int ref, String type, String targetIds, String title,
			String content, int impts);

	int loadNoticeCount(String userId);

	List<Notice> loadNoticeList(String userId, int from_id, int count_per_page);

	Report findReportById(int sid);

	void readNotice(int sid, String userId);

	User findUserById(String userId);

	boolean saveReply(int ref, String userId, String targetId, String content);

	List<Reply> loadReplies(int ref, int from_id, int len);
	
}
