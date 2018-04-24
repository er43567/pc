package cn.lrxzl.unclezhang.servlet;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import cn.lrxzl.lib.java.tool.Tool;
import cn.lrxzl.ssh_base.support.SessionFac;
import cn.lrxzl.unclezhang.servlet.WarningService.Warning;

public class PreloadListener implements ServletContextListener {
	
	static WarningService ws;
	
	@Override
	public void contextInitialized(ServletContextEvent e) {
		System.out.println("======= Start Warning Service ======");
		new Timer().schedule(new TimerTask() {
			@Override
			public void run() {
				System.out.println("=======启动预警模块======");
				ws = new WarningService();
				//SessionFac.initSessionFactory();
				try {
					/*List<String> dayUserList = SessionFac.findBySql("select userId from user_tb where rank=1", null, 0, 0);
					List<String> dayReportList = SessionFac.findBySql("select userId from report_tb where locate(time,now())>0", null, 0, 0);
					
					List<String> sundayUserList = SessionFac.findBySql("select userId from user_tb where rank=2", null, 0, 0);
					List<String> sundayReportList = SessionFac.findBySql("select userId from report_tb where time>=? and time<=?"
							, new Object[]{ws.nextNDay(ws.nextSunday(Tool.time()), -7), ws.nextSunday(Tool.time())}, 0, 0);
					
					List<String> halfmonthUserList = SessionFac.findBySql("", null, 0, 0);
					List<String> halfmonthReportList = SessionFac.findBySql("", null, 0, 0);*/
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (ws == null) {
					ws.setWarning(new Warning() {
						@Override
						public void onSundayWarning(String nextDate) {
						}
						@Override
						public void onHalfMonthWarning(String nextDate) {
							
						}
						@Override
						public void onDayWarning(String nextDate) {
							
						}
					});
					ws.active();
				}
			}
		}, 1000);
	}
	
	public String nextNDay(String date, int n) throws ParseException {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		cal.setTime(sdf.parse(date));
		cal.add(java.util.Calendar.DAY_OF_MONTH, n);
		String resultTime = sdf.format(cal.getTime());
		return resultTime;
	}
	
	public static void main(String[] args) throws ParseException {
		ws = new WarningService();
		System.out.println(ws.nextNDay(ws.nextSunday(Tool.time().substring(0, 10)+" "+ws.pm_time), -7)+","+ ws.nextSunday(Tool.time().substring(0, 10)+" "+ws.pm_time));
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}
	
}
