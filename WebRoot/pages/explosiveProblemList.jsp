<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>列表</title>
    <link rel="stylesheet" type="text/css" href="../css/aui.css"/>
    <script type="text/javascript" src="js/ext.js" ></script>
    <style type="text/css">
    .aui-list {display: none;}
    .aui-list-item .aui-list-item-text {padding: 3px;}
    </style>
</head> 
<body>
    <div class="aui-content-padded">
        <p>流程管控</p>
    </div>
    <div class="aui-content aui-margin-b-15">
        <ul class="aui-list">
        	<s:iterator id="item" value="#request.problems">
	           <li class="aui-list-item" onclick="itemClicked('${item.sid}');">
	                <div class="aui-list-item-inner">
	                    <div class="aui-list-item-text">
							${item.text}
	                		<%-- <br>(备注：${item.rem}) --%>
						</div>
	                    <div class="aui-list-item-right">
	                    	<s:if test="#item.state=='dealing'">
	                        	<div class="aui-label aui-label-info">处理中</div>
	                        </s:if>
	                        <s:elseif test="#item.state=='finished'">
	                        	<div class="aui-label aui-label-success">已解决</div>
	                        </s:elseif>
	                        <s:else>
	                        	<div class="aui-label aui-label-warning">新问题</div>
	                        </s:else>
	                    </div>
	                </div>
	            </li>
        	</s:iterator>
        	
        	
           <%-- <li id="item1" class="aui-list-item" onclick="itemClicked(this);">
               <div class="aui-list-item-inner">
                    <div class="aui-list-item-text">
                   	储存库每班是否有3名以上值班守护人员值守，是否能熟练操作报警和监控器材；值守人员每小时是否携带自卫器具对库区及周围进行巡视；
                	(备注：${request.report.item1})
                	</div>
               </div>
           </li>
           <li id="item2" class="aui-list-item" onclick="itemClicked(this);">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	值班室的防盗门窗是否完好无损，是否能正常使用配备的自卫器具；
                	(备注：${request.report.item2})
                	</div>
               </div>
           </li>
           <li id="item3" class="aui-list-item" onclick="itemClicked(this);">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	储存库房的双层门（内层门是有金属网的通风栅栏门，外层门是防盗门）是否完好无损，两层门是否都向外开启。是否落实双人双锁。仓库窗户是否安装铁栅栏或金属网；在炸药库、雷管库外墙安装的白底黑字警示标志牌是否无破损；
                   (备注：${request.report.item3})
                   </div>
               </div>
           </li>
           <li id="item4" class="aui-list-item" onclick="itemClicked(this);">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	防雷设施是否能正常使用，每半年是否进行检测，检测是否合格；是否配备足够且有效的灭火器，值守人员是否能熟练使用，消防水池储水量是否有15立方米，围墙外是否有15米防火隔离带；
                	(备注：${request.report.item4})
                </div>
               </div>
           </li>
           <li id="item5" class="aui-list-item" onclick="itemClicked(this);">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	 库区及重要通道安装的具有联网报警功能的周界报警、视频监控系统是否能正常使用。库房安装的具有联网报警功能的入侵报警、视频监控系统是否完好；
                   	(备注：${request.report.item5})
                   </div>
               </div>
           </li>
           
           <li id="item6" class="aui-list-item" onclick="itemClicked(this);">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	值班室监控终端使用是否正常，是否能多画面或轮回显示所有监控图像，图像是否能保存30天。报警、视频监控是否配有备用电源；
                	(备注：${request.report.item6})
                </div>
               </div>
           </li>
           
           <li id="item7" class="aui-list-item" onclick="itemClicked(this);">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
					雷管、炸药是否混存或不入库，堆放是否符合要求；
					(备注：${request.report.item7})
                   </div>
               </div>
           </li>
           
           <li id="item8" class="aui-list-item" onclick="itemClicked(this);">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
					库区是否配备2条以上大型看护犬,犬只是否健康；
					(备注：${request.report.item8})
                   </div>
               </div>
           </li>
           
           <li id="item9" class="aui-list-item" onclick="itemClicked(this);">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	库房值班登记本是否如实登记录出入库人员和车辆；
                   	(备注：${request.report.item9})
               		</div>
               </div>
           </li>
           
           <li id="item10" class="aui-list-item" onclick="itemClicked(this);">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	围墙是否有破损，围墙顶的防攀越措施是否完好；
                   	(备注：${request.report.item10})
                   </div>
               </div>
           </li>
           <li id="item11" class="aui-list-item" onclick="itemClicked(this);">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	民爆物品各项管理制度是否健全且上墙；
                   	(备注：${request.report.item11})
                </div>
               </div>
           </li>
           <li id="item12" class="aui-list-item" onclick="itemClicked(this);">
               <div class="aui-list-item-inner">
                   <div class="aui-list-item-text">
                   	是否制定防盗窃、防抢劫、防破坏、防火灾爆炸事故的应急处置预案并进行演练。
                   	(备注：${request.report.item12})
                	</div>
               </div>
           </li> --%>
        </ul>
    </div>
</body>
<style type="text/css">
.aui-list {display: block;}
</style>
<script type="text/javascript">
/* var choices = '${request.problem.choices}';
var reportId = '${request.problem.ref}';
var items = document.getElementsByClassName("aui-list-item");
for(var i=1;i<items.length;i++) {
	if(choices.substring(i-1,i)=='1') {
		items[i-1].style.display="none";
	}
}; */
function itemClicked(sid) {
	startUrl("PageAction!loadProblemPage?problem.sid=" + sid);
}

function onResume() {
	location.reload();
}
</script>
</html>