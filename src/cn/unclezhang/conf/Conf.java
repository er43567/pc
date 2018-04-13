package cn.unclezhang.conf;

public class Conf {
	
	/*public String push_type_民爆 = "ExplosiveNotice";
	public String push_type_旅馆 = "HotalNotice";
	public String push_type_消防 = "FirefightingNotice";
	public String push_type_回复 = "ReplyNotice";
	public String push_type_任务 = "TaskNotice";*/
	
	public static final String scope_安源公安分局 = "安源公安分局";
	
	public static final int not_read_yet = 0;
	public static final int has_read = 1;
	
	
	static String explosive_rank1_contents[] = new String[] {
		"<p style='color:red'>储存库每班是否有3名以上值班守护人员值守，是否能熟练操作报警和监控器材；值守人员每小时是否携带自卫器具对库区及周围进行巡视</p>"
		,"值班室的防盗门窗是否完好无损，是否能正常使用配备的自卫器具"
		,"<p style='color:red'>储存库房的双层门（内层门是有金属网的通风栅栏门，外层门是防盗门）是否完好无损，两层门是否都向外开启。是否落实双人双锁。仓库窗户是否安装铁栅栏或金属网；在炸药库、雷管库外墙安装的白底黑字警示标志牌是否无破损</p>"
		,"防雷设施是否能正常使用，每半年是否进行检测，检测是否合格；是否配备足够且有效的灭火器，值守人员是否能熟练使用，消防水池储水量是否有15立方米，围墙外是否有15米防火隔离带"
		,"<p style='color:red'>库区及重要通道安装的具有联网报警功能的周界报警、视频监控系统是否能正常使用。库房安装的具有联网报警功能的入侵报警、视频监控系统是否完好</p>"
		,"值班室监控终端使用是否正常，是否能多画面或轮回显示所有监控图像，图像是否能保存30天。报警、视频监控是否配有备用电源"
		,"<p style='color:red'>雷管、炸药是否混存或不入库，堆放是否符合要求</p>"
		,"库区是否配备2条以上大型看护犬,犬只是否健康"
		,"库房值班登记本是否如实登记录出入库人员和车辆"
		,"围墙是否有破损，围墙顶的防攀越措施是否完好"
		,"民爆物品各项管理制度是否健全且上墙"
		,"是否制定防盗窃、防抢劫、防破坏、防火灾爆炸事故的应急处置预案并进行演练"
	};
	
	public static String explosive_rank2_contents[] = new String[] {
		"<p style='color:red'>储存库每班是否有3名以上值班守护人员值守，是否能熟练操作报警和监控器材；值守人员每小时是否携带自卫器具对库区及周围进行巡视；</p>"
		,"值班室是否安装防盗门窗，是否配备自卫器具，值班室是否设置了床铺；"
		,"<p style='color:red'>储存库房门有否是双层门，内层门是否安装有金属网的通风栅栏门，外层门是否防盗门，两层门是否都向外开启。是否落实双人双锁。仓库窗户是否安装铁栅栏或金属网；在炸药库、雷管库外墙是否安装白底黑字警示标志牌。</p>"
		,"防雷设施每半年是否进行检测，检测是否合格；是否配备足够且有效的灭火器，值守人员是否能熟练使用，消防水池储水量是否有15立方米，围墙外是否有15米防火隔离带；"
		,"<p style='color:red'>库区及重要通道是否安装具有联网报警功能的周界报警、视频监控系统，系统是否正常运行。库房是否安装具有联网报警功能的入侵报警、视频监控系统，系统是否正常运行；</p>"
		,"值班室监控终端是否能多画面或轮回显示所有监控图像，图像是否能保存30天。报警、视频监控是否配有备用电源；"
		,"<p style='color:red'>雷管、炸药是否混存或不入库，堆放是否符合要求；</p>"
		,"库区是否配备2条以上大型看护犬；"
		,"库房值班登记本是否如实登记录出入库人员和车辆；"
		,"围墙是否有破损，围墙顶的防攀越措施是否完好。"
		,"<p style='color:red'>民爆物品流向登记是否真实、清晰，账物是否相符；</p>"
		,"民爆物品各项管理制度是否健全且上墙；"
		,"是否制定防盗窃、防抢劫、防破坏、防火灾爆炸事故的应急处置预案并进行演练；"
		,"爆破作业人员基本情况是否清楚（流入、流出）；"
		,"爆破作业人员思想动态是否掌握，爆破作业人员现实表现是否清楚（是否有违法犯罪、涉毒）；"
		,"爆破作业人员（爆破工程技术人员、爆破员、安全员、保管员）是否熟悉常见的异常情况处置办法；"
		,"<p style='color:red'>检查企业单位对民爆物品储存库的自查落实情况是否到位。</p>"
	};
	
	public static String[] getExplosives(int rank) {
		switch (rank) {
		case 1:
			return explosive_rank1_contents;
		case 2:
			return explosive_rank2_contents;
		}
		return null;
	}
	
	public static String getExplosive(int rank, int whichItem) {
		return getExplosives(rank)[whichItem];
	}
	
	/*public static String getRank1Explosive(int whichItem) {
		return getExplosive(1, whichItem);
	}
	*/
}
