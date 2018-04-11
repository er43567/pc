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
	
	
	public static String explosive_contents[] = new String[]{
		"储存库每班是否有3名以上值班守护人员值守，是否能熟练操作报警和监控器材；值守人员每小时是否携带自卫器具对库区及周围进行巡视；"
		,"值班室的防盗门窗是否完好无损，是否能正常使用配备的自卫器具；"
		,"储存库房的双层门（内层门是有金属网的通风栅栏门，外层门是防盗门）是否完好无损，两层门是否都向外开启。是否落实双人双锁。仓库窗户是否安装铁栅栏或金属网；在炸药库、雷管库外墙安装的白底黑字警示标志牌是否无破损；"
		,"防雷设施是否能正常使用，每半年是否进行检测，检测是否合格；是否配备足够且有效的灭火器，值守人员是否能熟练使用，消防水池储水量是否有15立方米，围墙外是否有15米防火隔离带；"
		,"库区及重要通道安装的具有联网报警功能的周界报警、视频监控系统是否能正常使用。库房安装的具有联网报警功能的入侵报警、视频监控系统是否完好；"
		,"值班室监控终端使用是否正常，是否能多画面或轮回显示所有监控图像，图像是否能保存30天。报警、视频监控是否配有备用电源"
		,"雷管、炸药是否混存或不入库，堆放是否符合要求；"
		,"库区是否配备2条以上大型看护犬,犬只是否健康；"
		,"库房值班登记本是否如实登记录出入库人员和车辆；"
		,"围墙是否有破损，围墙顶的防攀越措施是否完好；"
		,"民爆物品各项管理制度是否健全且上墙；"
		,"是否制定防盗窃、防抢劫、防破坏、防火灾爆炸事故的应急处置预案并进行演练。"
	};
	
}
