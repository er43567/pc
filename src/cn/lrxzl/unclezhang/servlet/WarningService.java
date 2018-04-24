package cn.lrxzl.unclezhang.servlet;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import cn.lrxzl.lib.java.tool.Tool;

public class WarningService {
	
	boolean running = false;
	
	String am_time = "00:00";
	String pm_time = "17:00";
	
	String nextDayDate = Tool.time().substring(0, 10) + " " + pm_time;
	String nextSundayDate = Tool.time().substring(0, 10) + " " + pm_time;
	String nextHalfMonth = Tool.time().substring(0, 10) + " " + am_time;
	
	String prevDayDate;
	String prevSundayDate;
	String prevHalfMonth;
	
	public void active() {
		if (running) return;
		try {
			nextDayDate = nextNDay(nextDayDate, 0);
			nextSundayDate = nextSunday(nextSundayDate);
			nextHalfMonth = nextHalfMonth(nextHalfMonth);
			System.out.println(nextDayDate);
			System.out.println(nextSundayDate);
			System.out.println(nextHalfMonth);
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("========Timer Start Error=======");
		}
		
		Timer timer = new Timer("TimerTask");
		timer.schedule(new TimerTask() {
            @Override
            public void run() {
            	if(warning == null) return;
            	
            	String now = Tool.time();
            	
            	if(!nextDayDate.equals(prevDayDate) && now.startsWith(nextDayDate)) {
            		prevDayDate = nextDayDate;
            		try {
						nextDayDate = nextNDay(nextDayDate, 1);
						warning.onDayWarning(nextDayDate);
						System.out.println("NextDayIs:" + nextDayDate);
					} catch (ParseException e) {
						e.printStackTrace();
						//System.out.println("NextDayIs: ERROR");
					}
            	}
            	
            	if(!nextSundayDate.equals(prevSundayDate) && now.startsWith(nextSundayDate)) {
            		prevSundayDate = nextSundayDate;
            		try {
						nextSundayDate = nextSunday(nextSundayDate);
						warning.onSundayWarning(nextSundayDate);
						System.out.println("NextSundayIs:" + nextSundayDate);
					} catch (ParseException e) {
						e.printStackTrace();
						//System.out.println("NextSundayIs: ERROR");
					}
            	}
            	
            	if(!nextHalfMonth.equals(prevHalfMonth) && now.startsWith(nextHalfMonth)) {
            		prevHalfMonth = nextHalfMonth;
            		try {
            			nextHalfMonth = nextSunday(nextHalfMonth);
						warning.onHalfMonthWarning(nextHalfMonth);
						System.out.println("nextHalfMonthIs:" + nextHalfMonth);
					} catch (ParseException e) {
						e.printStackTrace();
						//System.out.println("nextHalfMonthIs: ERROR");
					}
            	}
            }
        } ,1000, 1000 );
		
		running = true;
	}
	
	public static void main(String[] args) throws ParseException, InterruptedException {
		WarningService ws = new WarningService();
		ws.setWarning(new Warning() {
			@Override
			public void onSundayWarning(String nextDate) {}
			@Override
			public void onHalfMonthWarning(String nextDate) {}
			@Override
			public void onDayWarning(String nextDate) {
				System.out.println("==============onDayWarning==============");
			}
		});
		ws.active();
		//System.out.println(nextSunday("2018-04-21 15:23"));
	}
	
	public String nextNDay(String date, int n) throws ParseException {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		cal.setTime(sdf.parse(date));
		cal.add(java.util.Calendar.DAY_OF_MONTH, n);
		String resultTime = sdf.format(cal.getTime());
		return resultTime;
	}
	
	public String nextSunday(String date) throws ParseException {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		cal.setTime(sdf.parse(date));
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		return nextNDay(date, 7-dayOfWeek+1);
	}
	
	public String nextHalfMonth(String date) throws ParseException {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		cal.setTime(sdf.parse(date));
		int dayOfMonth = cal.get(Calendar.DAY_OF_MONTH);
		int delta_day;
		if(dayOfMonth>=15) {
			int monthDays = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			delta_day = monthDays - dayOfMonth;
		} else {
			delta_day = 15 - dayOfMonth;
		}
		return nextNDay(date, delta_day);
	}
	
	public String toDateString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = "2018-04-30 11:29:00";
		return sdf.format(time);
	}
	
	public Date toDate(String s) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.parse(s);
	}
	
	Warning warning;
	public void setWarning(Warning warning) {
		this.warning = warning;
	}
	public interface Warning {
		void onDayWarning(String nextDate);
		void onSundayWarning(String nextDate);
		void onHalfMonthWarning(String nextDate);
	}
	
}
