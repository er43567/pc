package cn.unclezhang.action;

import net.sf.json.JSONObject;
import cn.lrxzl.ssh_base.support.MyActionSupport;

public class NotificationAction extends MyActionSupport {
	
	public String loadNoticeCount() {
		if (!isLogin()) {
			setResult("did not login");
			return aa;
		}
		int count = service.loadNoticeCount(getSessionUserId());
		//System.out.println("loadNoticeCount from " + getSessionUserId() + " count=" + count);
		if (count <= 0) {
			setResult("fail");
		} else {
			JSONObject jo = new JSONObject();
			jo.put("url", "noticePage.jsp");
			jo.put("content", "收到" + count + "条信息");
			jo.put("count", count);
			setResult(jo.toString());
		}
		return aa;
	}
	
	@Override
	public String getResult() {
		return result;
	}
	
}
