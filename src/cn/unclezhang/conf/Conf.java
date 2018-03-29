package cn.unclezhang.conf;

public class Conf {
	
	/*public String push_type_民爆 = "ExplosiveNotice";
	public String push_type_旅馆 = "HotalNotice";
	public String push_type_消防 = "FirefightingNotice";
	public String push_type_回复 = "ReplyNotice";
	public String push_type_任务 = "TaskNotice";*/
	
	public String report_民爆 = "ExplosiveReport";
	public String report_消防 = "FirefightingReport";
	public String report_旅馆 = "HotalReport";
	
	public String notice_民爆 = report_民爆;
	public String notice_消防 = report_消防;
	public String notice_旅馆 = report_旅馆;
	
	public static String notice_回复 = "Reply";
	
	public static final int important_normal= 0;
	public static final int important_important = 1;
	public static final int important_urgent = 2;
}
