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
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/aui.css" />
    <script type="text/javascript" src="js/ext.js" ></script>
    <style type="text/css">
        .text-white {
            color: #ffffff !important;
        }
        .aui-grid [class*=aui-col-] {
            padding: 0.75rem 0;
        }
        .aui-bg-info{background-color: #16b4f2 !important;}
        .fragment{display: none;}
    </style>
</head>
<body>
    <!-- 顶部 -->
    <section class="aui-content" id="user-info" 
    	<%-- style="position:fixed;left:0px;top:0px;width:100%;" --%>
    	onclick="startUrl('setting.jsp');">
        <div class="aui-list aui-media-list aui-list-noborder aui-bg-info">
            <div class="aui-list-item-middle"> <!-- class='aui-list-item aui-list-item-middle' -->
                <div class="aui-media-list-item-inner ">
                    <div class="aui-list-item-media" style="margin-left: 10px;width: auto;">
                        <img id="headImg" src="${session.user.headImg}"
                        class="aui-img-round" style="width: 50px;height:50px">
                    </div>
                    <div class="aui-list-item-inner aui-list-item-arrow">
                        <div id="userName" class="aui-list-item-text text-white aui-font-size-18">${session.user.name}</div>
                        <div class="aui-list-item-text text-white">
                           <div><i class="aui-iconfont aui-icon-cert aui-font-size-14"></i> <span id="userCert">${session.user.unit} ${session.user.position}</span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   <!--  <div style="height: 3.5rem"></div> -->
    
    <div id="fragment1" class="fragment">
    <section class="aui-content aui-grid aui-margin-b-15">
        <div class="aui-row">
            <div class="aui-col-xs-4 aui-border-r" onclick="if(${session.user.rank<4}) {startUrl('PageAction!loadReportCreatePage',['notitle','nogesture','norefresh'])}else{android.show('您的级别太高了，未查到检查数据')}">
                <div class="aui-text-warning">
                <img src="img/安全.png" style="width: 35px;margin: auto;">
                </div>
                <div class="aui-gird-lable aui-font-size-14 " style="color: gray;">民爆库房三查</div>
            </div>
            
            <div class="aui-col-xs-4 aui-border-r" onclick="startUrl('reportHotal.jsp', ['notitle','nogesture','norefresh'])">
            	<div class="aui-text-warning">
            	<img src="img/房子.png" style="width: 35px;margin: auto;">
            	</div>
                <div class="aui-gird-lable aui-font-size-14 " style="color: gray;">旅馆行业三查</div>
            </div>
            <div class="aui-col-xs-4" onclick="startUrl('reportFirefighting.jsp',['notitle','nogesture','norefresh'])">
            	<div class="aui-text-warning">
            	<img src="img/消防车.png" style="width: 35px;margin: auto;">
            	</div>
                <div class="aui-gird-lable aui-font-size-14 " style="color: gray;">三级消防三查</div>
            </div>
        </div>
    </section>
    <section class="aui-content">
        <ul class="aui-list aui-list-in aui-margin-b-15">
        	<li class="aui-list-item" onclick="startUrl('PageAction!loadMyProblemList')">
                <div class="aui-list-item-label-icon">
                    <img alt="" src="img/正在执行.png" style="width: 20px;">
                </div>
                <div class="aui-list-item-inner aui-list-item-arrow">
                    <div class="aui-list-item-title">我待解决</div>
                    <div id=' ' class="aui-badge" style="position: static;display: none;"></div>
                </div>
            </li>
            <li class="aui-list-item" onclick="startUrl('PageAction!loadMyFinishedProblemList')">
                <div class="aui-list-item-label-icon">
                    <img alt="" src="img/结束.png" style="width: 20px;">
                </div>
                <div class="aui-list-item-inner aui-list-item-arrow">
                    <div class="aui-list-item-title">我已解决</div>
                    <div id=' ' class="aui-badge" style="position: static;display: none;"></div>
                </div>
            </li>
        	<li class="aui-list-item" onclick="historyReportClicked()">
                <div class="aui-list-item-label-icon">
                    <!-- <i class="aui-iconfont aui-icon-location aui-text-info"></i> -->
                    <img alt="" src="img/历史.png" style="width: 20px;">
                </div>
                <div class="aui-list-item-inner aui-list-item-arrow">
                    <span class="aui-list-item-title">三查情况</span>
                    <div id='reportCount' class="aui-badge" style="position: static;display: none;">99+</div>
                </div>
            </li>
        	<li class="aui-list-item" onclick="startUrl('noticePage.jsp');">
                <div class="aui-list-item-label-icon">
                    <img alt="" src="img/消息.png" style="width: 20px;">
                </div>
                <div class="aui-list-item-inner aui-list-item-arrow">
                    <div class="aui-list-item-title">我的消息</div>
                    <div id='noticeCount' class="aui-badge" style="position: static;display: none;">99+</div>
                </div>
            </li>
            <li class="aui-list-item" onclick="loadLoopCtrlUnitList()">
                <div class="aui-list-item-label-icon">
                    <img alt="" src="img/管理.png" style="width: 20px;">
                </div>
                <div class="aui-list-item-inner aui-list-item-arrow">
                    <div class="aui-list-item-title">闭环管理</div>
                    <div id='' class="aui-badge" 
                    	style="position: static;display: none;">99+</div>
                </div>
            </li>
            
           <!--  <li class="aui-list-item">
                <div class="aui-list-item-label-icon">
                    <i class="aui-iconfont aui-icon-image aui-text-info"></i>
                </div>
                <div class="aui-list-item-inner aui-list-item-arrow">
                    <div class="aui-list-item-title"></div>
                </div>
            </li> -->
        </ul>
        
        
        <div id="taskCard" class="aui-card-list" >
            <div class="userinfo-header">
                <div class="aui-info">
                    <div class="aui-info-item aui-padded-10">
                        <div style="max-height:2.2rem;overflow: hidden;">
                        <img id="taskHeadImg" src="img/defaultHead.png" style="width:2.2rem;"/></div>
                        <span id="taskUserName" class="aui-margin-l-10 aui-margin-r-10">某某某 </span>发布任务
                        <!-- <i class="aui-iconfont aui-icon-laud aui-text-info "></i> -->
                    </div>
                    <div id="taskTime" class="aui-info-item aui-padded-5">2018-03-24</div>
                </div>
            </div>
            <div id="taskContent" class="aui-margin-l-10" style="margin-top: -10px">
                	任务详情
            </div>
            <div class="aui-card-list-footer aui-border-t">
                <div><!-- <i class="aui-iconfont aui-icon-note"></i>  -->任务指数⭐</div>
                <div><!-- <i class="aui-iconfont aui-icon-laud"></i> 888 --></div>
                <div class="aui-btn aui-btn-outlined" style="padding: 2px" onclick="startUrl('historyTasks.jsp')">
               		<i class="aui-iconfont aui-icon-menu" style="font-size: 14px;margin-left: 2px"> 任务列表</i>
               	</div>
                <!-- <i class="aui-iconfont aui-icon-menu" style="font-size: 14px"> 打开任务列表</i> --></div>
           </div>
    </section>
    </div>
    <!-- <div id="fragment2" class="fragment">
    2
    </div>
    <div id="fragment3" class="fragment">
    3
    </div>
    <div id="fragment4" class="fragment">
    <iframe src="setting.jsp" width="100%" height="100%" style="border: none"></iframe>
    </div>
    <footer class="aui-bar aui-bar-tab ">
        <div class="aui-bar-tab-item aui-active" onclick="tabClicked(this,1);">
            <i class="aui-iconfont aui-icon-paper"></i>
            <div class="aui-bar-tab-label">主页</div>
        </div>
       <div class="aui-bar-tab-item" onclick="tabClicked(this,2)">
            <i class="aui-iconfont aui-icon-menu"></i>
            <div class="aui-bar-tab-label">联系</div>
        </div>
        <div class="aui-bar-tab-item" onclick="tabClicked(this,3)">
            <i class="aui-iconfont aui-icon-location"></i>
            <div class="aui-bar-tab-label">某某</div>
        </div>
        <div class="aui-bar-tab-item " onclick="tabClicked(this,4)">
            <i class="aui-iconfont aui-icon-my"></i>
            <div class="aui-bar-tab-label">用户</div>
        </div>
    </footer> -->
</body>
<script type="text/javascript" src="js/ext.js"></script>
<script type="text/javascript">
fragment1.style.display = "block";
var currentFragment = 1;
var lastTab = null;
function tabClicked(tab, n) {
	if(currentFragment==1 && n==1) {
		location.reload();
	}
	switchFragment(n);
	if(lastTab!=null) {
		removeClass(lastTab, "aui-active");
	}
	addClass(tab, "aui-active");
	currentFragment = n;
	lastTab = tab;
}
function switchFragment(n) {
	var fs = document.getElementsByClassName("fragment");
	for(var i=0;i<fs.length;i++) {
		fs[i].style.display = "none";
	}
	document.getElementById("fragment" + n).style.display = "block";
	
}

</script>
<script type="text/javascript">
var unitList = [];
//var userNames = [];
function historyReportClicked() {
	/* if(Number('${session.user.rank}')<20) {
		startReportHistory('historyReports.jsp', '${session.user.userId}');
		return;
	} */
	if(unitList.length==0) {
		ajaxPostWithEval("AjaxAction!loadMyRelativesUnits", function(res, result) {
			if(result == 'success') {
				var units = res['units'];
				//for(var i=0;i<users.length;i++) {
					//if(users[i].rank<=2) {
						//unitList.push(units[i]);
						//userNames.push(/* users[i].name +  */" "+users[i].unit+" "+users[i].position+"");
					//}
				//}
				unitList = units;
				android.showListDialog(unitList, "onHistoryReportChoosed");
			}
		}, null);
	} else {
		android.showListDialog(unitList, "onHistoryReportChoosed");
	}
}
function onHistoryReportChoosed(n) {
	//param1 for unitName, param2 for color 
	startReportHistory('historyReports.jsp?unitName='+escape(unitList[n]), unitList[n]);
}

</script>
<script type="text/javascript">
function onActivityResult(result) {
	if('logoff'==result) {
		location.href = "UserAction!logoff";
		android.show('已注销登录');
	}
}
function onResume() {
	updateBadgeNumber();
}
function onReceivedNotice() {
	updateBadgeNumber();
}
updateBadgeNumber();
function updateBadgeNumber() {
	ajaxPost('AjaxAction!loadIndexDatas',
	function(r) {
		var data = eval("("+r+")");
		result = eval("(" + data['result'] + ")");
		if(result['reportCount']=='0' || result['reportCount']=='') {
			reportCount.style.display = "none";
		} else {
			reportCount.innerText = result['reportCount'];
			reportCount.style.display = "inline-block";
		}
		if(result['noticeCount']=='0' || result['noticeCount']=='') {
			noticeCount.style.display = "none";
		} else {
			noticeCount.innerText = result['noticeCount'];
			noticeCount.style.display = "inline-block";
		}
	}, null);
}

</script>
<script type="text/javascript">
ajaxPost("AjaxAction!loadLatestTask", function(r) {
	var res = eval("("+r+")");
	var result = res['result'];
	if("success"==result) {
		var task = res['task'];
		taskHeadImg.setAttribute("src", res['headImg']);
		if(res['headImg']==null) {
			taskHeadImg.setAttribute("src", "img/defaultHead.png");
		}
		taskUserName.innerText = task.userName;
		taskContent.innerText = task.content;
		taskTitle.innerText = task.title;
		taskTime.innerText = task.time;
	}
}, {});
</script>
<script type="text/javascript">
var loopCtrlUnitList = [];
function loadLoopCtrlUnitList() {
	if('${session.user.rank==1}' == 'true') {
		startUrl('loopCtrlList.jsp?goods.unit=' + escape('${session.user.unit}'));
		return;
	} else {
		if(loopCtrlUnitList.length == 0) {
			ajaxPostWithEval("AjaxAction!loadLoopCtrlUnitList", function (res, result) {
				if(result=='success') {
					var li = res['list'];
					for(var i=0;i<li.length;i++) {
						loopCtrlUnitList.push(li[i]);
					}
					android.showListDialog(loopCtrlUnitList, "onLoopCtrlChoosed");
				};
			}, null);
		} else {
			android.showListDialog(loopCtrlUnitList, "onLoopCtrlChoosed");
		}
	}
	
}
function onLoopCtrlChoosed(n) {
	startUrl('loopCtrlList.jsp?goods.unit=' + escape(loopCtrlUnitList[n]));
}
/* var loopCtrlList = ['跃进煤矿','潘家冲煤矿','五陂煤矿','久安爆破工程','神威爆破工程'];
function startLoopCtrl() {
	if('${session.user.rank>=2}' == 'true') {
		android.showListDialog(loopCtrlList, "onLoopCtrlChoosed");
	} else {
		startUrl('loopCtrlList.jsp?goods.unit=' + escape('${session.user.unit}'));
	}
} */
</script>
<%-- <script type="text/javascript">
ajaxPostWithEval("AjaxAction!loadSessionUser", function(res, result) {
	headImg.setAttribute("src", res['user.headImg']);
	userName.innerText = res['user.name'];
	userCert.innerText = res['user.unit'] + " " + res['user.position'];
});
</script> --%>

</html>