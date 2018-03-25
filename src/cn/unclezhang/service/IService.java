package cn.unclezhang.service;

import java.util.List;

import cn.unclezhang.bean.Report;
import cn.unclezhang.bean.User;

public interface IService {
	void updateUserFiled(String userId, String field, String value);

	List<User> loadAllUsers();
	
	int saveReport(String userId, String type, String targets, String[] items, String choices, String rem);

	Report findTypeReportByDate(String type, String date);

	void updateReport(int sid, String userId, String targets,
			String[] items, String choices, String rem);

	List<Report> loadReportsByDate(String time);

	void savePush(String userId, String type, String targetIds, String title,
			String content, int impts);
	
}
